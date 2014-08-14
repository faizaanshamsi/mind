require 'socket'

streamSock = TCPSocket.new('127.0.0.1', 20000)
str = streamSock.recv( 100 )
puts str
streamSock.close
