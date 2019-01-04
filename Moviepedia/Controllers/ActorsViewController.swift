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
    @IBOutlet weak var actorAgeLabel: UILabel!
    @IBOutlet weak var actorNameLabel: UILabel!
}

class ActorsViewController: UITableViewController {
    let constants = Constants()
    let dataHandler = DataHandler.getShared()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.actors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for:indexPath) as! ActorsTableViewCell
        let actor =  dataHandler.actors[indexPath.row]
        
        cell.actorNameLabel?.text = actor.name
        cell.actorImage?.image = UIImage(named: actor.photo)
        
        if actor.deadDate != nil{
            cell.actorAgeLabel?.text = actor.age + " years old" + " (\(constants.formatter.string(from: actor.birthDate)) - \(constants.formatter.string(from:actor.deadDate!)))"
        }
        cell.actorAgeLabel?.text = actor.age + " years old" + " (\(constants.formatter.string(from: actor.birthDate)) - )"
        return cell
    }
}
