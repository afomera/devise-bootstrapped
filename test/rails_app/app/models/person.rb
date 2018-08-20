# frozen_string_literal: true

class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :lockable,
    :recoverable, :registerable, :rememberable, :validatable
end
