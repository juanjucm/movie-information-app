//
//  Film.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

class Film: NSObject {
    
    let name: String
    let duration: Int?
    let director: Director
    let cast: [Actor]
    
    init(id: Int, name:String, duration:Int?, director: Director, cast: [Actor]) {
        self.name = name
        self.duration = duration
        self.director = director
        self.cast = cast
    }
}
