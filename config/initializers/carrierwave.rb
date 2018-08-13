
# CarrierWave.configure do |config|
#   config.permissions = 0666
#   config.directory_permissions = 0777
#   config.fog_provider = 'fog/awes'
#   config.fog_credentials = {
#     provider:              'AWS',                        
#     aws_access_key_id:     'xxx',                        
#     aws_secret_access_key: 'yyy',                        
#     region:                'eu-west-1',                  

#   }
#   config.fog_directory  = 'name_of_bucket'                                      # required
#   config.fog_public     = false                                                 # optional, defaults to true
#   config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
# end