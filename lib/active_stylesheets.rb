# Delivers a Stylesheet to the Browser based on the current
# Controller and Action
#
# Author:: Jay Sanders (mailto:patrickespake@gmail.com)
# Copyright:: Copyright (c) 2010
# License:: MIT
#
# Original inspiration came from Patrick Espake (mailto:patrickespake@gmail.com)
# and his Stylesheet By Browser Plugin.
#
# This module detects user's browser, checks whether a stylesheet exists
# and provides a method which declares the name of the universal explorer
# stylesheet.
#
# Provides four methods:
#   user_agent_name
#   is_explorer?
#   explorer_stylesheet_name
#   stylesheet_exists
module ActiveStylesheets
  private

  # Name of the user's browser
  #
  # Example of use:
  #   user_agent_name  
  def user_agent_name
    ua = request.user_agent.downcase

    if ua =~ /msie 6/
      :ie6
    elsif ua =~ /msie 7/
    	:ie7
    elsif ua =~ /msie 8/
      :ie8
    elsif ua =~ /firefox\//
      :firefox
    elsif ua =~ /opera\//
      :opera
    elsif ua =~ /chrome\//
      :chrome
    elsif ua =~ /safari\//
      :safari
    else
      nil
    end
  end
  
  # Tests to see if the browser is internet explorer
  #
  # Example of use:
  #   is_explorer?  
  def is_explorer?
  	request.user_agent.downcase =~ /msie/
  end
  
  # Name of the explorer_stylesheet
  #
  # Example of use:
  #   explorer_stylesheet_name  
  def explorer_stylesheet_name
  	:ie
  end
  
  # Method to check that a stylesheet exists in the stylesheets folder
  #
  # Example of use:
  #   explorer_stylesheet_name  
	def stylesheet_exists( file_name )
	  File.exists? "#{RAILS_ROOT}/public/stylesheets/#{file_name.to_s}.css"
	end

end