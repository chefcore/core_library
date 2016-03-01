module ChefCore
  class Output
    def self.header(description)
      Chef::Log.warn('')
      Chef::Log.warn('------------------------------------------------------------------')
      Chef::Log.warn("BEGIN: #{description}")
      Chef::Log.warn('------------------------------------------------------------------')
    end

    def self.footer(description)
      Chef::Log.warn('------------------------------------------------------------------')
      Chef::Log.warn("END: #{description}")
      Chef::Log.warn('------------------------------------------------------------------')
      Chef::Log.warn('')
    end

    def self.announce(description, &_block)
      header(description)
      yield
      footer(description)
    end

    def self.report(message)
      Chef::Log.warn("REPORT: #{message}")
    end

    def self.warn(message)
      Chef::Log.warn("warn: #{message}")
    end

    def self.action(message)
      # log message do
      #   level :warn
      # end
      Chef::Log.warn("ACTION: #{message}")
    end

    def self.error(message)
      Chef::Log.warn("ERROR: #{message}")
    end

    def self.break(message)
      Chef::Log.warn("ERROR: #{message}")
      raise message
    end
  end
end
