require "sinatra"
require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../models/owner"
require_relative "../../models/dog"

describe Owner do
  it { should validate_presence_of(:name) }
  it { should have_many(:dogs) }
end
