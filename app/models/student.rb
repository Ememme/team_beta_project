class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :tenancy_contract, dependent: :destroy
  has_one :room, through: :tenancy_contract
  has_and_belongs_to_many :expenses, join_table: :contributor_expenses
  has_many :announcements


  validates :nickname, allow_blank: true,

                       uniqueness: { case_sensitive: false },
                       length: { minimum: 1, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, allow_blank: true,
                                     format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },
                                     length: { maximum: 30 }

  validates :id_number, allow_blank: true,
                        uniqueness: true,
                        format: { with: /\A[A-Z0-9-]+\z/ }
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validate :avatar_size_validation

  private
   def avatar_size_validation
     errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
   end
end
