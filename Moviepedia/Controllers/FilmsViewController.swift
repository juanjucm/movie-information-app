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
    var selectedFilm: Film?
    var filmsToHandle = Array<Film>()
    
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        filmsToHandle = dataHandler.films
    }
    
    
    @IBAction func sortAction(_ sender: Any) {
        switch self.sortSegmentedControl.selectedSegmentIndex {
        //sort by name
        case 0:
            filmsToHandle.sort {$0.name < $1.name}
            self.tableView.reloadData()
        //sort by directors name
        case 1:
            filmsToHandle.sort {$0.directors[0].name < $1.directors[0].name}
            self.tableView.reloadData()
        //sort by year
        case 2:
            filmsToHandle.sort {$0.year < $1.year}
            self.tableView.reloadData()
        //sort by country
        case 3:
            filmsToHandle.sort {$0.country < $1.country}
        default:
            break
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsToHandle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for:indexPath) as! FilmsTableViewCell
        let film =  filmsToHandle[indexPath.row]
        
        cell.filmNameLabel?.text = film.name
        var dirString = ""
        for d in film.directors{
            dirString.append(d.name)
            dirString.append(", ")
        }
        dirString.removeLast(2)
        cell.filmDirectorLabel?.text = dirString
        cell.filmYearLabel.text = self.constants.yearFormatter.string(from: film.year)
        cell.filmImage?.downloadImage(link: film.photo)
        cell.filmImage?.layer.cornerRadius = 5.0
        
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
        selectedFilm = filmsToHandle[indexPath.row]
        performSegue(withIdentifier: "film_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "film_detail"{
            if let destinationVC = segue.destination as? FilmDetailViewController {
                destinationVC.film = self.selectedFilm
            }
        }
    }
}
