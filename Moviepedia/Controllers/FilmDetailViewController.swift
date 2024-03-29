//
//  FilmDetailViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 12/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit
import WebKit

class FilmDetailTableViewCell: UITableViewCell{
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorImageFrame: UIView!
    @IBOutlet weak var directorNameLabel: UILabel!
    @IBOutlet weak var directorImage: UIImageView!
    @IBOutlet weak var directorImageFrame: UIView!
}

class FilmDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let constants = Constants()
    
    var film: Film?
    var selectedDirector: Director?
    var selectedActor: Actor?
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmCountryLabel: UILabel!
    @IBOutlet weak var filmYearLabel: UILabel!
    @IBOutlet weak var filmSynopsisLabel: UILabel!
    @IBOutlet weak var filmFrame: UIView!
    @IBOutlet weak var filmDurationLabel: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var directorsTableView: UITableView!
    @IBOutlet weak var actorsTableView: UITableView!
    @IBOutlet weak var filmTrailer: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        self.actorsTableView.delegate = self
        self.actorsTableView.dataSource = self
        self.directorsTableView.delegate = self
        self.directorsTableView.dataSource = self
        
        self.filmTrailer.configuration.allowsInlineMediaPlayback = true
        let youtubeRequest = URLRequest(url: URL(string: self.film!.trailer)!)
        self.filmTrailer.load(youtubeRequest)
        
        self.filmNameLabel?.text = film!.name
        self.filmYearLabel?.text = self.constants.yearFormatter.string(from: self.film!.year)
        self.filmCountryLabel?.text = self.film!.country
        self.filmDurationLabel?.text = self.film!.time
        self.filmSynopsisLabel?.text = self.film!.synopsis
        
        self.filmImage?.downloadImage(link: film!.photo, mode: .scaleAspectFill)
        self.filmImage?.layer.cornerRadius = 10.0
        self.filmFrame?.clipsToBounds = false
        self.filmFrame?.layer.shadowColor = UIColor.black.cgColor
        self.filmFrame?.layer.shadowOpacity = 1
        self.filmFrame?.layer.shadowOffset = CGSize.zero
        self.filmFrame?.layer.shadowRadius = 4
        self.filmFrame?.layer.shadowPath = UIBezierPath(roundedRect: self.filmFrame.bounds, cornerRadius: 4).cgPath
        self.filmFrame.layer.cornerRadius = self.filmImage.layer.cornerRadius
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.directorsTableView {
            return film!.directors.count
        }else{
            return film!.cast.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.directorsTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorDetailCell", for:indexPath) as! FilmDetailTableViewCell
            let director = self.film!.directors[indexPath.row]
            
            cell.directorNameLabel?.text = director.name
            cell.directorImage?.downloadImage(link: director.photo)
            cell.directorImage?.layer.cornerRadius = 5.0
            
            cell.directorImageFrame.clipsToBounds = false
            cell.directorImageFrame.layer.shadowColor = UIColor.black.cgColor
            cell.directorImageFrame.layer.shadowOpacity = 1
            cell.directorImageFrame.layer.shadowOffset = CGSize.zero
            cell.directorImageFrame.layer.shadowRadius = 5
            cell.directorImageFrame.layer.shadowPath = UIBezierPath(roundedRect: cell.directorImageFrame.bounds, cornerRadius: 5).cgPath
            cell.directorImageFrame.layer.cornerRadius = cell.directorImage.layer.cornerRadius
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorDetailCell", for:indexPath) as! FilmDetailTableViewCell
        let actor = self.film!.cast[indexPath.row]
        
        cell.actorNameLabel?.text = actor.name
        cell.actorImage?.downloadImage(link: actor.photo)
        cell.actorImage?.layer.cornerRadius = 5.0
        
        cell.actorImageFrame.clipsToBounds = false
        cell.actorImageFrame.layer.shadowColor = UIColor.black.cgColor
        cell.actorImageFrame.layer.shadowOpacity = 1
        cell.actorImageFrame.layer.shadowOffset = CGSize.zero
        cell.actorImageFrame.layer.shadowRadius = 5
        cell.actorImageFrame.layer.shadowPath = UIBezierPath(roundedRect: cell.actorImageFrame.bounds, cornerRadius: 5).cgPath
        cell.actorImageFrame.layer.cornerRadius = cell.actorImage.layer.cornerRadius
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == actorsTableView{
            selectedActor = self.film!.cast[indexPath.row]
            performSegue(withIdentifier: "person_detail_from_film_actor", sender: self)
        }else{
            selectedDirector = self.film!.directors[indexPath.row]
            performSegue(withIdentifier: "person_detail_from_film_director", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "person_detail_from_film_director"{
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.director = self.selectedDirector
                destinationVC.actor = nil
            }
        }
        if segue.identifier == "person_detail_from_film_actor"{
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.actor = self.selectedActor
                destinationVC.director = nil
            }
        }
    }
}
