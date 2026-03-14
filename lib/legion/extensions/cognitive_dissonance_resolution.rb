# frozen_string_literal: true

require_relative 'cognitive_dissonance_resolution/version'
require_relative 'cognitive_dissonance_resolution/helpers/constants'
require_relative 'cognitive_dissonance_resolution/helpers/dissonance_conflict'
require_relative 'cognitive_dissonance_resolution/helpers/resolution_engine'
require_relative 'cognitive_dissonance_resolution/runners/cognitive_dissonance_resolution'
require_relative 'cognitive_dissonance_resolution/client'

module Legion
  module Extensions
    module CognitiveDissonanceResolution
      extend Legion::Extensions::Core if defined?(Legion::Extensions::Core)
    end
  end
end
