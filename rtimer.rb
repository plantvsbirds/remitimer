#!/usr/bin/env ruby

def toilet(msg,font,color)
  puts `toilet -F #{color} -f #{font} '#{msg}'`
end

abort if `which toilet`.empty?
if ARGV.empty?
	toilet('Hello!','mono12','gay')
	toilet('This is the plantvsbirds who wrote this stuff','future','metal')
	puts 'Usage: rtime SECONDS [MESSAGE] ...'
	exit
end

remTime = ARGV.shift.to_f
endTime = Time.now + remTime

msg = ARGV.empty? ? '' : "Timer - #{ARGV.join(' ')}"
msg = `toilet -F metal -f future '#{msg}'`
msg += "\n"*7

loop do
	curTime = Time.now
	break if curTime > endTime
	if (endTime - curTime < remTime)
		#puts `clear` here flashes the terminal,
		#which I don't like.
		clock = (endTime - curTime.to_f + 1).strftime('%M:%S')
		toilet(clock,"mono12","gay")
		puts msg
		remTime -= 1
	end
end

puts `clear`
puts "\n"*7
toilet("DONE","mono12","gay")
toilet("HAVE A NICE DAY!!","future","metal")
puts "\n"*7
