//
//  DirectorsViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class DirectorsViewController: UITableViewController {
    let dataHandler = DataHandler.getShared()
    
}

extension DirectorsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.directors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorCell", for:indexPath)
        
        let director =  dataHandler.directors[indexPath.row]
        cell.textLabel?.text = director.name
        
        if director.age == "1000"{
            cell.detailTextLabel?.text = director.age + "years old" + "(\(director.birthDate) - \(director.deadDate!))"
        }
        cell.detailTextLabel?.text = director.age + " years old " + " (\(director.birthDate) - )"
        return cell
    }
    
}

