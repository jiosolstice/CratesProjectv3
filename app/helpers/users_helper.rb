module UsersHelper
    module ForController
        def is_rated?(rated_person)
            UserRating.exists?(current_user.user_ratings.find_by_rated_person(rated_person))
        end
    end
    include ForController
    
    def has_permission?(user)
        logged_in? && ( admin? || current_user?(user))
    end
    
    def count_good_ratings(rated_person)
        UserRating.find_good_rating(rated_person).count 
    end
    
    def count_bad_ratings(rated_person)
        UserRating.find_bad_rating(rated_person).count 
    end
    
    def ratings_count(rated_person)
        UserRating.find_by_rated_person(rated_person).all.count
    end
    
end
