class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  # set different User roles
  ROLES = %w[admin moderator student]

  # validates password and email
  validates :password, length: { minimum: 3 }, :on=>[:create, :update]
  validates :password, confirmation: true, :on=>[:create, :update]
  validates :password_confirmation, presence: true, :on=>[:create, :update]

  validates :email, presence: true, email: true, uniqueness: true
  
  has_many :ratings

  has_many :events_users
  has_many :events, through: :events_users

  has_one :profile, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :profile

end
