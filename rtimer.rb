#!/usr/bin/env ruby

def toilet(disp,font,color)
  puts `toilet -F #{color} -f #{font} #{disp}`
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

startSec = Time.new().to_i
endSec = startSec + ARGV[0].to_i
prevSec = startSec
while (Time.new().to_i != endSec)
	curTime = Time.new()
	curSec = curTime.to_i
	if (prevSec != curSec)
		#puts `clear` here flashes the terminal,
		#Which i dont like.
		puts display(endSec - curSec)
		prevSec = Time.new().to_i
		msg = ""
		ARGV.each_with_index {|stuff,id|
				msg += stuff+' ' if(id != 0)
		}
		toilet('Timer - '+msg,'future',"metal")
		puts "\n\n\n\n\n\n\n"
	end
end
puts `clear`
puts "\n\n\n\n\n\n\n"
toilet("DONE","mono12","gay")
toilet("HAVE A NICE DAY!!","future","metal")
puts "\n\n\n\n\n\n\n"
