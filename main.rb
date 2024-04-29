require_relative "lib/router"
require_relative "lib/request"
require_relative "lib/tcp_server"

router = Router.new

router.add_route("/skateboard", "GET")
router.add_route("/", "GET")




#request = Request.new(File.read('./spec/example_requests/post-login.request.txt'))
#request = Request.new(File.read('./spec/example_requests/get-fruits-with-filter.request.txt'))
#p request.resource
#router.match_route(request)
#p request.resource

server = HTTPServer.new(4567)
server.start
