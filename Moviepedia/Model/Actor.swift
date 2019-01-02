//
//  Actor.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Actor: Person {
    var biography:String?
    var photo:String?
    var filmography:[Film]
    
    
    init(name: String, surname: String, born_date: Date?, dead_date: Date?, biography:String?, photo:String?, filmography:[Film] = []) {
        
        self.filmography = filmography
        self.biography = biography
        self.photo = photo
        
        super.init(name: name, surname: surname, born_date: born_date, dead_date: dead_date)
    }
    
    func addFilm(film: Film){
        self.filmography.append(film)
    }
}
