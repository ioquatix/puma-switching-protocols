#!/usr/bin/env ruby

require 'async'
require 'async/io'

request = "GET / HTTP/1.1\r\n" +
	"Host: localhost:9292\r\n" +
	"Connection: upgrade\r\n" +
	"Upgrade: text\r\n" +
	"\r\n"

Async do
	endpoint = Async::IO::Endpoint.tcp("localhost", 9292)
	endpoint.connect do |peer|
		p request
		peer.write(request)
		peer.flush
		
		p peer.read_nonblock(1024)
		binding.irb
	end
end
