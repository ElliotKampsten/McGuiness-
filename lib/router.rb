class Router
    def initialize()
        @routes = []
    end

    def add_route(route,method)
        @routes.store(route,method)
    end

    def match_route(request)
        #p request
        #måste ta hänsyn till /:id 
       @routes.each_with_index do |route,index|

            if route == request.method
                puts "Found #{route}! "
            end
        end
    end
end

