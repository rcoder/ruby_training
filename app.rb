#!/usr/bin/env ruby

###
# Description: A simple word game for the web
# Author: <your name + email here>
###

require 'json'

require 'rubygems'
require 'sinatra'

$LOAD_PATH << File.dirname(__FILE__) + "/lib"
STDERR.puts $LOAD_PATH.inspect
require 'phrase'

configure do
  # Hint: load phrases from data/phrases.json using the Phrase class
end

get '/' do
  # Hint: pick a random phrase and display the form
  erb :index
end

get '/show/:phrase' do
  # Hint: look up the phrase, then populate it with the words from the form
end
