# lex-cognitive-dissonance-resolution

**Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Models dissonance conflicts between beliefs and applies resolution strategies (belief change, rationalization, reframing) with effectiveness tracking. Based on Festinger's cognitive dissonance theory: when two beliefs contradict each other, psychological tension arises that must be resolved. This extension makes that resolution process explicit and measurable.

## Gem Info

- **Gem name**: `lex-cognitive-dissonance-resolution`
- **Version**: `0.1.0`
- **Module**: `Legion::Extensions::CognitiveDissonanceResolution`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_dissonance_resolution/
  cognitive_dissonance_resolution.rb
  version.rb
  client.rb
  helpers/
    constants.rb
    resolution_engine.rb
    dissonance_conflict.rb
  runners/
    cognitive_dissonance_resolution.rb
```

## Key Constants

From `helpers/constants.rb`:

- `STRATEGIES` — `%i[belief_change behavior_change add_consonant trivialize reframe seek_information compartmentalize rationalize avoid]`
- `OUTCOME_LABELS` — `%i[resolved partially_resolved ongoing escalated abandoned]`
- `MAX_CONFLICTS` = `200`, `MAX_STRATEGIES` = `50`
- `DEFAULT_TENSION` = `0.5`, `TENSION_DECAY` = `0.03`, `RESOLUTION_THRESHOLD` = `0.2`
- `TENSION_LABELS` — `0.8+` = `:agonizing`, `0.6` = `:distressing`, `0.4` = `:uncomfortable`, `0.2` = `:mild`, below = `:resolved`

## Runners

All methods in `Runners::CognitiveDissonanceResolution`:

- `create_dissonance_conflict(belief_a:, belief_b:, domain: :general, tension: DEFAULT_TENSION)` — registers a conflict between two contradicting beliefs
- `apply_resolution_strategy(conflict_id:, strategy:, effectiveness: 0.3)` — applies a strategy; reduces tension by `effectiveness`
- `escalate_dissonance(conflict_id:, amount: 0.15)` — increases tension; marks as escalated
- `abandon_dissonance(conflict_id:)` — marks conflict as abandoned (unresolved, no further action)
- `ongoing_dissonance_report` — all conflicts in `ongoing` or `escalated` state
- `most_tense_report(limit: 5)` — top conflicts by tension
- `strategy_effectiveness_report` — per-strategy effectiveness scores and best strategy overall
- `dissonance_report` — full report: totals, by-domain breakdown, tension distribution
- `update_dissonance_resolution` — periodic decay: reduces tension on all conflicts by `TENSION_DECAY`
- `dissonance_resolution_stats` — engine summary

## Helpers

- `ResolutionEngine` — manages conflicts and strategy history. Tracks per-strategy effectiveness as running average. `decay_all` reduces tension on all non-resolved conflicts.
- `DissonanceConflict` — has `belief_a`, `belief_b`, `domain`, `tension`, `outcome`, `applied_strategies`. `resolve!` when tension <= `RESOLUTION_THRESHOLD`. `escalate!` when tension increased deliberately.

## Integration Points

- `lex-cognitive-coherence` `find_contradictions` provides the source for dissonance conflicts — contradicting propositions with high acceptance on both sides are dissonance candidates.
- `lex-dream` contradiction resolution phase calls this extension to apply resolution strategies to detected contradiction pairs.
- `update_dissonance_resolution` is the natural periodic runner — tension decays passively as time passes (avoidance/habituation mechanism).

## Development Notes

- `apply_resolution_strategy` reduces tension directly by `effectiveness` — it does not validate strategy type. The `STRATEGIES` constant is reference only; enforcement is the caller's responsibility.
- `RESOLUTION_THRESHOLD = 0.2`: conflicts with tension below this are auto-marked `:resolved`.
- `TENSION_DECAY = 0.03` per decay cycle — passive tension reduction models habituation and avoidance. Active strategies (`effectiveness: 0.3+`) are significantly faster.
- `strategy_effectiveness_report` returns all strategies with their average effectiveness, plus `best:` key pointing to the highest scorer.
- Gemspec `spec.files = Dir['lib/**/*']` — no git ls-files dependency.
