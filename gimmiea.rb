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
    case Time.now.wday
    when 0
      p = "Sunday"
    when 1
      p = "Monday"
    when 2
      p = "Tuesday"
    when 3
      p = "Wednesday"
    when 4
      p = "Thursday"
    when 5
      p = "Friday"
    when 6
      p = "Saturday"
    else
      p = "Funday"
    end
    m = { :day => p }
    return JSON.pretty_generate(m)
end

# Giimmiea Date
get '/date' do
    #return today
    m = { :date => Time.now }
    return JSON.pretty_generate(m) 
end

# Gimmiea Token
get '/token' do
    m = { :token => SecureRandom.urlsafe_base64(nil, false) }
    return JSON.pretty_generate(m) 
end

# Gimmiea Nonce
get '/nonce' do
    m = { :nonce => (0...8).map { (65 + rand(26)).chr }.join }
    return JSON.pretty_generate(m) 
end

# Gimmiea Password
get '/password' do
    m = { :password => (0...16).map { (65 + rand(54)).chr }.join }
    return JSON.pretty_generate(m) 
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

# Gimmiea gimmie never gets
get '/*' do
  m = { :fourohfour => "Gimmie gimmie never gets. 'Twas no handler for your get." }
  return JSON.pretty_generate(m)
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

