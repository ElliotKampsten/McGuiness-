require_relative "lib/router"
require_relative "lib/request"
require_relative "lib/tcp_server"

router = Router.new

router.add_route("/grillkorv", "GET")
router.add_route("/", "GET")
router.add_route("/login", "POST")
router.add_route("/login/:id", "GET")
router.add_route("/:id/login", "GET")



#request = Request.new(File.read('./spec/example_requests/post-login.request.txt'))
#request = Request.new(File.read('./spec/example_requests/get-fruits-with-filter.request.txt'))
#p request.resource
#router.match_route(request)
#p request.resource

server = HTTPServer.new(4567)
server.start
