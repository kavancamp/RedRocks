class RedRocks::CLI

    def call
        list_events
        menu
    end

    def list_events

        puts "\nEvents:"
        @events = RedRocks::events.all
        @events.each.with_index(1) do |event, x|
            puts "#{x}. '#{event.title}' by #{event.artist} -  #{event.date}, #{event.timestamp}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "/nEnter the number of the show you want to see, 'list' to display the list again, or enter 'exit'"
            input = gets.strip.downcase
        
            if input.to_i > 0 && input.to_1 < 3
                the_event = @events[input.to_i-1]
                puts "\n\t'#{the_event.title}' by #{the_event.artist} - #{the_event.timestamp}, #{the_event.date}"
                puts "\n\t#{the_event.description.capitalize!}" if the_event.description != nil
                default = "https://www.redrocksonline.com/events/?view=calendar"
                if the_event.url
                    doc = Nokogiri::HTML(open("#{the_event.url}"))
                    event = doc.search("div.article-body p").text
                    puts"\n"
                    puts event
                    puts "\n" p;
                    puts the_event.url
                else   
                    puts"\n Take a look at https://www.redrocksonline.com/events/?view=calendar for more information on the venue and events!"
                end
            elsif input == 'exit'
                goodbye
            elsif inout == 'list'
                list_events
            else 
                puts "\I dont understand, please try enter 'list', 'exit', or enter the number of a show you want to see"
            end
        end
    end





end