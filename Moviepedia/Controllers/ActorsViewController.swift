//
//  ActorsViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class ActorsViewController: UITableViewController {
    let dataHandler = DataHandler.getShared()
    
}

extension ActorsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.actors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for:indexPath)
        
        let actor =  dataHandler.actors[indexPath.row]
        cell.textLabel?.text = actor.name
        
        if actor.age == "1000"{
            cell.detailTextLabel?.text = actor.age + "years old" + "(\(actor.birthDate) - \(actor.deadDate!))"
        }
        cell.detailTextLabel?.text = actor.age + "years old" + "(\(actor.birthDate) - )"
        return cell
    }
    
}
