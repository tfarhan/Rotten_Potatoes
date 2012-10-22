class Movie < ActiveRecord::Base
	
	def self.findall sort_col		
		return find(:all, :order => sort_col)
	end
end
