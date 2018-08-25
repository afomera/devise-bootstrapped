# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_person!, unless: :devise_controller? || :devise_invitable_controller?

  protected

  # https://stackoverflow.com/a/16364926/3109926
  def authenticate_person!(options = {})
    if person_signed_in?
      super
    else
      redirect_to new_person_session_url
    end
  end
end
