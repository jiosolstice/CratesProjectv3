class UserRating < ActiveRecord::Base
  belongs_to :rating
  belongs_to :user
    
    def self.find_by_rated_person(rated_person)
        UserRating.where("rated_person = ?",rated_person)
    end
    
    def self.find_good_rating(rated_person)
        UserRating.where("rating_id = ? AND rated_person = ?", 1 , rated_person)
    end
    
    def self.find_bad_rating(rated_person)
        UserRating.where("rating_id = ? AND rated_person = ?", 2 , rated_person)
    end
    
end
