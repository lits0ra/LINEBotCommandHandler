require 'logger'

def error_log(message)
  log = Logger.new(STDOUT)
  log.error(message)
end

def info_log(message)
  log = Logger.new(STDOUT)
  log.info(message)
end
