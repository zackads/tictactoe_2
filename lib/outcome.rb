class Outcome
  attr_accessor :winning_token

  def initialize(winning_token: nil)
    @winning_token = winning_token
  end
end
