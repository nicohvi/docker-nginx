require 'fileutils'
require 'net/http'
require 'yaml'

# find all linked containers through environment variables
apps = { }

ENV.each do |env, value|
  env_parts = env.split('_')
  
  # custom environment variables added through docker run -e
  if env_parts[0] == 'APP' 
    app = env_parts[1]
    apps[app] ||= { }
    key = env_parts.last
    if key == 'ADDR' 
      apps[app][:ip] = value
    elsif key == 'HOST'
      apps[app][:host] = value
    end
  end 
end

p apps
# copy default nginx site conf template and replace tokens

#apps.each do |container, app|
  # get details from app container
