require 'sinatra/base'
require 'json'
require 'bibliothecary'
require 'active_support'

class BibliothecaryWeb < Sinatra::Base

  Bibliothecary.configure do |config|
    config.mix_parser_host = 'http://mix:5001'
    config.clojars_parser_host = 'http://clojars:5005'
    config.carthage_parser_host = 'http://carthage:5004'
    config.gradle_parser_host = 'http://gradle:5003'
    config.yarn_parser_host  = 'http://yarn:5002'
    config.swift_parser_host = 'http://swift:5006'
  end

  before do
    if request.body.size > 0
      request.body.rewind
      @params = ActiveSupport::JSON.decode(request.body.read)
    end
  end

  post '/identify_manifests' do
    content_type :json

    file_names = @params["file_names"]
    Bibliothecary.identify_manifests(file_names).to_json
  end

  post '/analyse_file' do
    content_type :json

    file_name = @params['file_name']
    file_contents = @params['file_contents']
    Bibliothecary.analyse_file(file_name, file_contents).to_json
  end
end
