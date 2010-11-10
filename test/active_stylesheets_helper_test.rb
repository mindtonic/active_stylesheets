require 'test_helper'
require 'action_controller'
require 'action_controller/test_process'
require 'action_view/test_case'

include StylesheetByBrowserHelper

class StylesheetByBrowserHelperTest < ActionView::TestCase
  attr_accessor :request

  def setup
    self.request = ActionController::TestRequest.new
  end

  def test_should_stylesheet_by_firefox
    request.env["HTTP_USER_AGENT"] = "Mozilla/5.0 (X11; U; Linux i686; pt-BR; rv:1.9.0.12) Gecko/2009070818 Ubuntu/8.10 (intrepid) Firefox/3.0.12"
    assert_match(/firefox.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_opera
    request.env["HTTP_USER_AGENT"] = "Opera/9.64 (X11; Linux i686; U; pt-BR) Presto/2.1.1"
    assert_match(/opera.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_chrome
    request.env["HTTP_USER_AGENT"] = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.37 Safari/530.5"
    assert_match(/chrome.css/, active_stylesheets)
  end
  
  def test_should_stylesheet_by_ie6
    request.env["HTTP_USER_AGENT"] = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Trident/4.0; GTB6)"
    assert_match(/ie6.css/, active_stylesheets)
  end
  
  def test_should_stylesheet_by_ie7
    request.env["HTTP_USER_AGENT"] = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; GTB6)"
    assert_match(/ie7.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_ie7
    request.env["HTTP_USER_AGENT"] = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6)"
    assert_match(/ie8.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_ie
    request.env["HTTP_USER_AGENT"] = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6)"
    assert_match(/ie.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_safari
    request.env["HTTP_USER_AGENT"] = "Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/53"
    assert_match(/safari.css/, active_stylesheets)
  end

  def test_should_stylesheet_by_bla
    request.env["HTTP_USER_AGENT"] = "bla bla bla bla bla bla bla"
    assert_equal(nil, active_stylesheets)
  end
end
