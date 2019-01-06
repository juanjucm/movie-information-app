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
    var selectedActor: Actor?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.actors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for:indexPath) as! ActorsTableViewCell
        let actor =  dataHandler.actors[indexPath.row]
        
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
        
        /*if actor.deadDate != nil{
            cell.actorAgeLabel?.text = actor.age + " years old" + " (\(constants.formatter.string(from: actor.birthDate)) - \(constants.formatter.string(from:actor.deadDate!)))"
        }
        cell.actorAgeLabel?.text = actor.age + " years old" + " (\(constants.formatter.string(from: actor.birthDate)) - )"*/
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedActor = dataHandler.actors[indexPath.row]
        performSegue(withIdentifier: "actor_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "actor_detail" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.actor = selectedActor
                destinationVC.director = nil
            }
        }
    }
}
