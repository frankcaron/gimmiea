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

before '/*' do
  # Set Content Type
  content_type :json
end


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
    m = { :today => p }
    return JSON.pretty_generate(m)
end

# Giimmiea Date
get '/date' do
    #return today
    m = { :date => Time.now }
    return JSON.pretty_generate(m) 
end

# Gimmiea D6 roll
get '/d6' do
    m = { :dice_face => 1 + rand(6) }
    return JSON.pretty_generate(m) 
end

# Gimmiea D20 roll
get '/d20' do
    #return today
    m = { :dice_face => 1 + rand(6) }
    return JSON.pretty_generate(m) 
end

# Gimmiea random number up to 100 from 0
get '/number' do
    m = { :number => rand(100) }
    return JSON.pretty_generate(m) 
end

# Gimmiea random number up to upper bound from 0
get '/number/:upper_bound' do |upper_bound|
    m = { :number => rand(params[:upper_bound].to_i) }
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
    m = { :catchphrase => pick_slogan }
    return JSON.pretty_generate(m)
end

# Gimmiea Catch Phrase
get '/catchphrase' do
    m = { :catchphrase => pick_catchphrase }
    return JSON.pretty_generate(m)
end

# Gimmiea Forgot Password Question
get '/reset-password-question' do
    m = { :question => pick_question }
    return JSON.pretty_generate(m)
end

# Gimmiea gimmie
get '/' do

  # Construct route map
  routes = { 
    :title => 'Gimmiea',
    :description => 'Gimmiea is an open, public, free service that allows you to grab or generate simple, routine things quickly and via a RESTful API.',
    :rationale => 'Gimmiea is in service of the ideal of "Voltron", an application which can be built solely from APIs. The app is dead; long live the API.',
    :author => 'frank@frankcaron.com',
    :author_url => 'http://www.frankcaron.com',
    :links => print_routes 
  }

  # Return jsonified route map  
  return JSON.pretty_generate(routes)
end

# 404 handler
get '/*' do
  m = { :fourohfour => "Gimmie gimmie never gets. 'Twas no handler for your get." }
  return JSON.pretty_generate(m)
end 

