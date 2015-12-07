module Representable
  module Expandable
    def self.included(base)
      base.class_eval do
        def self.collection(name, options = {}, &block)
          if options.delete :expandable
            # if collection already had if, and it with expandable if condition
            existing_if = options[:if] || ->(_opts) { true }
            options[:if] = ->(opts) { opts[:expand] && opts[:expand].include?(name.to_s) && existing_if.call(opts) }
          end
          super
        end
      end
    end
  end
end