require_relative "lib/router"
require_relative "lib/request"

router = Router.new

router.add_route("/grillkorv", "GET")
router.add_route("/", "GET")
router.add_route("/login", "POST")
router.add_route("/login/:id","GET")


request = Request.new(File.read('./spec/example_requests/post-login.request.txt'))
#request = "/grillkorv"
router.match_route(request)
#p request.resource
