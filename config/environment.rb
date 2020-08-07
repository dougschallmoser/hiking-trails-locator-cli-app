require 'pry'
require 'nokogiri'
require 'json'
require 'geocoder'
require 'open-uri'
require 'net/http'
require 'colorize'
require 'sqlite3'
require 'rake'
require 'require_all'


require_relative '../lib/trail.rb'
require_relative '../lib/trail_importer.rb'
require_relative '../lib/trail_det_importer.rb'
require_relative '../lib/trail_searcher.rb'

DB = {
    :conn => SQLite3::Database.new('db/trails-development.sqlite')
}

Trail.clear_all
Trail.create_table