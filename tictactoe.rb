# Entry point for the game

require_relative 'lib/game_manager.rb'
require_relative 'lib/player.rb'
require_relative 'lib/cli_strategy.rb'
require_relative 'lib/dumb_ai_strategy.rb'
require_relative 'lib/grid.rb'
require_relative 'lib/scorer.rb'

grid = Grid.new
scorer = Scorer.new
human_player = Player.new('🍌', CLIStrategy.new)
ai_player = Player.new('🍐', DumbAIStrategy.new)
another_human_player = Player.new('🍎', CLIStrategy.new)

game = GameManager.new(
  players: [human_player, ai_player, another_human_player],
  grid: grid,
  scorer: scorer
)

game.play
