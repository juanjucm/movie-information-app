//
//  PersonDetailViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 05/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class PersonDetailTableViewCell: UITableViewCell{
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmImageFrame: UIView!
}

class PersonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let constants = Constants()
    
    var dh = DataHandler.getShared()
    var actor: Actor?
    var director: Director?
    var selectedFilm: Film?
    @IBOutlet weak var personDeadLabel: UILabel!
    @IBOutlet weak var personAgeLabel: UILabel!
    @IBOutlet weak var personBirthLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personBiographyLabel: UILabel!
    @IBOutlet weak var personFrame: UIView!
    @IBOutlet weak var filmsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        self.filmsTableView.delegate = self
        self.filmsTableView.dataSource = self
        self.filmsTableView.backgroundColor = .black
        
        self.filmsTableView.backgroundColor = UIColor.lightGray
        
        self.personBirthLabel.layer.cornerRadius = 5
        self.personBirthLabel.clipsToBounds = true
        
        if actor != nil{
            self.personNameLabel?.text = actor!.name
            self.personBiographyLabel?.text = actor!.biography
            
            self.personBirthLabel?.text = constants.formatter.string(from:self.actor!.birthDate)
            if actor!.deathDate != nil {
                self.personDeadLabel?.text = constants.formatter.string(from:self.actor!.deathDate!)
            }else{
                self.personDeadLabel?.text = ""
            }
            self.personAgeLabel?.text = self.actor!.age
            
            self.personImage?.downloadImage(link: self.actor!.photo)
            self.personImage?.layer.cornerRadius = 5.0
            self.personFrame?.clipsToBounds = false
            self.personFrame?.layer.shadowColor = UIColor.black.cgColor
            self.personFrame?.layer.shadowOpacity = 1
            self.personFrame?.layer.shadowOffset = CGSize.zero
            self.personFrame?.layer.shadowRadius = 4
            self.personFrame?.layer.shadowPath = UIBezierPath(roundedRect: self.personFrame.bounds, cornerRadius: 4).cgPath
            self.personFrame.layer.cornerRadius = self.personImage.layer.cornerRadius
        }else{
            self.personNameLabel?.text = director!.name
            self.personBiographyLabel?.text = director!.biography
            
            self.personBirthLabel?.text = constants.formatter.string(from:self.director!.birthDate)
            if director!.deathDate != nil {
                self.personDeadLabel?.text = constants.formatter.string(from:self.director!.deathDate!)
            }else{
                self.personDeadLabel?.text = ""
            }
            self.personAgeLabel?.text = self.director!.age
            
            self.personImage?.downloadImage(link: self.director!.photo)
            self.personImage?.layer.cornerRadius = 5.0
            self.personFrame?.clipsToBounds = false
            self.personFrame?.layer.shadowColor = UIColor.black.cgColor
            self.personFrame?.layer.shadowOpacity = 1
            self.personFrame?.layer.shadowOffset = CGSize.zero
            self.personFrame?.layer.shadowRadius = 4
            self.personFrame?.layer.shadowPath = UIBezierPath(roundedRect: self.personFrame.bounds, cornerRadius: 4).cgPath
            self.personFrame.layer.cornerRadius = self.personImage.layer.cornerRadius
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actor != nil {
            return actor!.filmography.count
        }
        return director!.filmography.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonDetailCell", for:indexPath) as! PersonDetailTableViewCell
        
        var film: Film?
        if actor != nil {
            film =  actor!.filmography[indexPath.row]
        }else{
            film =  director!.filmography[indexPath.row]
        }
        
        cell.filmNameLabel?.text = film!.name
        cell.filmImage?.downloadImage(link: film!.photo)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if actor != nil {
            self.selectedFilm = actor!.filmography[indexPath.row]
        }else{
            self.selectedFilm = director!.filmography[indexPath.row]
        }
        performSegue(withIdentifier: "film_detail_from_person", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "film_detail_from_person"{
            if let destinationVC = segue.destination as? FilmDetailViewController {
                destinationVC.film = self.selectedFilm
            }
        }
    }
}
