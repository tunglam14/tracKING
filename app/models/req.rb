class Req < ActiveRecord::Base
  belongs_to :site, :foreign_key => :client_id
end
