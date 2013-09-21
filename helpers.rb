## Gimmiea Helpers
##
##
## Written by Frank Caron
## 2013
## frankcaron.com

require 'sinatra'

# This helper will dynamically enumerate all of the routes
# and return back a hash with the routes mapped to strings
# relative to the route. 
#
# This is used to dynamcially create the HATEOAS-ish 
# route list object returned at the root so gimmies
# can be traversed programatically. 

def print_routes 
   
    # Create a new hash
    h = Hash.new()

    # Use Sinatra advanced routes
    # to build out a hash based on the routes
    Sinatra::Application.each_route do |route|
        unless route.path.eql? "/" or route.path.eql? "/*"
            h[route.path.split("/")[1]] = request.base_url + route.path 
        end
    end

    # Return that badboy
    return h

end

# This helper pics a random catch phrase.
def pick_catchphrase
    return File.readlines(File.dirname(__FILE__) + "/catchphrases.txt").sample.tr("\n","")
end

# This helper pics a random slogan.
def pick_slogan
    return File.readlines(File.dirname(__FILE__) + "/slogans.txt").sample.tr("\n","")
end

# This helper pics a random question for reset password requests.

def pick_question
    return File.readlines(File.dirname(__FILE__) + "/questions.txt").sample.tr("\n","")
end