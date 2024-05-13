

class Request 
    def initialize(reqstring)
     first, *@rest = reqstring.split("\n")
     if first == nil
        binding.break
     end
     @method = first.split(" ")[0]
     @resource = first.split(" ")[1]
     @version = first.split(" ")[2]
     @headers = {}
     @params = {}
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
        while @rest[i] != nil and @rest[i].include? ":"
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
                paramstring = @rest[index]
            end
        end
        paramvalues = paramstring.split("&")
        
        paramvalues.each_with_index do  |element,index|
            temp = element.split("=")
            @params.store(temp[0],temp[1])
        end
        @params
    end
end






