#!/usr/bin/env ruby

def toilet(msg,font,color)
  puts `toilet -F #{color} -f #{font} #{msg}`
end

def check()
	abort if `toilet haha`.include?('not installed')
	if ARGV.empty?
		toilet('Hello!','mono12','gay')
		toilet('This is the asshole who wrote this stuff','future','metal')
		puts 'Usage: rtime [seconds] [name of timer]'
		exit
	end
end

check()

startTime = Time.now
endTime = startTime + ARGV.shift.to_i
prevTime = startTime - 1
while (Time.now <= endTime)
	curTime = Time.now
	if (curTime - prevTime >= 1)
		#puts `clear` here flashes the terminal,
		#which I don't like.
		clock = (endTime - curTime.to_f).strftime('%M:%S')
		toilet(clock,"mono12","gay")
		prevTime += 1
		msg = ARGV.join(' ')
		toilet('Timer - '+msg,'future',"metal")
		puts "\n"*7
	end
end
puts `clear`
puts "\n"*7
toilet("DONE","mono12","gay")
toilet("HAVE A NICE DAY!!","future","metal")
puts "\n"*7
