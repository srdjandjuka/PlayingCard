//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Srdjan Djukanovic on 5/25/18.
//  Copyright © 2018 Srdjan Djukanovic. All rights reserved.
//

import Foundation

struct PlayingCard : CustomStringConvertible {
    
    var suit : Suit
    var rank : Rank
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    enum Suit : String, CustomStringConvertible {
        
        var description: String {
            return self.rawValue
        }
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    
    enum Rank : CustomStringConvertible {
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .numeric(let pips) :
                return String(pips)
            case .face(let kind) :
                return kind
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order : Int {
            switch self {
            case .ace:
                return 1
            case .numeric(let number) :
                return number
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default:
                return 0
            }
        }
        
        static var all : [Rank] {
            var allRank = [Rank.ace]
            
            for pips in 2...10 {
                allRank.append(Rank.numeric(pips))
            }
            
            allRank += [Rank.face("J"), .face("Q"), .face("K")]
            
            return allRank
        }
    }
}
