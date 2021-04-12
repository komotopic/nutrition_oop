require "bundler"
require "dotenv/load"
Bundler.require

require_relative './nutrition_project/version.rb'
require_relative './nutrition_project/api.rb'
require_relative './nutrition_project/cli.rb'
require_relative './nutrition_project/nutrition_data.rb'
