class ApplicationController < ActionController::Base

  def hello
    render plain: "hello, this is a test"
  end
end
