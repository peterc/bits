# Creating UDP packets with Racket

require 'socket'
require 'racket'

IP = "195.201.35.5"
PORT = 5005

n = Racket::Racket.new
n.iface = "en0"
n.l3 = IPv4.new
n.l3.src_ip = "192.168.1.103"
n.l3.dst_ip = IP
n.l3.protocol = 0x11

n.l4 = UDP.new
n.l4.src_port = 12345
n.l4.dst_port = PORT
n.l4.payload = "this is a test 1234\r\n"

n.l4.fix!(n.l3.src_ip, n.l3.dst_ip)
f = n.sendpacket

# print out what we built
n.layers.compact.each do |l|
  puts l.pretty
end
puts "Sent #{f}"
