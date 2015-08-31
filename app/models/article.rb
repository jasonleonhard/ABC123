class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
end