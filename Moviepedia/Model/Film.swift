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
    let photo: String
    let trailer: String
    let directors: [Director]
    let cast: [Actor]
    
    init(id: Int, name:String, year:String, time:String, country:String, photo:String, trailer:String, directors: [Director], cast: [Actor]) {
        self.id = id
        self.name = name
        self.year = year
        self.time = time
        self.country = country
        self.photo = photo
        self.trailer = trailer
        self.directors = directors
        self.cast = cast
    }
}
