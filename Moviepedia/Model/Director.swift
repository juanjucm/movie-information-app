//
//  Director.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Director {
    let id: Int
    let name: String
    let born_date: Date?
    let dead_date: Date?
    var photo:String?
    var filmography:[Film]
    
    init(id: Int, name: String, surname: String, born_date: Date?, dead_date: Date?, photo:String?, filmography:[Film] = []) {
        self.id = id
        self.name = name
        self.born_date = born_date
        self.dead_date = dead_date
        self.filmography = filmography
        self.photo = photo
    }
    
    func addFilm(film: Film){
        self.filmography.append(film)
    }
}
