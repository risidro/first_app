class Story < ActiveRecord::Base
  has_many :microposts
  belongs_to :user

#  has_and_belongs_to_many :users
#  accepts_nested_attributes_for :microposts 

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("story_id = ?", id)
  end

end
