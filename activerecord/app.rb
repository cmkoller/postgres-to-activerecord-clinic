require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

def db_connection
  begin
    connection = PG.connect(dbname: 'dog_park')
    yield (connection)
  ensure
    connection.close
  end
end

get '/dogs' do
  dogs = db_connection do |conn|
    conn.exec("SELECT * FROM dogs;")
  end

  erb :"dogs/index", locals: { dogs: dogs }
end

get '/dogs/new' do
  owners = db_connection do |conn|
    conn.exec("SELECT * FROM owners;")
  end
  erb :"/dogs/new", locals: { owners: owners }
end

post '/dogs' do
  db_connection do |conn|
    conn.exec_params(
      "INSERT INTO dogs (name, age, owner_id) VALUES ($1, $2, $3)",
      [params[:name], 0, params[:owner]]
    )
  end

  redirect "/dogs"
end
