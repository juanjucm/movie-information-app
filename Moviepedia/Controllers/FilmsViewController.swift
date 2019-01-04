//
//  ViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 14/12/2018.
//  Copyright © 2018 Juan Julián. All rights reserved.
//

import UIKit

class FilmsTableViewCell: UITableViewCell{

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmYearLabel: UILabel!
    @IBOutlet weak var filmDirectorLabel: UILabel!
    @IBOutlet weak var filmNameLabel: UILabel!
}

class FilmsViewController: UITableViewController {
    let dataHandler = DataHandler.getShared()
    let constants = Constants()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for:indexPath) as! FilmsTableViewCell
        let film =  dataHandler.films[indexPath.row]
        
        cell.filmNameLabel?.text = film.name
        cell.filmDirectorLabel?.text = film.director.name
        cell.filmYearLabel.text = film.year
        cell.filmImage?.image = UIImage(named: film.photo)
        return cell
    }
}

