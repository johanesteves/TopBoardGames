class TopBoardGames::CLI

  def call
    TopBoardGames::Scraper.new.make_boardgames
    start
  end

  def start
    puts "", "Greetings! Here you will be able to see a list of the top 100 boardgames", ""
    game_list
    nav_menu
  end

  def list_boardgames(input)
    @boardgames = TopBoardGames::Game.all
    @boardgames[input].each do |game|
      puts "#{game.rank}.".ljust(5)+"#{game.title}"
    end
  end

  def game_list
    puts " (1)       (2)       (3)       (4)       (5)"
    puts "01-20 --- 21-40 --- 41-60 --- 61-80 --- 81-100"
    puts "","Enter the list you would like to see:"
    input  = gets.strip.downcase
    inputs = {1 => [1,20], 2 => [21, 40], 3 => [41, 60], 4 => [61, 80], 5 => [81,100]}

    if input.to_i > 0
      puts "","TOP BOARDGAMES: #{inputs[input.to_i][0]}-#{inputs[input.to_i][1]}"
      puts "========================================================="
      list_boardgames((inputs[input.to_i][0])-1..(inputs[input.to_i][1])-1) # list_boardgames(0..19)
      puts "========================================================="
      puts "", "Enter boardgame number you wish to view", "Enter '[m]enu' to return the main menu", "Enter '[e]xit' to quit program" ,"" ,"Enter your selection:"
    end
    #abort("Goodbye!!") if ["exit", "e"].include?(input)
  end


  def nav_menu
    input = nil
    while !["exit", "e"].include?(input)
      input = gets.strip.downcase
      if ["menu", "m"].include?(input)
        game_list
      elsif input.to_i >0
        display_game_description(@boardgames[input.to_i-1])
      elsif ["exit", "e"].include?(input)
        puts "", "Goodbye!!"
      else
        puts "You have entered an invalid input"
      end
    end
  end

  def display_game_description(game)
    puts "", "More information about:", "========================================================="
    puts game.title.upcase
    puts "========================================================="
    puts "Overall Rank:       #{game.rank}"
    puts "Average Rating:     #{game.avg_rating}"
    puts "Weight (Out of 5):  #{game.weight.to_f.round(2)}"
    if game.min_playtime == game.max_playtime
      puts "Estimated Playtime: #{game.min_playtime} mins"
    else
      puts "Estimated Playtime: #{game.min_playtime} - #{game.max_playtime} mins"
    end
    puts "Recommended Age:    #{game.min_age}+"
    puts "", "Description:"
    puts game.description, ""
    puts "========================================================="
    puts "", "Enter boardgame number you wish to view", "Enter '[m]enu' to return the main menu", "Enter '[e]xit' to quit program" ,"" ,"Enter your selection:"
  end
end