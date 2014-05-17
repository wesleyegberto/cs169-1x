
class BookInStock
    attr_accessor :isbn, :price
    
    def initialize(isbn, price)
        raise ArgumentError if !isbn or isbn.empty? or price <= 0
        @isbn = isbn 
        @price = price
    end
    
    def price_as_string
       format "$%.2f", @price
    end
end

