//
//  DirectorsViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class DirectorsTableViewCell: UITableViewCell{
    @IBOutlet weak var directorNameLabel: UILabel!
    @IBOutlet weak var directorAgeLabel: UILabel!
    @IBOutlet weak var directorImage: UIImageView!
}

class DirectorsViewController: UITableViewController {
    let constants = Constants()
    let dataHandler = DataHandler.getShared()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.directors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorCell", for:indexPath)
        
        let director =  dataHandler.directors[indexPath.row]
        cell.textLabel?.text = director.name
        
        if director.deadDate != nil{
            cell.detailTextLabel?.text = director.age + " years old" + " (\(constants.formatter.string(from:director.birthDate)) - \(constants.formatter.string(from: director.deadDate!))"
        }
        cell.detailTextLabel?.text = director.age + " years old " + " (\(constants.formatter.string(from:director.birthDate)) - )"
        return cell
    }
    
}

