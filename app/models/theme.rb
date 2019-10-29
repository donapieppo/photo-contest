class Theme < ApplicationRecord
  has_many :photos

  def to_s
    title
  end
end

