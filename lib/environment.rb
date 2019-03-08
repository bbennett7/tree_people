# Environment -> The single file that bin/tree_people, or anything else that I'm
# loading, can require, and then THIS file will require all of ther dependencies
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./tree_people/version"
require_relative "./tree_people/cli"
require_relative "./tree_people/location"
require_relative "./tree_people/event_type"
require_relative "./tree_people/day_of_week"
require_relative "./tree_people/time_of_day"
require_relative "./tree_people/all_events"
