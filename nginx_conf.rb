require 'fileutils'

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
    elsif key == 'HOSTNAMES'
      apps[app][:hostnames] = value.split(',')
    end
  end 
end

# copy default nginx site conf template and replace tokens

apps.each do |app|
  p app
  config_path = "/etc/nginx/sites-enabled/#{app}"
  FileUtils.cp '/nginx-template.conf', config_path

  content = File.open(config_path).read
  content.gsub! '{{hostnames}}', app[:hostnames].join(' ')
  content.gsub! '{{container-ip}}', app[:ip]
  
  write the new config to the actual file
  File.open(config_path, 'w') { |file| file.puts content }
end
