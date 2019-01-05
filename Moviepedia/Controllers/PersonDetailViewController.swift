//
//  PersonDetailViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 05/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController{
    var actor: Actor?
    var director: Director?
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        if actor != nil{
            self.personImage?.image = UIImage(named: actor!.photo)
            self.personNameLabel?.text = actor!.name
        }else{
            self.personImage.image = UIImage(named: director!.photo)
            self.personNameLabel?.text = director!.name
        }
    }
}
