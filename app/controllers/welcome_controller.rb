class WelcomeController < ApplicationController
  def landing
    puts "-" * 15
    puts params[:first_name]
    puts "-" * 15
  end
end
