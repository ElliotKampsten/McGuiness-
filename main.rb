require_relative "lib/router"
require_relative "lib/request"

router = Router.new

router.add_route("/grillkorv")
router.add_route("/")

request = Request.new(File.read('./spec/example_requests/get-index.request.txt'))

router.match_route(request)
