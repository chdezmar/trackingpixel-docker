require 'sinatra/base'
require_relative 'database_setup'
require 'json'

class Trackingpixel < Sinatra::Base

  def build_response(success, data)
    if !success
      data = {
        'error_message': data
      }
    end

    h = {
      'status': success ? 'success' : 'error',
      'data': data
    }
    return h.to_json
  end


  get '/' do
    event = Event.new(session_id: params[:session_id], event_type: params[:event_type])
    event.save
    build_response(true, event.serialize)
  end

  get '/sessions/:session_id/' do
    event = Event.first(:session_id => params[:session_id])
    if event == nil
      return build_response(false, "EVENT NOT FOUND")
    end
    build_response(true, event.serialize)
  end

  set :bind, '0.0.0.0'
  set :port, ENV.fetch('PORT', 4567)

  run! if app_file == $0
end
