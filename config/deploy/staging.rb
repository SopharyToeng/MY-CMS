set :production

set :app_name, 'CCCA-Website'

server '52.221.160.164', user: 'deployer', roles: %w{app web db}
