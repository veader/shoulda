module Shoulda # :nodoc:
  module ActiveRecord # :nodoc:
    module Matchers

      def have_default_scope(options)
        HaveDefaultScopeMatcher.new(options)
      end

      class HaveDefaultScopeMatcher # :nodoc:

        def initialize(options)
          @options = options
        end

        def matches?(subject)
          @subject = subject
          finds_correct_scope?
        end

        def failure_message
          "Expected default scope to contain #{@options.inspect}" + \
          " but was #{default_scoping.collect { |s| s[:find] }.inspect}"
        end

        def negative_failure_message
          "Didn't expect a default scope containing #{@options.inspect}"
        end

        def description
          "have a default scope containing #{@options.inspect}"
        end

        private

        def finds_correct_scope?
          return true if @options.empty?
          default_scoping.detect do |scope|
            scope[:find] == @options
          end
        end

        def default_scoping
          @_default_scoping ||= (@subject.class.default_scoping || [])
        end

      end

    end
  end
end
