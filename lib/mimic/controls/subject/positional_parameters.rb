module Mimic
  module Controls
    module Subject
      module PositionalParameters
        def self.example
          Example.new
        end

        class Example
          def some_method(some_parameter, some_other_parameter)
          end
        end
      end
    end
  end
end
