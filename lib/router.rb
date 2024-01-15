class Router
    def initialize()
        @routes = []
    end

    def add_route(route)
        @routes << route
    end

    def match_route(request)
        #p request
        #måste ta hänsyn till /:id 
       @routes.each_with_index do |route,index|
            if route == request.resource
                puts "Found #{route}!" 
            end 
        end
    end
end

