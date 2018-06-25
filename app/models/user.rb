class User < ApplicationRecord
  before_save { name.downcase! }
end
