# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :image_elements
end
