require 'irb/completion'
require 'irb/ext/save-history'

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 25 entries in the list
IRB.conf[:SAVE_HISTORY] = 25

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

begin
  #require "wirb"
  #Wirb.start
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
end
puts "♡ ♡ ♡"
