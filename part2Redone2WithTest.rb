=begin
 Karen West - April 7th, 2013
 HW 1-2: Rock-Paper-Scissors

In a game of rock-paper-scissors (RPS), each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: R beats S; S beats P; and P beats R. We will encode a rock-paper-scissors game as a list, where the elements are themselves 2-element lists that encode a player's name and a player's selected move, as shown below:

[ ["Armando", "P"], ["Dave", "S"] ] # Dave would win since S > P

Part A: Write a method rps_game_winner that takes a two-element list and behaves as follows:
-- If the number of players is not equal to 2, raise WrongNumberOfPlayersError.
--If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise NoSuchStrategyError.
--Otherwise, return the name and move of the winning player. If both players play the same move, the first player is the winner.

Part B: We will define a rock-paper-scissors tournament to be an array of games in which each player always plays the same move. A rock-paper-scissors tournament is encoded as a bracketed array of games:

[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

In the tournament above Armando will always play P and Dave will always play S. This tournament plays out as follows:

    Dave would beat Armando (S>P),
    Richard would beat Michael (R>S), and then
    Dave and Richard would play (Richard wins since R>S).

Similarly,

    Allen would beat Omer,
    Richard X would beat David E., and
    Allen and Richard X. would play (Allen wins since S>P).

Finally,

    Richard would beat Allen since R>S.

Note that the tournament continues until there is only a single winner.

Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to a single winner. You can assume that the initial tournament is well-formed (that is, there are 2^n players, and each one participates in exactly one match per round).

Write a method rps_tournament_winner that takes a tournament encoded as a bracketed array and returns the winner (for the above example, it should return ["Richard", "R"]).

=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_tournament_winner(tournament)
  #PART B - description above
  # YOUR CODE HERE
  #for each tournament game, call rps_game_winner
  i = 0 #count games (for debug)
  j = 0 #count game arrays (for debug)
  lenTournament = 0
  lastTournamentGame = []
  finalOf16or32PlayerGame = []
  semiFinal16or32PlayerGame1 = []
  semiFinal16or32PlayerGame2 = []
  semiFinals = []
  quarterFinal32PlayerGame1 = []
  quarterFinal32PlayerGame2 = []
  quarterFinal32PlayerGame3 = []
  quarterFinal32PlayerGame4 = []
  toSemiFinals = []
  quarterFinals = []
  gamePlayers = []
  lastGame = []
  name = nil
  saveOneGame = []
  moveStrategy = ""
  result = []
  tournamentLen = tournament.length
  countTournaments = 0
  puts "tournament length"
  puts tournamentLen
  puts tournament
  game = []
  if tournamentLen == 1
    #puts tournament[0]
    #puts tournament[0][0]
    game.concat(tournament[0][0])
    #puts tournament[0][1]
    return rps_game_winner(game)
  end
  tournament.each do |gameArray|
    countTournaments += 1
    #puts "game Array length"
    #puts gameArray.length
    #puts gameArray
    if (gameArray != [nil,nil])
      j += 1
      gamePlayers = []
      lastGame = []
      name = nil
      saveOneGame = []
      gameArray.each do |game|
        if (game != nil) # checking to see if game is nil with a game match
                         # in which case the non-nil game winner wins match
          i += 1
          result = rps_game_winner(game)
          gamePlayers.concat([result])
        end
      end #end of games within one game match within a tournament
    end #checking to see if a tournament is nil
    if i == 1 and j == 1 and gamePlayers != []
      saveOneGame.concat(gamePlayers)
    end
    #puts "players for last game in this array of games"
    if (saveOneGame == [])
      gamePlayers.each do |playerNameMove| #play last game of match
        lastGame.concat([playerNameMove])
      end
      result = rps_game_winner(lastGame)
      lastTournamentGame.concat([result])
      #puts lastTournamentGame
    end
  end #of tournaments
  if (lastTournamentGame != [])
    lenTournament = lastTournamentGame.length
    #puts lastTournamentGame
    #puts "lastTournamentGame"
    #puts lenTournament

    if lenTournament == 2 # start of tournament had 8 players
      #puts "8player last tournament"
      #puts lastTournamentGame
      result = rps_game_winner(lastTournamentGame)
    elsif lenTournament == 4 #start of tournament had 16 players
        puts "semi finals of 16 player game"
        #puts lastTournamentGame[0]
        #puts lastTournamentGame[1]
        #puts lastTournamentGame[2]
        #puts lastTournamentGame[3]
        semiFinal16or32PlayerGame1.concat([lastTournamentGame[0]])
        semiFinal16or32PlayerGame1.concat([lastTournamentGame[1]])
        semiFinal16or32PlayerGame2.concat([lastTournamentGame[2]])
        semiFinal16or32PlayerGame2.concat([lastTournamentGame[3]])
        semiFinals.concat([semiFinal16or32PlayerGame1])
        semiFinals.concat([semiFinal16or32PlayerGame2])

        semiFinals.each do |semifinalGame|
          #puts "semi final of 16 player"
          #puts "semifinalGame"
          #puts semifinalGame
          #puts semifinalGame[0]
          #puts semifinalGame[1]
          result = rps_game_winner(semifinalGame)
          finalOf16or32PlayerGame.concat([result])
        end
        #puts "final game 16 player"
        #puts finalOf16PlayerGame
        result = rps_game_winner(finalOf16or32PlayerGame)
    elsif lenTournament == 8 #start of tournament had 32 players
        #puts "quarter finals of 32 player game"
        #puts lastTournamentGame[0]
        #puts lastTournamentGame[1]
        #puts lastTournamentGame[2]
        #puts lastTournamentGame[3]
        quarterFinal32PlayerGame1.concat([lastTournamentGame[0]])
        quarterFinal32PlayerGame1.concat([lastTournamentGame[1]])
        quarterFinal32PlayerGame2.concat([lastTournamentGame[2]])
        quarterFinal32PlayerGame2.concat([lastTournamentGame[3]])
        quarterFinal32PlayerGame3.concat([lastTournamentGame[4]])
        quarterFinal32PlayerGame3.concat([lastTournamentGame[5]])
        quarterFinal32PlayerGame4.concat([lastTournamentGame[6]])
        quarterFinal32PlayerGame4.concat([lastTournamentGame[7]])
        quarterFinals.concat([quarterFinal32PlayerGame1])
        quarterFinals.concat([quarterFinal32PlayerGame2])
        quarterFinals.concat([quarterFinal32PlayerGame3])
        quarterFinals.concat([quarterFinal32PlayerGame4])

        quarterFinals.each do |quarterfinalGame|
          #puts "quarter final of 32 player"
          #puts "quarterfinalGame"
          #puts quarterfinalGame
          #puts quarterfinalGame[0]
          #puts quarterfinalGame[1]
          result = rps_game_winner(quarterfinalGame)
          toSemiFinals.concat([result])
        end
        #4 players left now
        semiFinal16or32PlayerGame1.concat([toSemiFinals[0]])
        semiFinal16or32PlayerGame1.concat([toSemiFinals[1]])
        semiFinal16or32PlayerGame2.concat([toSemiFinals[2]])
        semiFinal16or32PlayerGame2.concat([toSemiFinals[3]])
        semiFinals.concat([semiFinal16or32PlayerGame1])
        semiFinals.concat([semiFinal16or32PlayerGame2])

        semiFinals.each do |semifinalGame|
          #puts "semi final of 16 player"
          #puts "semifinalGame"
          #puts semifinalGame
          #puts semifinalGame[0]
          #puts semifinalGame[1]
          result = rps_game_winner(semifinalGame)
          finalOf16or32PlayerGame.concat([result])
        end
        #puts "final game 32 player"
        #puts finalOf16or32PlayerGame
        result = rps_game_winner(finalOf16or32PlayerGame)
    end
  end
  return result
end

def rps_game_winner(game)
  #PART A - description above
  #debug-purposes-only:
  #puts "game"
  #puts game
  #puts game.length
  #puts "game length"
  raise WrongNumberOfPlayersError unless game.length == 2
  # your code here
  players = {}
  moveStrategy = ""
  name = nil
  i = 0
  game.each do |player|
    name = player[0]
    moveStrategy = player[1].downcase
    if moveStrategy == "r" or moveStrategy == "p" or moveStrategy == "s"
      players[i] = [name,moveStrategy] #put player name and valid move strategy for game in hash or dictionary
      i += 1
    else
      raise NoSuchStrategyError
    end
  end
  name = nil
  moveStrategy = ""
  #The rules are: R beats S; S beats P; and P beats R.
  if (players[0][1] == players[1][1]) # move strategy same both players -- first player wins!
    name = players[0][0]
    moveStrategy = players[0][1]
    #puts "first player wins since both players had same move strategies!"
    #puts players[0][1] + " was the move strategy for both players"
  elsif (players[0][1] == "r" and players[1][1] == "s") #r beats s, so first player wins!
    name = players[0][0]
    moveStrategy = players[0][1]
    #puts "first player wins since R beats S!"
  elsif (players[0][1] == "s" and players[1][1] == "p") #s beats p, so first player wins!
    name = players[0][0]
    moveStrategy = players[0][1]
    #puts "first player wins since S beats P!"
  elsif (players[0][1] == "p" and players[1][1] == "r") #p beats r, so first player wins!
    name = players[0][0]
    moveStrategy = players[0][1]
    #puts "first player wins since P beats R!"
  elsif (players[0][1] == "s" and players[1][1] == "r") #r beats s, so second player wins!
    name = players[1][0]
    moveStrategy = players[1][1]
    #puts "second player wins since R beats S!"
  elsif (players[0][1] == "p" and players[1][1] == "s") #s beats p, so second player wins!
    name = players[1][0]
    moveStrategy = players[1][1]
    #puts "second player wins since S beats P!"
  elsif (players[0][1] == "r" and players[1][1] == "p") #p beats r, so second player wins!
    name = players[1][0]
    moveStrategy = players[1][1]
    #puts "second player wins since P beats R!"
  end
  return [name,moveStrategy]
end

game1a = [ ["Armando", "P"], ["Dave", "S"] ]
game5 = [ ["Armando2", "S"], ["Dave2", "P"] ]
puts "game 1a with Armando's game move strategy P and Dave's game move strategy S"
result = []
result = rps_game_winner game1a
if result != []
  puts result[0] + " won game1a!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end
#oddly enough -- failed last time I took this class, but did not change
#anything, and this test case works for me (last time just had the above
#simple test case).
game1b = [ ["Dave", "P"], ["Armando", "S"] ]
puts "game 1b with Dave's game move strategy P and Armando's game move strategy S"
result = rps_game_winner game1b
if result != []
  puts result[0] + " won game1b!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end

#this test case failed last time too--when both have same move strategy
#did not test myself last time but failed autograder.
#It seems to work for me here too!
game1c = [ ["Dave", "P"], ["Armando", "P"] ]
puts "game 1c with Dave's game move strategy P and Armando's game move strategy P--both same strategy and first player should win"
result = rps_game_winner game1c
if result != []
  puts result[0] + " won game1c!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end

game2 = [ ["Richard", "R"],  ["Michael", "S"] ]
game6 = [ ["Richard2", "S"],  ["Michael2", "R"] ]

puts "game 2 with Richard's game move strategy R and Michael's game move strategy S"
result = rps_game_winner game2
if result != []
  puts result[0] + " won game2!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end

game3 = [ ["Allen", "S"], ["Omer", "P"] ]
game7 = [ ["Allen2", "P"], ["Omer2", "S"] ]

puts "game 3 with Allen's game move strategy S and Omer's game move strategy P"
result = rps_game_winner game3
if result != []
  puts result[0] + " won game3!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end

game4 = [ ["David E.", "R"], ["Richard X.", "P"] ]
game8 = [ ["David2 E.", "P"], ["Richard2 X.", "R"] ]

puts "game 4 with David E's game move strategy R and Richard X's game move strategy P"
result = rps_game_winner game4
if result != []
  puts result[0] + " won game4!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors game winner!"
end
=begin
[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
=end

oneGameTournament = [[game1a]]
puts "one game tournament time (no other nils in tournament to hold places)!  The rules are: R beats S; S beats P; and P beats R."
puts "game1 only game in this tournament"
puts "game 1, round1, only game, only round: Armando plays P, Dave plays S, Dave should win game 1."
result = rps_tournament_winner oneGameTournament
if result != []
  puts result[0] + "  won the tournament!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors one game tournament winner!"
end

oneGameTournament = [[game1a,nil],[nil,nil]]
puts "one game tournament time!  The rules are: R beats S; S beats P; and P beats R."
puts "game1 only game in this tournament"
puts "game 1, round1, only game, only round: Armando plays P, Dave plays S, Dave should win game 1."
result = rps_tournament_winner oneGameTournament
if result != []
  puts result[0] + "  won the tournament!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors one game tournament winner!"
end

tournament = [[game1a,game2], [game3,game4]]
puts "tournament time!  The rules are: R beats S; S beats P; and P beats R."
puts "8 player tournament given in homework"

puts "game 1, round1: Armando plays P, Dave plays S, Dave should win game 1."
puts "game 2, round1: Richard plays R, Michael plays S, Richard should win game 2."
puts "game 3, round1: Dave plays S, Richard plays R, Richard should win game 3 of round1 and will play winner of round2."
puts "game 1, round2: Allen plays S, Omer plays P, Allen should win game 1."
puts "game 2, round2: David E. plays R, Richard X. plays P, Richard X. should win game 2, round 2."
puts "game 3, round2: Allen plays S, Richard X. plays P, Richard X. plays P, Allen wins game 3 of round 2 of tournament and will play winner of round1."
puts "final game: round1 winner plays round 2 winner of tournament:"
puts "round1 winner Richard plays R, round 2 winner Allen plays S, Richard should win the tournament!"
result = rps_tournament_winner tournament
if result != []
  puts result[0] + "  won the tournament!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors tournament winner!"
end

tournament = [[game1a,game2], [game3,game4], [game5,game6], [game7,game8]]
puts "tournament time!  The rules are: R beats S; S beats P; and P beats R."
puts "16 player tournament"

puts "game 1, round1: Armando plays P, Dave plays S, Dave should win game 1."
puts "game 2, round1: Richard plays R, Michael plays S, Richard should win game 2."
puts "game 3, round1: Dave plays S, Richard plays R, Richard should win game 3 of round1 and will play winner of round2."
puts "game 1, round2: Allen plays S, Omer plays P, Allen should win game 1."
puts "game 2, round2: David E. plays R, Richard X. plays P, Richard X. should win game 2, round 2."
puts "game 3, round2: Allen plays S, Richard X. plays P, Allen wins game 3 of round 2 of tournament and will play winner of round1."

puts "game 1, round3: Armando2 plays S, Dave2 plays P, Armando2 should win game 1."
puts "game 2, round3: Richard2 plays S, Michael2 plays R, Michael2 should win game 2."
puts "game 3, round3: Armando2 plays S, Michael2 plays R, Michael2 should win game 3 of round3 and will play winner of round4."
puts "game 1, round4: Allen2 plays P, Omer2 plays S, Omer2 should win game 1."
puts "game 2, round4: David2 E. plays P, Richard2 X. plays R, David2 E. should win game 2, round 4."
puts "game 3, round4: Omer2 plays S, David2 E. plays P, Omer2 wins game 3 of round 4 of tournament and will play winner of round3."

puts "semi-final1: round1 winner against round2 winner"
puts "round1 winner Richard plays R, round2 winner Allen plays S, Richard should win the semi-finals of round1/round2 player winners"

puts "semi-final2: round3 winner against round4 winner"
puts "round3 winner Michael2 plays R, round4 winner Omer2 plays S, Michael2 should win the semi-finals of round3/round4 player winners"

puts "final game: semi-final 1 winner plays semi-final 2 winner of tournament:"
puts "semi-final 1 winner Richard plays R, semi-final 2 winner Michael2 plays R, Richard should win the tournament, since for a tie, first player wins!"
result = rps_tournament_winner tournament
if result != []
  puts result[0] + "  won the tournament!-- with move strategy " + result[1]
else
  puts "Error -- there was no rock, paper, scissors tournament winner!"
end

=begin
Test submission results (some passes, some fails):

On Time
#rps_game_winner
  should be defined
  should raise WrongNumberOfPlayersError if there are not exactly two players [1 point]
  should raise NoSuchStrategyError if there is some strategy that is not R, P, or S [4 points]
  should return the correct winner in a simple RPS game with a clear winner [15 points]
  should return the first player in the case of a tie [10 points]

#rps_tournament_winner
  should be defined
  should still be able to handle the case where a tournament is just one game [10 points] (FAILED)
  should pass the example given in the homework of an 8-player tournament [5 points]
  should pass a basic test case of 8 players [15 points]
  should return the correct winner in the cases of 16 and 32-man tournaments [40 points] (FAILED)

Failures:

  1) #rps_tournament_winner should still be able to handle the case where a tournament is just one game [10 points]
     Failure/Error: raise WrongNumberOfPlayersError unless game.length == 2
     WrongNumberOfPlayersError:
       WrongNumberOfPlayersError
     # /tmp/rspec20130411-21456-11u0eg5.rb:223:in `rps_game_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:110:in `block (2 levels) in rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:106:in `each'
     # /tmp/rspec20130411-21456-11u0eg5.rb:106:in `block in rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:95:in `each'
     # /tmp/rspec20130411-21456-11u0eg5.rb:95:in `rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:323:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130411-21456-11u0eg5.rb:283:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130411-21456-11u0eg5.rb:282:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  2) #rps_tournament_winner should return the correct winner in the cases of 16 and 32-man tournaments [40 points]
     Failure/Error: moveStrategy = player[1].downcase
     NoMethodError:
       undefined method `downcase' for [["Cx", "P"], ["Dx", "S"]]:Array
     # /tmp/rspec20130411-21456-11u0eg5.rb:231:in `block in rps_game_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:229:in `each'
     # /tmp/rspec20130411-21456-11u0eg5.rb:229:in `rps_game_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:110:in `block (2 levels) in rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:106:in `each'
     # /tmp/rspec20130411-21456-11u0eg5.rb:106:in `block in rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:95:in `each'
     # /tmp/rspec20130411-21456-11u0eg5.rb:95:in `rps_tournament_winner'
     # /tmp/rspec20130411-21456-11u0eg5.rb:465:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130411-21456-11u0eg5.rb:283:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130411-21456-11u0eg5.rb:282:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

Finished in 0.0476 seconds
10 examples, 2 failures

Failed examples:

rspec /tmp/rspec20130411-21456-11u0eg5.rb:321 # #rps_tournament_winner should still be able to handle the case where a tournament is just one game [10 points]
rspec /tmp/rspec20130411-21456-11u0eg5.rb:362 # #rps_tournament_winner should return the correct winner in the cases of 16 and 32-man tournaments [40 points]
=end

