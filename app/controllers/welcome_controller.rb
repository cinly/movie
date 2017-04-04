class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Welcome to Movie Home!"
  end
end
