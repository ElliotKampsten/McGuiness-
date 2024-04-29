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
       @routes.each do |route|
        p "0000000000"
        p request.method
        p request.resource
        p route
        p "0000000000"

        if request.resource.match?(route) && request.method == route[1]
                puts "Found #{:route}"
                puts "Request resource is: #{request.resource}"
                puts @routes
                return route
            end
        end
       
        return nil 
    end
end

