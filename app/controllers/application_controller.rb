class ApplicationController < ActionController::Base

  def hello
    render text: "hello, this is a test"
  end
end
