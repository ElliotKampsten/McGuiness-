class Router
    def initialize()
        @routes = {}
        @routes.compare_by_identity
    end

    def add_route(route,method)
        route = Regexp.new(route.gsub(/([:]\w+)/,'(\w+)') + '$')
        @routes.store(route,method)
        #puts route
        #gör gsub på kolondelen av strängen. används regulärt utryck i gsub för att byta ut mot annat regulärt uttryck. 
    end

    def match_route(request)
        #p request
        #måste ta hänsyn till /:id 
       @routes.each do |route,method|

            #Kan inte upptäcka svenska karaktärer åäö
            if request.resource.match?(route) && request.method == method
                puts "Found #{route}"
                puts "Request resource is: #{request.resource}"
                puts "Method is: #{method}"
                puts @routes
            end
        end
    end
end

