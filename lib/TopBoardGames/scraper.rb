class TopBoardGames::Scraper

  def get_main_page
    #main_page will return the information the info for the list (ie. Rank, Title, etc)
    Nokogiri::HTML(open("https://www.boardgamegeek.com/browse/boardgame"))
  end

  def get_desc_page(url)
    #url will be from main_page
    Nokogiri::HTML(open("https://boardgamegeek.com#{url}"))
  end

  def get_api_page(url)
    url_id = url[/(\/\d*\/)/].gsub("/", "") # Gets ID from URl
    Nokogiri::HTML(open("https://www.boardgamegeek.com/xmlapi2/thing?id=#{url_id}"))
  end

  def scrape_topboardgames
    self.get_main_page.css(".collection_table tr#row_")
    #url = table.css(".collection_objectname a").attr("href")
    #Title = table.css(".collection_objectname a").text
    #AVG RATING = table.collect {|i| i.css(".collection_bggrating")[1].text.strip}
  end


  def scrape_description_page

  end

  def make_boardgames

   scrape_topboardgames.each do |row|
     #binding.pry
     TopBoardGames::Game.new_from_main_page(row)
   end

    #this will create new board games and iterate of the main_page
  end
end