require 'json'
require 'unicorn'
require 'sinatra'
require 'mongo'
require 'newrelic_rpm'

include Mongo

db = MongoClient.new("localhost", 27017).db("new_mydb")
coll = db.collection("testCollection")

get '/' do
	coll.find()	
end

get '/:word'do
  word = coll.insert({item: params[:word]})
  redirect '/'
end

