# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_person!, unless: :devise_controller?

  protected

  def authenticate_person!
    puts "In my authenticate_person!"
    if person_signed_in?
      super
    else
      redirect_to new_person_session_url
    end
  end
end
