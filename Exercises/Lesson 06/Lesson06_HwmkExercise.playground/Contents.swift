//: Playground - noun: a place where people can play

import UIKit

class Player{
    var health : Int
    var name : String
    
    init(health:Int,name:String){
        self.health=100
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
    
}

class BadPlayer{
    
}


class Match{
    var playerOne : Player
    var playerTwo : Player
    
    init(){
        
    }
    

    func playGame(){
        
        while(playerOne.isAlive()==true) && (playerTwo.isAlive()==true){
            
        }
    }
}
