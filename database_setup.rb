require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/event'

DATABASE_NAME = "#{ENV['DATABASE_PREFIX']}_#{ENV['RACK_ENV']}"
DATABASE_URL = "postgres://#{ENV['DATABASE_USER']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}/#{DATABASE_NAME}"

# Now let's set up a connection with a database
DataMapper.setup(:default, DATABASE_URL)
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
