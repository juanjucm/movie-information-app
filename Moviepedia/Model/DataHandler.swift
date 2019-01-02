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
    
    private init(){}
    
    class func getShared() -> DataHandler {
        return shared
    }
    
    func parseActorsFromJSON() {
        if let path = Bundle.main.path(forResource: "actors_info", ofType: "json", inDirectory:"Data") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, NSArray>{
                    for a in jsonResult["actors"]!{
                        if let actor = a as? Dictionary<String, AnyObject>{
                            print(actor)
                            //Create each actor class
                        }
                    }
                }
            } catch {
                // handle error
            }
        }
    }
}
