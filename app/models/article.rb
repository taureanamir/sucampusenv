class Article < ApplicationRecord
  belongs_to :user
  validates :title, :presence => true
  validates :content, :presence => true
  acts_as_votable

  def score
    self.get_upvotes.size -  1
  end


end
