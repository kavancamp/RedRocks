class RedRocks::CLI

    def call
        list_concerts
        menu
    end

    def list_concerts
        puts "Concerts:"
        @concerts = RedRocks::concerts.today
        @concerts.each.with_index(1) do |concert, x|
            puts "#{x}. '#{concert.title}' by #{concert.artist} -  #{concert.timestamp}"
        end
    end




end