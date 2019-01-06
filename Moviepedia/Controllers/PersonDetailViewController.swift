//
//  PersonDetailViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 05/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController{
    let constants = Constants()
    
    var actor: Actor?
    var director: Director?
    @IBOutlet weak var personDeadLabel: UILabel!
    @IBOutlet weak var personAgeLabel: UILabel!
    @IBOutlet weak var personBirthLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personBiographyLabel: UILabel!
    @IBOutlet weak var personFrame: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
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
            
            self.personImage?.image = UIImage(named: actor!.photo)
            self.personImage?.layer.cornerRadius = 10.0
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
            
            self.personImage?.image = UIImage(named: director!.photo)
            self.personImage?.layer.cornerRadius = 10.0
            self.personFrame?.clipsToBounds = false
            self.personFrame?.layer.shadowColor = UIColor.black.cgColor
            self.personFrame?.layer.shadowOpacity = 1
            self.personFrame?.layer.shadowOffset = CGSize.zero
            self.personFrame?.layer.shadowRadius = 4
            self.personFrame?.layer.shadowPath = UIBezierPath(roundedRect: self.personFrame.bounds, cornerRadius: 4).cgPath
            self.personFrame.layer.cornerRadius = self.personImage.layer.cornerRadius
        }
    }
}
