# frozen_string_literal: true

module Legion
  module Extensions
    module CognitiveDissonanceResolution
      class Client
        include Runners::CognitiveDissonanceResolution

        def engine
          @engine ||= Helpers::ResolutionEngine.new
        end
      end
    end
  end
end
