require 'json'
require 'unicorn'
require 'sinatra'
require 'mongo'
require 'newrelic_rpm'

include Mongo

# I was using MongoClient.new for previous mongo version. Revised to Mongo::Client.new
#db = MongoClient.new("localhost", 27017).db("new_mydb")
# coll = db.collection("testCollection")
db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'new_mydb')

get '/' do
	#@items = coll.find()
	@items = db[:words].find()
	erb :home	
end

get '/:word'do
  # word = coll.insert({item: params[:word]})
  word = db[:words].insert_one({item: params[:word]})
  redirect '/'
end

