//
//  Actor.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Actor {
    let id: Int
    let name: String
    let birthDate: Date
    let deadDate: Date?
    var photo:String
    var filmography:[Film]
    var biography:String
    
    private let constants = Constants()
    
    var age: String {
        if self.deadDate == nil {
            let now = Date()
            let calcAge = constants.calendar.dateComponents([.year], from: self.birthDate, to:now)
            let age = calcAge.year
            return String(age!)
        }
        let calcAge = constants.calendar.dateComponents([.year], from: self.birthDate, to:self.deadDate!)
        let age = calcAge.year
        return String(age!)
    }
    
    init(id: Int, name: String, birthDate: Date, deadDate: Date?, photo:String, filmography:[Film] = [], biography: String = "") {
        self.id = id
        self.name = name
        self.birthDate = birthDate
        self.deadDate = deadDate
        self.filmography = filmography
        self.photo = photo
        self.biography = biography
    }
    
    func addFilm(film: Film){
        self.filmography.append(film)
    }
}
