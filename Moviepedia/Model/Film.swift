//
//  Film.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Film: NSObject {
    let id: Int
    let name: String
    let year: String
    let time: String
    let country: String
    let director: Director
    let cast: [Actor]
    
    init(id: Int, name:String, year:String, time:String, country:String, director: Director, cast: [Actor]) {
        self.id = id
        self.name = name
        self.year = year
        self.time = time
        self.country = country
        self.director = director
        self.cast = cast
    }
}
