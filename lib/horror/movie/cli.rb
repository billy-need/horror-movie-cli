require_relative "../movie/scraper.rb"
require_relative "../movie/listing.rb"
require_relative "../movie/info.rb"
require "pry"

module Horror
  module Movie
    class Cli
	  def welcome
      	Horror::Movie::Scraper.new.scrape_horror_movies
      	puts File.read("lib/horror/movie/intro.txt").colorize :red
    	puts ""
      	puts "Hello! Welcome to the Rotten Tomatoes: Top 25 Horror Movies List.".colorize :red
      	puts ""
      	main_program
      end

	  def main_program
      	print_movies
		  i = 1
  
		  # Using While Loop  
		  while true
		
			  # Printing Values 
			  puts i * 3
			  i += 1
			  if input = exit
		
				  # Using Break Statement  
				  break
			  end        
		  end
        puts "------------------------------------------------".colorize :red
        puts ""
		puts "Would you like further information on a movie?".colorize :red
      	puts ""
      	puts "------------------------------------------------".colorize :red
		    puts "If yes, please enter a number 1-25.".colorize :red
		    puts "If not, please enter no.".colorize :red
		    puts ""

		    movie = correct_number?

		    puts "------------------------------------------------".colorize :red
		    puts "Would you like to see the movie's summary and a random review?".colorize :red
		    puts ""
		    puts "Please enter yes or no.".colorize :red
		    puts ""

		    summary_and_review?(movie)

		    puts ""
		    puts "Would you like to see information on another movie?".colorize :red
		    puts ""
		    puts "Please enter yes or no.".colorize :red

		    another_movie?
		  end

		  def correct_number?
		  	input = gets.strip
		  	until input.downcase == "no" || (1..25).include?(input.to_i) || input.downcase == "exit"
		  	  puts ""
		  	  puts "------------------------------------------------".colorize :red
		  	  puts "Invalid answer.".colorize :red
		  	  puts ""
		  	 	input = gets.strip
		  	end
		  	if (1..25).include? input.to_i
		  		movie = Horror::Movie::Listing.find(input.to_i)
					print_movie(movie)
					return movie
				elsif input.downcase == "no" || input.downcase == "exit"
					goodbye
				end
			end


		  def summary_and_review?(movie)
		  	input = gets.strip.downcase
		  	until input == "yes" || input == "no" || input == "exit"
		  	  puts ""
		  	  puts "------------------------------------------------".colorize :red
		  	  puts "Invalid answer.".colorize :red
		  	  puts ""
		  	 	input = gets.strip.downcase
		  	end
		    if input == "yes"
		      print_movie_info(movie)
		    elsif input == "no"
		    elsif input == "exit"
		    	goodbye
		    end
		  end

		  def another_movie?
		    input = gets.strip.downcase
		  	until input == "yes" || input == "no" || input == "exit"
		  	  puts ""
		  	  puts "------------------------------------------------".colorize :red
		  	  puts "Invalid answer.".colorize :red
		  	  puts ""
		  	 	input = gets.strip.downcase
		  	end
		    if input == "yes"
		      main_program
		    elsif input == "no" || input == "exit"
		    	goodbye
		    end
		  end

      def print_movie(movie)
      	puts ""
		    puts "---------------- Movie Stats ---------------".colorize :red
		    puts ""
		    puts "Rank:                    #{movie.rank}"
		    puts "Rating:                  #{movie.rating}"
		    puts "Movie Title:             #{movie.movie_title}"
		    puts "Movie Url:               #{movie.movie_url}"
		    puts "Number of Reviews:       #{movie.number_of_reviews}"
		    puts ""
      end

      def print_movie_info(movie)
      	movie_info = movie.movie_info
		    puts ""                     
      	puts "---------------- Movie Synopsis ---------------".colorize :red
		    puts ""
		    puts "#{movie_info.movie_synopsis}"
		    puts ""
		    puts "---------------- Random Review ----------------".colorize :red
		    puts ""
		    puts "#{movie_info.movie_review}"
		    puts ""
		    puts "------------------------------------------------".colorize :red
      end

      def print_movies
		    puts ""
		    puts "---------- Rotten Tomatoes: Top 25 Horror Movies ----------".colorize :red
		    puts ""
		    Horror::Movie::Listing.all.each.with_index do |movie, index|
				puts "#{index + 1}. #{movie.movie_title}"
	      	end
      end

      def goodbye
	      puts ""
	      puts "------------------------------------------------".colorize :red
	      puts "Goodbye! Stay scared!".colorize :red
	      puts File.read("lib/horror/movie/skull.txt").colorize :red
	      puts ""
	    	puts ""
	    	puts "------------------------------------------------".colorize :red
	      exit
      end
    end
  end
end

