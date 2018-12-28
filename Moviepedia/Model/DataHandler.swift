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
    
    //Singleton pattern
    private static let shared = DataHandler()
    
    private init(){}
    
}
