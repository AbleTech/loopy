require 'loopy/version'

module Loopy
  def self.run(method_name, delay_in_seconds)
    log "Starting loopy: #{method_name}"

    exiting = false

    trap('TERM') { 
      log "Exiting... (#{method_name})"; 
      exiting = true 
    }

    trap('INT'){ 
      log "Exiting... (#{method_name})"; 
      exiting = true 
    }

    trap('QUIT'){ 
      log "Exiting... (#{method_name})"; 
      exiting = true 
    }

    loop do
      finish_time = Time.now + delay_in_seconds

      begin
        log "Executing #{method_name}"
        yield
      rescue => e
        log "Exception caught by loopy (#{method_name}): #{e.inspect}"
        log e.backtrace.join("\n")
      end

      if finish_time > Time.now
        log "Sleeping till #{finish_time}"
      else
        log "Oh dear, #{method_name} overran"
      end

      while finish_time > Time.now
        sleep(0.100)
        break if exiting
      end

      break if exiting
    end

    log "Finished loopy: #{method_name}"
  end

  private

  def self.log(message)
    $stderr.puts message
    $stderr.flush
  end
end

