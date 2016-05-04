class User < ActiveRecord::Base
  validates :first_name, presence: {message:" is missing"}
  validates :last_name, presence: {message:" is missing"}
  validates :office_location, presence: {message:" is missing"}
  validates :role, presence: {message:" is missing"}
  validates_length_of :first_name, :maximum => 25, :minimum =>1
  validates_length_of :last_name, :maximum => 35, :minimum =>1
  validates_length_of :email, :maximum => 35, :minimum =>1

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :devices

  def set_default_role
  end

  def user_id_name
    "#{id} #{first_name} #{last_name}"
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
