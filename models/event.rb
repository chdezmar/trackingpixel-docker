require 'data_mapper'
require 'dm-postgres-adapter'
require 'json'

# This class corresponds to a table in the database
class Event

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'links' table
  property :id, Serial # Serial means that it will be auto-incremented for every record
  property :session_id, String
  property :event_type, String
  property :time_stamp, DateTime, :default => lambda{ |p,s| DateTime.now}

  def serialize
    h = {
      'session_id': self.session_id,
      'event_type': self.event_type,
      'time_stamp': self.time_stamp
    }
    return h
  end


end
