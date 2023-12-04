request_string = File.read("request_file.txt")
first = request_string.split("\n")
p first
#p rest



class Request 
    def initialize(reqstring)
     first, *@rest = reqstring.split("\n")
     @method = first.split(" ")[0]
     @resource = first.split(" ")[1]
     @version = first.split(" ")[2]
     @headers = {}
    end

    def method()
        @method
    end
    def version()
        @version
    end
    def resource()
        @resource
    end

    def headers()
        i = 0 
        while @rest[i].include? ":"
          temp = @rest[i].split(":")
          @headers.store(temp[0],temp[1].strip)
          i+=1 
        end
        @headers
    end

    def params()
        i=0
        paramstring = ""
        @rest.each_with_index do |element,index|
            if !element.include? ":"
                paramstring = paramstring + @rest[index]
            end
        end
        paramstring.split("&")



    end
end

request = Request.new(request_string)
#p request.version
#p request.method
#p request.resource
#p request.headers



