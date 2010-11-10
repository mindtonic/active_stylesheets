# Active Stylesheets
#
# Author:: Jay Sanders (mailto:mindtonic@gmail.com)
# Copyright:: Copyright (c) 2010
# License:: MIT
#
# Original inspiration came from Patrick Espake (mailto:patrickespake@gmail.com)
# and his Stylesheet By Browser Plugin.
#
# This helper adds stylesheets to your layout in response to the
# User's browser, and the current Controller and Controller Action
# of your application.  It adds the Stylesheets in the following
# order to allow for proper cascading of the browser sheets:
#  + Controller stylesheet
#  + Action stylesheet
#  + Broswer stylesheet
#  + Universal Explorer stylesheet
#
# This helper provides one method: active_stylesheets
# Place this method in the header of your layout following
# your universal stylesheets.  You may also add any options
# that are included as part of stylesheet_link_tag
#
# Version 0.1 November, 2010

require 'active_stylesheets'
module ActiveStylesheetsHelper
  include ActiveStylesheets

  # Helper insert the stylesheet according to the browser.
	# It also provides stylesheets based on the current controller
	# and the current controller action.
  # The helper also checks that the stylesheet exists before including it.
  #
  # Example of use:
  #   <%= active_stylesheets %>
  #   <%= active_stylesheets :media => "all" %>
  #   <%= active_stylesheets :media => "print" %>
  #   <%= active_stylesheets :media => "screen" %>
  def active_stylesheets(options = {})
  	result = Array.new
  	
  	# Add Controller and/or Controller Action Stylesheet if they exist
		for stylesheet in ["#{controller_name}/#{controller_name}", "#{controller_name}/#{action_name}"]
			result << stylesheet_link_tag(stylesheet, options) if stylesheet_exists(stylesheet)
		end
  	
		# Add Browser Specific Stylesheet
    unless user_agent_name.nil?
      result << stylesheet_link_tag("browsers/#{user_agent_name.to_s}", options) if stylesheet_exists("browsers/#{user_agent_name.to_s}")
    end
   	
   	# If Explorer, return Universal Explorer Stylesheet
    if is_explorer? and stylesheet_exists("browsers/#{explore_stylesheet_name.to_s}")
    	result << stylesheet_link_tag("browsers/#{explore_stylesheet_name.to_s}", options) 
    end    
    
    result.join('
').html_safe
  end
end