require 'sinatra'
require 'json'

require './rpn.rb'

$rpns = {}

helpers do 
  #Each user gets their own RPN
  def find_rpn key
    $rpns[key] ||= RPNCalculator.new
  end

  def json_error msg
    {:error => msg}.to_json
  end
end

put '/rpn/' do
  unless env['HTTP_X_RPN_API_KEY']
    halt 401, json_error('missing X-RPN-API-KEY header')
  end
  data = JSON.parse request.body.read, :symbolize_names => true 
  rpn = find_rpn( env['HTTP_X_RPN_API_KEY'] )

  begin
    result = rpn.evaluate(data[:expression])
    {:result => result}.to_json
  rescue Exception => e
    status 400
    json_error e.message
  end 
 
end

