class RedRocks::Scraper

    def self.scrape
      doc = Nokogiri::HTML(open("https://www.redrocksonline.com/events/?view=calendar"))
  
      doc.css("div.entry.event-icons.clearfix").each do |event|
        title = event.css("h3").text
        artist = event.css("h4").text
        date = event.css("span.m-date-value.m-value").text
        timestamp = event.css("span.m-doors").text.gsub("Doors","").strip
        url = event.css("div.buttons a").attr("href").text
        RedRocks::Event.new(title, artist, date, timestamp, url)
      end
    end
  end