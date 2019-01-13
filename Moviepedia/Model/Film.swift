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
    let year: Date
    let time: String
    let country: String
    let photo: String
    let trailer: String
    let synopsis: String
    let directors: [Director]
    let cast: [Actor]
    
    init(id: Int, name:String, year:Date, time:String, country:String, photo:String, trailer:String, synopsis: String, directors: [Director], cast: [Actor]) {
        self.id = id
        self.name = name
        self.year = year
        self.time = time
        self.country = country
        self.synopsis = synopsis
        self.photo = photo
        self.trailer = trailer
        self.directors = directors
        self.cast = cast
    }
}
