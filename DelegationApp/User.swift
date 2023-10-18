//
//  User.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 28.04.2023.
//

import Foundation

struct User {
    var name: String
    var surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
