# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_dissonance_resolution/version'

Gem::Specification.new do |spec|
  spec.name    = 'lex-cognitive-dissonance-resolution'
  spec.version = Legion::Extensions::CognitiveDissonanceResolution::VERSION
  spec.authors = ['Esity']
  spec.email   = ['matthewdiverson@gmail.com']

  spec.summary     = 'Cognitive dissonance resolution strategies for LegionIO'
  spec.description = 'Models dissonance conflicts between beliefs and applies resolution ' \
                     'strategies (belief change, rationalization, reframing) with effectiveness tracking.'
  spec.homepage    = 'https://github.com/LegionIO/lex-cognitive-dissonance-resolution'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']      = spec.homepage
  spec.metadata['source_code_uri']   = 'https://github.com/LegionIO/lex-cognitive-dissonance-resolution'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-cognitive-dissonance-resolution'
  spec.metadata['changelog_uri']     = 'https://github.com/LegionIO/lex-cognitive-dissonance-resolution/blob/main/CHANGELOG.md'
  spec.metadata['bug_tracker_uri']   = 'https://github.com/LegionIO/lex-cognitive-dissonance-resolution/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['lib/**/*']
end
