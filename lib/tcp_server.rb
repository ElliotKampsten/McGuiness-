require 'socket'

class HTTPServer

    def initialize(port)
        @port = port
    end

    def start
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"
        router = Router.new
        router.add_route("/grillkorv", "GET") do
            "<h1>churizo</h1>"
        end
        router.add_route("/", "GET")  do 
            "<h1>hej</h1>"
        end
        router.add_route("/login", "POST")
        router.add_route("/login/:id", "GET")
        router.add_route("/:id/login", "GET")

        while session = server.accept
            data = ""
            while line = session.gets and line !~ /^\s*$/
                data += line
            end
            puts "RECEIVED REQUEST"
            puts "-" * 40
            puts data
            puts "-" * 40 

            request = Request.new(data)
            #Sen kolla om resursen (filen finns)
            
            route_hash = router.match_route(request)
            


            #nedanstående i response
            if  route_hash
                status = 200
                html = route_hash [:block].call
            else 
                status = 404
                puts(router.match_route(request))

                debugvar1 = request.resource() 
                debugvar2 = request.method() 
            end
         




            # Nedanstående bör göras i er Response-klass
            #html = "<h1>#{status}<h1> <h1>#{debugvar1}<h1> <h1>#{debugvar2}<h1>"

            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: text/html\r\n"
            session.print "\r\n"
            session.print html
            session.close
        end
    end
end

server = HTTPServer.new(4567)
server.start