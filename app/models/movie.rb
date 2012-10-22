class Movie < ActiveRecord::Base

	

	
	
	def self.findall sort_col, ratings		
		@@ratings_prev = ratings
		@@init_value = true
		return find(:all, :order => sort_col, :conditions => {:rating => ratings})
	end

	def self.movie_ratings
		return ['G','PG','PG-13','R']
	end

	@@ratings_prev = self.movie_ratings

	def self.ratings_previous
		return @@ratings_prev
	end

	@@init_value = false
	def self.init_value
		return @@init_value
	end



	#attr_accessor :ratings_prev
end
