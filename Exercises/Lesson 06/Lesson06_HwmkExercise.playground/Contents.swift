//: Playground - noun: a place where people can play

import Foundation

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
        if health>0{
            return true
        }
        else{
            return false
        }
    }
}

class GoodPlayer : Player{
    
    
    override func attack() -> Int {
        
        return 4 * attackmagnitude
    }
    
}

class BadPlayer : Player{
    
    
    override func attack() -> Int {
        return 2 * attackmagnitude
    }
}


class Match{
    
    var playerOne : GoodPlayer
    var playerTwo : BadPlayer
    
    
    init(playerOnename : GoodPlayer, playerTwoname : BadPlayer){
        self.playerOne=playerOnename
        self.playerTwo=playerTwoname
        
    }

    func playGame(){
        
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
        if !playerOne.isAlive(){
            println(" \(playerTwo.name) is alive")
        }
        else{
            println(" \(playerOne.name) is alive")
        }
    }
}

let p1 = GoodPlayer(name: "p1")
let p2 = BadPlayer(name: "p2")
let playmatch = Match(playerOnename: p1, playerTwoname: p2)

playmatch.playGame()















