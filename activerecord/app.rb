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

get '/dogs' do
  dogs = Dog.all

  erb :"dogs/index", locals: { dogs: dogs }
end

get '/dogs/new' do
  owners = Owner.all
  erb :"/dogs/new", locals: { owners: owners, dog: Dog.new }
end

post '/dogs' do
  dog = Dog.new(name: params[:name], age: params[:age], owner_id: params[:owner_id])

  if dog.save
    # Assuming we have the flash gem set up:
    # flash[:success] = "You did it!"
    redirect "/dogs"
  else
    # flash[:error] = dog.errors.full_messages
    erb :"/dogs/new", locals: { owners: Owner.all, dog: dog }
  end

end
