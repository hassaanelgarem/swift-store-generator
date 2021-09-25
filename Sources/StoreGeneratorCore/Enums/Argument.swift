//
//  Argument.swift
//  StoreGeneratorCore
//
//  Created by Hassaan El-Garem on 9/26/21.
//

import Foundation

public enum Argument: String {
    case type
    case source
    case destination
    
    var shortArgument: String {
        guard let firstLetter = self.rawValue.first else {
            return "Invalid"
        }
        return String(firstLetter)
    }
    
    var longArgument: String {
        return "-\(self.rawValue)"
    }
}
