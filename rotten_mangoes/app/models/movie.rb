class Movie < ActiveRecord::Base
  scope :search, -> (query) { where(['title like ? or director like ?', "%#{query}%", "%#{query}%"]) }


  has_many :reviews
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :poster_image_url, presence: true, unless: :check 
  validates :release_date, presence: true
  validate :release_date_is_in_the_future

  # before_validation :check # check if i need check method and the validation

  # def check
  #   self.image.path 
  # end
  
  def review_average
    if self.reviews.size > 0 #check if i can use exist method 
      self.reviews.sum(:rating_out_of_ten)/reviews.size
    else
      0
    end
  end

  protected

  def release_date_is_in_the_future
    if self.release_date.past? 
      errors.add(:release_date, "should probably be in the future") 
    end
  end

end
