//
//  ActorsViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class ActorsTableViewCell: UITableViewCell{
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorImageFrame: UIView!
}

class ActorsViewController: UITableViewController {
    let constants = Constants()
    let dataHandler = DataHandler.getShared()
    var actorsToHandle = Array<Actor>()
    var selectedActor: Actor?
    
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        actorsToHandle = dataHandler.actors
    }
    
    
    @IBAction func sortAction(_ sender: Any) {
        switch self.sortSegmentedControl.selectedSegmentIndex {
        //sort by name
        case 0:
            actorsToHandle.sort {$0.name < $1.name}
            self.tableView.reloadData()
        //sort by birth date
        case 1:
            actorsToHandle.sort {$0.birthDate < $1.birthDate}
            self.tableView.reloadData()
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsToHandle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for:indexPath) as! ActorsTableViewCell
        let actor =  actorsToHandle[indexPath.row]
        
        cell.actorNameLabel?.text = actor.name
        cell.actorImage?.image = UIImage(named: actor.photo)
        cell.actorImage?.layer.cornerRadius = 10.0
        
        cell.actorImageFrame.clipsToBounds = false
        cell.actorImageFrame.layer.shadowColor = UIColor.black.cgColor
        cell.actorImageFrame.layer.shadowOpacity = 1
        cell.actorImageFrame.layer.shadowOffset = CGSize.zero
        cell.actorImageFrame.layer.shadowRadius = 5
        cell.actorImageFrame.layer.shadowPath = UIBezierPath(roundedRect: cell.actorImageFrame.bounds, cornerRadius: 5).cgPath
        cell.actorImageFrame.layer.cornerRadius = cell.actorImage.layer.cornerRadius
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedActor = actorsToHandle[indexPath.row]
        performSegue(withIdentifier: "actor_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "actor_detail" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.actor = self.selectedActor
                destinationVC.director = nil
            }
        }
    }
}
