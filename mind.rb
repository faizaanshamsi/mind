require 'artoo'
require 'pry'
require "socket"


connection :neurosky, adaptor: :neurosky, port: '/dev/tty.MindWaveMobile-DevA'
device :neurosky, driver: :neurosky, interval: 0.1


def handle_eeg(sender, data)
  @dts ||= TCPServer.new('127.0.0.1', 20000)
  Thread.start(@dts.accept) do |s|
    print(s, " is accepted\n")
    s.write(data)
    print(s, " is gone\n")
    s.close
    puts data
  end
end

work do
  puts "Scanning..."
  on neurosky, eeg: :handle_eeg
end




