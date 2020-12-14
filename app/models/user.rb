# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tweets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_one_attached :avatar
end
