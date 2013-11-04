require 'mechanize'
module CardPopulation
  class GathererCollection

    STARTING_URL = "http://gatherer.wizards.com/Pages/Search/Default.aspx?action=advanced&rarity=|[M]|[R]|[U]&format=|[%22Standard%22]|[%22Modern%22]"

    def initialize log=STDOUT
      @agent = Mechanize.new
      @page = @agent.get STARTING_URL
      @log = log
    end

    def each_card
      begin
        cards_on_page.each do |card|
          yield make_hash(card)
        end
        go_to_next_page
      end until reached_last_page?
    end

    private
      def reached_last_page?
        next_page_link.nil?
      end

      def cards_on_page
        @page.search '.cardItem'
      end

      def go_to_next_page
        @log.puts "Fetching next page"
        @page = next_page_link.click
      end

      def next_page_link
        @page.links.find { |a| a.text =~ /\s*>$/ }
      end

      def make_hash card_div
        name = card_div.search('.cardTitle').text.strip
        rarity = detect_rarity(card_div.search('.setVersions img').first.attr('alt'))
        { :name => name, :rarity => rarity }
      end

      def detect_rarity img_alt_text
        case img_alt_text
          when /uncommon/i
            Card::UNCOMMON
          when /common/i
            Card::COMMON
          when /rare/i
            Card::RARE
          when /mythic/i
            Card::MYTHIC
        end
      end
  end
end
