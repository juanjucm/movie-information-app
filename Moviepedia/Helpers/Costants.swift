//
//  Costants.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import Foundation

enum MyError: Error{
    case runtimeError(String)
}

struct Constants {
    //date constants
    let formatter = DateFormatter()
    let yearFormatter = DateFormatter()
    let calendar = Calendar(identifier: .gregorian)
    
    init() {
        formatter.dateFormat = "dd/MM/yyyy"
        yearFormatter.dateFormat = "yyyy"
    }
}






