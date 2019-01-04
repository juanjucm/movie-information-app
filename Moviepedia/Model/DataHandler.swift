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
    
    
    //Unique instance for singleton pattern.
    private static let shared = DataHandler()
    
    //Get constants struct
    let constants = Constants()
    
    private init(){
    }
    
    //Function to get unique class instance
    class func getShared() -> DataHandler {
        return shared
    }
    
    //Creates actors model from parsed data
    func loadActorsFromDictionaries(actorsArray: Array<Dictionary<String, AnyObject>>) throws {
        for actor in actorsArray {
            guard let newId = actor["id"] as? Int else{throw MyError.runtimeError("Parsing Error.")}
            guard let newName = actor["name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBD = actor["birth_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDD = actor["dead_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = actor["photo_name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            
            let newActor = Actor(id: newId, name: newName, birthDate: self.constants.formatter.date(from: newBD)!, deadDate: self.constants.formatter.date(from: newDD), photo: newPhoto)
            actors.append(newActor)
        }
    }
    
    //Creates directors model from parsed data
    func loadDirectorsFromDictionaries(directorsArray: Array<Dictionary<String, AnyObject>>) throws {
        for director in directorsArray {
            guard let newId = director["id"] as? Int else{throw MyError.runtimeError("Parsing Error.")}
            guard let newName = director["name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBD = director["birth_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDD = director["dead_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = director["photo_name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            
            let newDirector = Director(id: newId, name: newName, birthDate: self.constants.formatter.date(from: newBD)!, deadDate: self.constants.formatter.date(from: newDD), photo: newPhoto)
            directors.append(newDirector)
        }
    }
    //Creates films model from parsed data
    func loadFilmsFromDictionaries(filmsArray: Array<Dictionary<String, AnyObject>>) throws {
        for film in filmsArray {
            guard let newId = film["id"] as? Int else{throw MyError.runtimeError("Parsing Error.")}
            guard let newName = film["name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newYear = film["year"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newTime = film["time"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newCountry = film["country"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = film["photo_name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDirector = film["director"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newCast = film["cast"] as? Array<String> else{throw MyError.runtimeError("Parsing Error.")}
            
            //Get actors and director objects according with names:
            var director: Director?
            for d in self.directors {
                if d.name == newDirector{
                    director = d
                    break
                }
            }
            var castList = Array<Actor>()
            for a1 in newCast {
                for a2 in self.actors {
                    if a2.name == a1 {
                        castList.append(a2)
                        continue
                    }
                }
            }
            
            let newFilm = Film(id: newId, name: newName, year: newYear, time: newTime, country: newCountry, photo: newPhoto, director: director!, cast: castList)
            self.films.append(newFilm)
            
            //Include the film in actors/director's filmography
            director?.addFilm(film: newFilm)
            for c in castList{
                c.addFilm(film: newFilm)
            }
        }
    }
}
