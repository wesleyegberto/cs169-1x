class Dessert
    attr_accessor :name, :calories
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    def healthy?
        return false if @calories > 200
        return true
    end
    def delicious?
        return false if @name == "licorice jelly bean"
        return true
    end
end

class JellyBean < Dessert
    attr_accessor :flavor
    
    def initialize(flavor)
        @flavor = flavor
        self.calories = 5
        self.name = flavor + " jelly bean"
    end
end
