class RedRocks::CLI

    def call
        list_concerts
        menu
    end

    def list_concerts

        puts "\nConcerts:"
        @concerts = RedRocks::concerts.all
        @concerts.each.with_index(1) do |concert, x|
            puts "#{x}. '#{concert.title}' by #{concert.artist} -  #{concert.timestamp}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "/nEnter the number of the show you want to see, 'list' to display the list again, or enter 'exit'"
            input = gets.strip.downcase
        
            if input.to_i > 0 && input.to_1 < 3
                the_concert = @concerts[input.to_i-1]
                puts "\n\t'#{the_concert.title}' by #{the_concert.artist} - #{the_concert.timestamp}"
                puts "\n\t#{the_concert.description.capitalize!}" if the_concert.description != nil
                default = "https://www.redrocksonline.com/events/"
                if the_concert.url
                    doc = Nokogiri::HTML(open("#{the_concert.url}"))
                    concert = doc.search("div.article-body p").text
                    puts"\n"
                    puts concert
                    puts "\n" p;
                    puts the_concert.url
                else   
                    puts"\n Take a look at https://www.redrocksonline.com/events/ for more information on the venue and events!"
                end
            elsif input == 'exit'
                goodbye
            elsif inout == 'list'
                list_concerts
            else 
                puts "\I dont understand, please try enter 'list', 'exit', or enter the number of a show you want to see"
            end
        end
    end





end