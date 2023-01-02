class ApplicationController < ActionController::Base
  def hello
    render html: "hello this is the beginning of sample app."
  end
end
