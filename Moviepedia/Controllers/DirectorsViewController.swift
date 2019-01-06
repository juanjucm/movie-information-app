//
//  DirectorsViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class DirectorsTableViewCell: UITableViewCell{
    @IBOutlet weak var directorImage: UIImageView!
    @IBOutlet weak var directorNameLabel: UILabel!
    @IBOutlet weak var directorImageFrame: UIView!
}

class DirectorsViewController: UITableViewController {
    let constants = Constants()
    let dataHandler = DataHandler.getShared()
    var selectedDirector: Director?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHandler.directors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorCell", for:indexPath) as! DirectorsTableViewCell
        let director =  dataHandler.directors[indexPath.row]
        
        cell.directorNameLabel?.text = director.name
        cell.directorImage?.image = UIImage(named: director.photo)
        cell.directorImage?.layer.cornerRadius = 10.0
        
        cell.directorImageFrame.clipsToBounds = false
        cell.directorImageFrame.layer.shadowColor = UIColor.black.cgColor
        cell.directorImageFrame.layer.shadowOpacity = 1
        cell.directorImageFrame.layer.shadowOffset = CGSize.zero
        cell.directorImageFrame.layer.shadowRadius = 5
        cell.directorImageFrame.layer.shadowPath = UIBezierPath(roundedRect: cell.directorImageFrame.bounds, cornerRadius: 5).cgPath
        cell.directorImageFrame.layer.cornerRadius = cell.directorImage.layer.cornerRadius
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDirector = dataHandler.directors[indexPath.row]
        performSegue(withIdentifier: "director_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "director_detail" {
            if let destinationVC = segue.destination as? PersonDetailViewController {
                destinationVC.director = self.selectedDirector
                destinationVC.actor = nil
            }
        }
    }
    
}

