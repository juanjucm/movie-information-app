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
    @IBOutlet weak var filmImageFrame: UIView!
}

class FilmsViewController: UITableViewController {
    let dataHandler = DataHandler.getShared()
    let constants = Constants()
    var filmSelected: Film?
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for:indexPath) as! FilmsTableViewCell
        let film =  dataHandler.films[indexPath.row]
        
        cell.filmNameLabel?.text = film.name
        var dirString = ""
        for d in film.directors{
            dirString.append(d.name)
            dirString.append(", ")
        }
        dirString.removeLast(2)
        cell.filmDirectorLabel?.text = dirString
        cell.filmYearLabel.text = film.year
        cell.filmImage?.image = UIImage(named: film.photo)
        cell.filmImage?.layer.cornerRadius = 10.0
        
        cell.filmImageFrame.clipsToBounds = false
        cell.filmImageFrame.layer.shadowColor = UIColor.black.cgColor
        cell.filmImageFrame.layer.shadowOpacity = 1
        cell.filmImageFrame.layer.shadowOffset = CGSize.zero
        cell.filmImageFrame.layer.shadowRadius = 5
        cell.filmImageFrame.layer.shadowPath = UIBezierPath(roundedRect: cell.filmImageFrame.bounds, cornerRadius: 5).cgPath
        cell.filmImageFrame.layer.cornerRadius = cell.filmImage.layer.cornerRadius
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filmSelected = dataHandler.films[indexPath.row]
        performSegue(withIdentifier: "", sender: self)
    }
    
    /*func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        vc.filmSelected =
    }*/
}
