//
//  passwordGeneration.swift
//  CantPwnThis
//
//  Created by Dmitry on 21.08.2023.
//

import Foundation

class passwordGeneration {
    var existingPassword: String = ""
    
    
    func generatePass(length: Int, lower: Bool, upper: Bool, number: Bool, special: Bool) -> String {
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "0123456789"
        let specials = "!@#$%^&*()-_+=?,./;'[]{}"
        
        
        var letters = ""
        
        if lower {
            letters += lowercase
        }
        if upper {
            letters += uppercase
        }
        if number {
            letters += numbers
        }
        if special {
            letters += specials
        }
        
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
