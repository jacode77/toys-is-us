module ListingsHelper

    def format_condition(condition)
      #capitalizes every word in string
    #   condition.split("_").map {|word| word.capitalize}.join(" ") <-- one line

        arr = condition.split("_").map do |word|
            word.capitalize
        end
        arr.join(" ")
    end

    def format_price(price)
        "$#{price/ 100.0}"
    end
end


  