## Gimmiea
##
## An open API for the generation of useless 
## (and sometimes useful) stuff.
##
## Written by Frank Caron
## 2013
## frankcaron.com

require 'sinatra'
require 'json'
require 'sinatra/advanced_routes'
require_relative 'helpers'

## ==========
## Gimmeias
## ==========

# Gimmiea Day
get '/weekday' do
    #return today
end

# Giimmiea Date
get '/date' do
    #return today
end

# Gimmiea Token
get '/token' do
    #return today
end

# Gimmiea Password
get '/password' do
    #return today
end

# Gimmiea Slogan
get '/slogan' do
    #return today
end

# Gimmiea Catch Phrase
get '/catchphrase' do
    #return today
end

# Gimmiea Forgot Password Question
get '/question' do
    #return today
end

# Gimmiea gimmie
get '/' do
  
  # Set Content Type
  content_type :json
  
  # Construct route map
  routes = { 
    :title => 'Gimmiea',
    :description => 'Gimmiea is an open, public API that allows you to grab or generate simple, routine things quickly and via a RESTful API.',
    :rationale => 'Gimmiea is in service of the ideal of "Voltron", an application which can be built solely from APIs. The app is dead; long live the API.',
    :author => 'frank@frankcaron.com',
    :author_url => 'http://www.frankcaron.com',
    :links => print_routes 
  }

  # Return jsonified route map  
  return JSON.pretty_generate(routes)
end

