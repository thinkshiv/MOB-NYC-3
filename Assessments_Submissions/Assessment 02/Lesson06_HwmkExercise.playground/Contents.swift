//: Game Simulator Playground
//: Author: Shiven Ramji

/* Assignment Challenge:
Make three classes, ‘Player’, ‘GoodPlayer’ and ‘BadPlayer’.‣ Player has an ‘attack’ method, which returns an Int, the amount of damage the attack does.‣ GoodPlayers and BadPlayers, when they attack, attack with different magnitudes (betweenGoodPlayer and BadPlayer, or [BONUS] different from attack to attack).‣ Players also have a health property (an Int that defaults to 100) and an ‘isAlive’ method (returns aBoolean). A Player is alive if their health is above 0.‣ Create a ‘Match’ class, which takes two players during initialization.‣ It has a ‘playGame()’ method, which pits each player against each other, alternating attacks untilone of the players is no longer alive. At the end of the match, return the winner.‣ Hint: This means you’ll need a way to have the attack of one player affect the health of the other.‣ Pit one GoodPlayer against a BadPlayer.‣ Bonus: Give players names, print those out before they match.

*/
import Foundation

// This is the Player Class which has the attack() and isAlive() methods
class Player{
    var health : Int = 100
    var name : String
    var attackmagnitude : Int = 2
    
    init(name:String){
        
        self.name=name
    }
    
    func attack() ->Int{
        return attackmagnitude
    }
    
    func isAlive() ->Bool{
        if health>0{ // check to see if the Player is alive
            return true
        }
        else{
            return false
        }
    }
}

// This is the GoodPlayer Class which overrrides the attack() method from Player. It also inherits fromt the Player class
class GoodPlayer : Player{
    
    
    override func attack() -> Int {
        
        return 4 * attackmagnitude
    }
    
}

// This is the BadPlayer Class which overrrides the attack() method from Player. It also inherits fromt the Player class
class BadPlayer : Player{
    
    
    override func attack() -> Int {
        return 2 * attackmagnitude
    }
}

// This is the Match class which takes 2 players as input. This has the playGame() method that returns the winner
class Match{
    
    var playerOne : GoodPlayer
    var playerTwo : BadPlayer
    
    
    init(playerOnename : GoodPlayer, playerTwoname : BadPlayer){
        self.playerOne=playerOnename
        self.playerTwo=playerTwoname
        
    }

    func playGame(){
        
        // Print the player names before they match
        println(" \(playerOne.name) is playing against \(playerTwo.name)")
        var isPlayerOne = true
        while(playerOne.isAlive()==true) && (playerTwo.isAlive()==true){
            if isPlayerOne{
                playerOne.attack()
                playerTwo.health=playerTwo.health - playerOne.attack()
                isPlayerOne=false
            }
            else{
                playerTwo.attack()
                playerOne.health=playerOne.health - playerTwo.attack()
                isPlayerOne=true
            }
        }
        // Print the winner
        if !playerOne.isAlive(){
            println(" \(playerTwo.name) is alive")
        }
        else{
            println(" \(playerOne.name) is alive")
        }
    }
}

// Initialize a good player and a bad player and pit against each other
let p1 = GoodPlayer(name: "Shiven")
let p2 = BadPlayer(name: "Will")
let playmatch = Match(playerOnename: p1, playerTwoname: p2)

// Begin the match
playmatch.playGame()


















