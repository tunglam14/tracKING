class Site < ActiveRecord::Base
  belongs_to :user
  has_many :req
  before_save :create_client_id

  def create_client_id
    self.client_id = gen_unique_id
  end

  # generate unique client id
  def gen_unique_id
    id = SecureRandom.hex(5)
    if Site.find_by_client_id(id).nil?
      return id
    else
      gen_unique_id
    end
  end
end