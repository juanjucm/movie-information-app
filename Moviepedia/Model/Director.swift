//
//  Director.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Director {
    let name: String
    let surname: String
    let born_date: Date?
    let dead_date: Date?
    var biography:String?
    var photo:String?
    var filmography:[Film]
    
    init(name: String, surname: String, born_date: Date?, dead_date: Date?, biography:String?, photo:String?, filmography:[Film] = []) {
        self.name = name
        self.surname = surname
        self.born_date = born_date
        self.dead_date = dead_date
        self.filmography = filmography
        self.biography = biography
        self.photo = photo
    }
    
    func addFilm(film: Film){
        self.filmography.append(film)
    }
}
