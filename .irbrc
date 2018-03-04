begin
  require'rails'
  require'stringex'
  require'copyrb'
rescue
end

require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:BACK_TRACE_LIMIT] = 16
IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT] = true
