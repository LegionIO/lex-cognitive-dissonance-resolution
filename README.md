# lex-cognitive-dissonance-resolution

Cognitive dissonance resolution strategies for LegionIO. Models dissonance conflicts between beliefs and applies resolution strategies with effectiveness tracking.

## What It Does

When two beliefs contradict each other, tension arises. Festinger's cognitive dissonance theory says this tension must be resolved — through belief change, behavior change, adding consonant cognitions, trivialization, reframing, seeking new information, compartmentalization, rationalization, or avoidance. This extension makes that process explicit: conflicts are registered with tension scores, strategies are applied with effectiveness tracking, and tension decays passively over time.

## Usage

```ruby
client = Legion::Extensions::CognitiveDissonanceResolution::Client.new

conflict = client.create_dissonance_conflict(
  belief_a: 'I value transparency in all communications',
  belief_b: 'I withheld information about system limitations to avoid alarming the user',
  domain: :ethics,
  tension: 0.75
)

client.apply_resolution_strategy(
  conflict_id: conflict[:id],
  strategy: :reframe,
  effectiveness: 0.4
)

client.strategy_effectiveness_report
client.dissonance_report
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
