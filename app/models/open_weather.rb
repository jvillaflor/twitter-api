#
# Represents the Open Weather Map.
# == Author:
# Josué Villa Flor
#
class OpenWeather
    def initialize(appid)
        @client = OpenWeatherMap::Client.new(app_id: appid)
        @celsius_precision = 1
    end
    
    # Get the current and 5 days forecast temperatures from Open Weather Map.
    # (defaults to `:html`)
    #
    # == Returns:
    # A string containing the temperatures
    #
    def temperatures_as_text
        lat = ENV["LATITUDE"]
        lon = ENV["LONGITUDE"]
        celsius = "°C"
        dt_format = "%d/%m"
        
        data = @client.weather(lat: lat, lon: lon, lang: :pt_br, units: :metric)
        text = "#{data[:main][:temp].round(@celsius_precision)}#{celsius} e #{data[:weather].first[:description]} em "
        text << "#{data[:name]} em #{Date.today.strftime(dt_format)}. "
        
        data = @client.forecast(lat: lat, lon: lon, lang: :pt_br, units: :metric)
        temps = calc_avg(data[:list])

        text << "Média para os próximos dias: "
        text << temps.map { |date, temp| "#{temp}#{celsius} em #{date.to_date.strftime(dt_format)}" }.join(", ")
        text
    end

    private

    # Calculates temperatures average for each next 5 days.
    # (defaults to `:html`)
    #
    # == Parameters:
    # list::
    #   A hash containing Open Weather data.
    # == Returns:
    # A hash which keys are dates and values are averages.
    #
    def calc_avg(list)
        avgs = {}
        temps = list.map{ |v| [ v[:dt_txt], v[:main][:temp] ] }.to_h
        dates = temps.keys.map { |v| v.split(" ")[0] }.uniq

        # delete first date because today's average is being calculated too and
        # the requirements doesnt ask to show that.
        dates = dates.drop(1)

        dates.each do |d|
            matched = temps.select {|k,v| k.include?(d) }
            avg = matched.values.inject{ |sum, num| sum + num }
            avg = (avg / matched.size).round(@celsius_precision)
            avgs[d] = avg
        end
        
        avgs
    end
end