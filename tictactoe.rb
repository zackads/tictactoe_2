# Entry point for the game

require_relative 'lib/game_manager.rb'
require_relative 'lib/player.rb'
require_relative 'lib/cli_strategy.rb'
require_relative 'lib/dumb_ai_strategy.rb'
require_relative 'lib/grid.rb'
require_relative 'lib/scorer.rb'

grid = Grid.new
scorer = Scorer.new
human_player = Player.new('X', CLIStrategy.new)
ai_player = Player.new('O', DumbAIStrategy.new)

game = GameManager.new(
  players: [human_player, ai_player],
  grid: grid,
  scorer: scorer
)

game.play
