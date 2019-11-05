class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :photos

  validates :email, uniqueness: { case_sensitive: false }
  validate :adult
  has_one_attached :id_card

  def to_s
    name + ' ' + surname
  end

  def data_complete?
    ! (name.blank? || surname.blank? || email.blank? || birthdate.blank? || birthplace.blank? || cf.blank? || id_card.blank?)
  end

  def manager?
    ['donapieppo@yahoo.it'].include?(email)
  end

  def jury?
    ['donapieppo@yahoo.it'].include?(email)
  end

  private 

  def adult
    if (self.birthdate > (18.years.ago).to_date)
      errors.add(:birthdate, 'Non è possibile iscriversi. È richiesto di essere maggiorenni.')
    end
  end
end
