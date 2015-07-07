//
//  Ingredient.swift
//  PaleoAssist
//
//  Created by Shiven Ramji on 7/5/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import Foundation

public class Ingredient: NSObject, NSCoding, Equatable {
    
    public let quantity: String
    public let name: String
    public let type: IngredientType
    public var purchased: Bool
    
    // MARK: NSCoding
    
    private let QuantityKey = "QuantityKey"
    private let NameKey = "NameKey"
    private let TypeKey = "TypeKey"
    private let PurchasedKey = "Purchased"
    
    init(quantity: String, name: String, type: IngredientType) {
        self.quantity = quantity
        self.name = name
        self.type = type
        self.purchased = false
    }
    
    public required init(coder aDecoder: NSCoder) {
        quantity = aDecoder.decodeObjectForKey(QuantityKey) as! String
        name = aDecoder.decodeObjectForKey(NameKey) as! String
        type = IngredientType(rawValue: aDecoder.decodeObjectForKey(TypeKey) as! String)!
        purchased = aDecoder.decodeBoolForKey(PurchasedKey)
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(quantity, forKey: QuantityKey)
        aCoder.encodeObject(name, forKey: NameKey)
        aCoder.encodeObject(type.rawValue, forKey: TypeKey)
        aCoder.encodeBool(purchased, forKey: PurchasedKey)
    }
    
}

public func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
    return lhs.quantity == rhs.quantity &&
        lhs.name == rhs.name &&
        lhs.type == rhs.type
}