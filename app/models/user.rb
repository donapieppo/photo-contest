class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :photos
  has_many :videos

  validates :email, uniqueness: { case_sensitive: false }
  validates :cf, uniqueness: { case_sensitive: false, allow_blank: true }
  validate :adult
  has_one_attached :id_card

  attr_accessor :id_card_missing_error

  def to_s
    name + ' ' + surname
  end

  def data_complete?
    self.jury? and return true
    id_card.blank? and self.id_card_missing_error = 'Si prega di inserire la fotocopia del documento di identità'
    ! (name.blank? || surname.blank? || email.blank? || birthdate.blank? || birthplace.blank? || cf.blank? || id_card.blank?)
  end

  def manager?
    ADMINS.include?(email)
  end

  def jury?
    JURY.include?(email)
  end

  private 

  def adult
    if (self.birthdate && self.birthdate > (18.years.ago).to_date)
      errors.add(:birthdate, 'Non è possibile iscriversi. È richiesto di essere maggiorenni.')
    end
  end
end
