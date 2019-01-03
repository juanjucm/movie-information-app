//
//  ViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import UIKit

class FilmsViewController: UITableViewController {
    let dataHandler = DataHandler.getShared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a
        
        //Parse data from JSON file
        let actors = parseDataFromJSON(resourceName: "actors_info")
        let directors = parseDataFromJSON(resourceName: "directors_info")
        let films = parseDataFromJSON(resourceName: "films_info")
        
        //Use parsed data to create our model:
        do{
            try dataHandler.loadActorsFromDictionaries(actorsArray: actors)
            try dataHandler.loadDirectorsFromDictionaries(directorsArray: directors)
            try dataHandler.loadFilmsFromDictionaries(filmsArray: films)
        }catch MyError.runtimeError(let errorMessage) {
            print(errorMessage)
        }catch {
            print("")
        }
    }
}

extension FilmsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for:indexPath)
        
        let film =  dataHandler.films[indexPath.row]
        cell.textLabel?.text = film.name
        cell.detailTextLabel?.text = film.director.name
        return cell
    }
    
}

