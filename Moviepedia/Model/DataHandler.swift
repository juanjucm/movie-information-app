//
//  DataHandler.swift
//  Moviepedia
//
//  Created by Juan Julián on 28/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import Foundation

final class DataHandler {
    var films = [Film]()
    var actors = [Actor]()
    var directors = [Director]()
    
    let formatter = DateFormatter()
    
    //Unique instance for singleton pattern.
    private static let shared = DataHandler()
    
    private init(){
        self.formatter.dateFormat = "dd/MM/yyyy"
    }
    
    class func getShared() -> DataHandler {
        return shared
    }
    
    func loadActorsFromDictionaries(actorsArray: Array<Dictionary<String, AnyObject>>) throws {
        for actor in actorsArray {
            guard let newId = actor["id"] as? Int else{throw MyError.runtimeError("Parsing Error.")}
            guard let newName = actor["name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBD = actor["born_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDD = actor["dead_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = actor["photo_name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            
            let newActor = Actor(id: newId, name: newName, born_date: self.formatter.date(from: newBD), dead_date: self.formatter.date(from: newDD), photo: newPhoto)
            actors.append(newActor)
        }
    }
}
