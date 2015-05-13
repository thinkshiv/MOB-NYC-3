//: Playground - noun: a place where people can play

import UIKit

class Player{
    var health : Int = 100
    var name : String
    
    init(name:String){
        
        self.name=name
        println("Player name is /(name)")
    }
    
    func attack() ->Int{
        return health
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

class GoodPlayer{
    let randomNumber = arc4random_uniform(100) + 0
    println(randomNumber)
}

class BadPlayer{
    
}


class Match{
    var playerOne : GoodPlayer
    var playerTwo : BadPlayer
    
    init(){
        //self.playerOne.name=playerOne.name
        //self.playerTwo.name=playerTwo.name
        println("Player name is /(name)")
        
    }
    
    init(name1:String,name2:String){
       // self.name=playerOne.name
       // self.name=playerTwo.name
    }
    

    func playGame(){
        println("Player name is /(name1)")
        
        //while(playerOne.isAlive()==true) && (playerTwo.isAlive()==true){
            
        //}
    }
}

var play = Match()
play.playGame()

