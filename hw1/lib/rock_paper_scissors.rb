class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    raise NoSuchStrategyError.new "Strategy must be one of R,P,S" unless ["R","P","S"].include?(player1[1]) and ["R","P","S"].include?(player2[1])
    
	return player1 if player1[1] == "P" and player2[1] == "R"
	return player1 if player1[1] == "R" and player2[1] == "S"
	return player1 if player1[1] == "S" and player2[1] == "P"
	return player2 if player2[1] == "P" and player1[1] == "R"
	return player2 if player2[1] == "R" and player1[1] == "S"
	return player2 if player2[1] == "S" and player1[1] == "P"
	return player1
  end

  def self.tournament_winner(tournament)
  	if tournament.length == 2 and !tournament.first.first.kind_of?(Array)
  		return self.winner(tournament[0], tournament[1])
  	else
  		finalists = Array.new
		tournament.each { |game| finalists << self.tournament_winner(game) }
		return self.tournament_winner(finalists)
    end
  end

end