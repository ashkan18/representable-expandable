module Representable
  module Expandable
    def self.included(base)
      base.class_eval do
        def self.collection(name, options = {}, &block)
          add_expandable(name, options)
          super
        end

        def self.property(name, options = {}, &block)
          add_expandable(name, options)
          super
        end

        def self.add_expandable(name, options = {})
          if options.delete :expandable
            # if collection already had if, and it with expandable if condition
            existing_if = options[:if] || ->(_opts) { true }
            options[:if] = ->(opts) { opts[:expand] && opts[:expand].include?(name.to_s) && existing_if.call(opts) }
          end
        end
      end
    end
  end
end
