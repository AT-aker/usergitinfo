# frozen_string_literal: true

class User < ApplicationRecord
  has_many :repos, dependent: :destroy

  validates :login, presence: true
  validates :full_name, presence: true
end
