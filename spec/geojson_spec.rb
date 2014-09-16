#!/usr/bin/env rake

require 'json'
require 'rainbow/ext/string'

namespace :test do
  desc 'Validate GeoJSON'
  task :geojson do
    geojson_file = File.read('cities.geojson')

    puts 'Validating cities.geojson syntax'.color(:blue)
    begin
      JSON.load(geojson_file)
      puts 'OK'.color(:green)
    rescue JSON::ParserError
      abort 'Syntax Error!'.color(:red)
    end
  end
end
