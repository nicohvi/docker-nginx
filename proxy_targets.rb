require 'fileutils'
require 'net/http'
require 'yaml'

# find all linked containers through environment variables
apps = {}

ENV.each do |env, value|
  env_parts = env.split('_')
  
  # custom environment variables added through docker run -e
  if env_parts[0] == 'APP' 
    p "this is app env: #{env_parts}"
    # apps[container] ||= { }
    
    # env_parts[0] == 'APP' && env_parts[2] == 'PORT'
    #container = env_parts[1].downcase
    # = value.sub(/^.*?:\/\//, '').split(':')
    #apps[container] = {}
    #apps[container][:ip] = ip_port[0]
    #apps[container][:port] = ip_port[1]
  end
end

# copy default nginx site conf template and replace tokens

#apps.each do |container, app|
  # get details from app container
