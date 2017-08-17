class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_reader :full_name
  attr_accessor :skip_password_validation

  has_one :tenancy_contract, dependent: :destroy
  has_one :room, through: :tenancy_contract
  has_and_belongs_to_many :expenses, join_table: :contributor_expenses
  has_many :announcements
  has_many :comments

  validates :email, uniqueness: true, presence: true

  validates :nickname, allow_blank: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 1, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :first_name, :last_name, allow_blank: true,
                                     format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },
                                     length: { maximum: 30 }
  validates :id_number, presence: true,
                        uniqueness: true,
                        format: { with: /\A[A-Z0-9-]+\z/ }
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validate :avatar_size_validation

  def full_name
    [first_name.presence, last_name.presence].compact.join(' ')
  end
  protected

  def password_required?
    return false if skip_password_validation
    super
  end

  private

   def avatar_size_validation
     errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
   end

end
