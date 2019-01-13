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
            guard let newDD = actor["death_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = actor["photo"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBio = actor["biography"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            
            let newActor = Actor(id: newId, name: newName, birthDate: self.constants.formatter.date(from: newBD)!, deathDate: self.constants.formatter.date(from: newDD), photo: newPhoto, biography: newBio)
            actors.append(newActor)
        }
    }
    
    //Creates directors model from parsed data
    func loadDirectorsFromDictionaries(directorsArray: Array<Dictionary<String, AnyObject>>) throws {
        for director in directorsArray {
            guard let newId = director["id"] as? Int else{throw MyError.runtimeError("Parsing Error.")}
            guard let newName = director["name"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBD = director["birth_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDD = director["death_date"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newPhoto = director["photo"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newBio = director["biography"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            
            let newDirector = Director(id: newId, name: newName, birthDate: self.constants.formatter.date(from: newBD)!, deathDate: self.constants.formatter.date(from: newDD), photo: newPhoto, biography: newBio)
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
            guard let newPhoto = film["photo"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newSynopsis = film["synopsis"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newTrailer = film["trailer"] as? String else{throw MyError.runtimeError("Parsing Error.")}
            guard let newDirectors = film["directors"] as? Array<String> else{throw MyError.runtimeError("Parsing Error.")}
            guard let newCast = film["cast"] as? Array<String> else{throw MyError.runtimeError("Parsing Error.")}
            
            //Get actors and director objects according with names:
            var directorsArray = Array<Director>()
            for d1 in newDirectors {
                for d2 in self.directors {
                    if d2.name == d1{
                        directorsArray.append(d2)
                        continue
                    }
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
            
            let newFilm = Film(id: newId, name: newName, year: self.constants.yearFormatter.date(from: newYear)!, time: newTime, country: newCountry, photo: newPhoto, trailer: newTrailer, synopsis: newSynopsis, directors: directorsArray, cast: castList)
            self.films.append(newFilm)
            
            //Include the film in actors/director's filmography
            for d in directorsArray{
                d.addFilm(film: newFilm)
            }
            for c in castList{
                c.addFilm(film: newFilm)
            }
        }
    }
}
