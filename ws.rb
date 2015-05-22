require 'sinatra'
require 'slosilo'
require 'slosilo/adapters/memory_adapter'
require 'json'

adapter = Slosilo::adapter = Slosilo::Adapters::MemoryAdapter.new
adapter.put_key "own", File.read('service.pem')

post '/users/:login/authenticate' do
  login = params[:login]
  password = request.body.read
  content_type "application/json"
  JSON.pretty_generate Slosilo[:own].signed_token(login)
end
