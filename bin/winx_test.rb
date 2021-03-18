#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "../lib/cli"
require_relative "../lib/scrape"
require_relative "../lib/winx"


CLI.new.run