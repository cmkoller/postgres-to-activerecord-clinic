require "sinatra"
require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../models/dog"
require_relative "../../models/owner"

describe Dog do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:age) }
  it { should belong_to(:owner) }

end
