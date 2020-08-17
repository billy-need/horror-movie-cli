module Horror
	module Movie
		class Listing

			@@all = []

			def initialize(row)
				@row = row
				@@all << self
			end

			def rank
				@movie_rank ||= @row.css(".bold").text
			end

			def rating
				@movie_rating ||= @row.css(".tMeterScore").text.delete " " 
				#not a blank space, special character "tomatometer icon"
			end

			def movie_title
				@movie_title ||= @row.css(".unstyled.articleLink").text.strip
			end

			def movie_url
				@movie_url ||= @row.css(".unstyled.articleLink").attribute("href").value
				"https://www.rottentomatoes.com#{@movie_url}"
			end

			def number_of_reviews
				@number_of_reviews ||= @row.css(".right.hidden-xs").text
			end

			def movie_info
				doc = Horror::Movie::Scraper.new.movie_info(self)
				Horror::Movie::Info.new(doc)
			end

			def self.all
        		@@all
      		end

      		def self.find(id)
       			 self.all[id-1]
      		end

			def self.search_by_title(movie_title)
				matching_movies = []
				@@all.each do |listing| 
					if listing.movie_title.downcase.include? movie_title.downcase
					matching_movies << listing
					end
				end
				return matching_movies
			end
		end
	end
end