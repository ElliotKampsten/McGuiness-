class Router
    def initialize()
        @routes = []
    end

    def add_route(route,method,&block)
        route = Regexp.new(route.gsub(/([:]\w+)/,'(\w+)') + '$')
        @routes << {route: route ,method: method,block: block}
        #puts route
        #gör gsub på kolondelen av strängen. används regulärt utryck i gsub för att byta ut mot annat regulärt uttryck. 
    end

    def match_route(request)
       @routes.each do |enhash|
        p "0000000000"
        p request.method
        p request.resource
        p enhash
        p enhash["route"]
        p "0000000000"

        if request.resource.match?(enhash[:route]) && request.method == enhash[:method]
                puts "Found #{enhash[:route]}"
                puts "Request resource is: #{request.resource}"
                puts @routes
                return enhash
            end
        end
       
        return nil 
    end
end

