class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_one_attached :id_card, dependent: :destroy
  has_one_attached :release_document, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }
  validates :cf, uniqueness: { case_sensitive: false, allow_blank: true }
  validate :adult

  attr_accessor :id_card_missing_error
  attr_accessor :privacy_policy

  def cn
    "#{name} #{surname}"
  end

  def to_s
    cn
  end

  def data_complete?
    self.jury? and return true
    id_card.blank? and self.id_card_missing_error = 'Occorre allegare la fotocopia di un documento di identità.'
    ! (name.blank? || surname.blank? || email.blank? || birthdate.blank? || birthplace.blank? || cf.blank? || id_card.blank?)
  end

  def manager?
    ADMINS.include?(email)
  end

  def jury?
    JURY.include?(email)
  end

  def jury_or_manager?
    manager? || jury?
  end

  def participant?
    ! jury_or_manager?
  end

  private 

  def adult
    if (self.birthdate && self.birthdate > (18.years.ago).to_date)
      errors.add(:birthdate, 'Non è possibile iscriversi. È richiesto di essere maggiorenni.')
    end
  end
end
