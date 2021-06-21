class ApplicationController < ActionController::Base

  def hello
    render text: "Hello test :)"
  end
end
