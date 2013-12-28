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

def display(sec)
	mi = (sec / 60).to_s
	se = (sec % 60).to_s
	mi = '0' + mi while (mi.length < 2)
	se = '0' + se while (se.length < 2)
	toilet(mi+":"+se,"mono12","gay")
end

startSec = Time.now.to_i
endSec = startSec + ARGV.shift.to_i
prevSec = startSec
while (Time.now.to_i != endSec)
	curSec = Time.now.to_i
	if (prevSec != curSec)
		#puts `clear` here flashes the terminal,
		#which I don't like.
		puts display(endSec - curSec)
		prevSec = Time.now.to_i
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
