//
//  ViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dataHandler = DataHandler.getShared()
        
        //Parse data from JSON file
        var actors = parseDataFromJSON(resourceName: "actors_info")
        var directors = parseDataFromJSON(resourceName: "directors_info")
        var films = parseDataFromJSON(resourceName: "films_info")[0]["cast"]
        
        //Use parsed data to create our model:
        do{
            try dataHandler.loadActorsFromDictionaries(actorsArray: actors)
            //try dataHandler.loadDirectorsFromDictionaries(actorsArray: actors)
            //try dataHandler.loadFilmsFromDictionaries(actorsArray: actors)
        }catch MyError.runtimeError(let errorMessage) {
            print(errorMessage)
        }catch {
            print("")
        }
    }

}

