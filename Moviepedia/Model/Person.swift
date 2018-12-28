//
//  Person.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Person: NSObject {
    
    let name: String
    let surname: String
    let born_date: Date?
    let dead_date: Date?
    
    init(name: String, surname: String, born_date: Date?, dead_date: Date?) {
        self.name = name
        self.surname = surname
        self.born_date = born_date
        self.dead_date = dead_date
    }
}
