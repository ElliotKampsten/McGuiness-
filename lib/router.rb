class Router
    def initialize()
        @routes = {}
        @routes.compare_by_identity
    end

    def add_route(route,method)
        @routes.store(route,method)
        #gör gsub på kolondelen av strängen. används regulärt utryck i gsub för att byta ut mot annat regulärt uttryck. 
    end

    def match_route(request)
        #p request
        #måste ta hänsyn till /:id 
       @routes.each do |route,method|

        #hitta regulärtuttryck som plockar upp allt
        # byt sedan ut request kolonsträngar med uttryck
        #matcha

            if route == request.resource && request.method == method
                puts "Found #{route} "
                puts "Method is: #{method}"
                puts @routes
            end
        end
    end
end

