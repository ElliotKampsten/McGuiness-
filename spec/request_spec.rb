require_relative 'spec_helper'
require_relative '../lib/request'

describe 'Request' do

    describe 'Simple get-request' do
    
        it 'parses the http method' do
            @request = Request.new(File.read('./spec/example_requests/post-login.request'))
            _(@request.method).must_equal "GET"
        end

        it 'parses the resource' do
            @request = Request.new(File.read('./spec/example_requests/post-login.request'))
            _(@request.resource).must_equal "/"
            
        end
       
        it 'parses the version' do
            @request = Request.new(File.read('./spec/example_requests/post-login.request'))
            _(@request.version).must_equal "HTTP/1.1"
            
        end
       
        it 'parses the headers' do
            @request = Request.new(File.read('./spec/example_requests/post-login.request.txt'))
            headers = {
                "Host"=>"foo.exemple",
                "Content-Type"=>"application/x-www-form-urlencoded",
                "Content-Length"=>"39"
            }
            _(@request.headers).must_equal headers
        end
        it 'parses the params' do
            @request = Request.new(File.read('./spec/example_requests/post-login.request.txt'))
            params = {
                "username"=>"grillkorv",
                "password"=>"verys3cret!"
                
            }
            _(@request.params).must_equal params
        end


    end


end