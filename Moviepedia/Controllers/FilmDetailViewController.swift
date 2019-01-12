//
//  FilmDetailViewController.swift
//  Moviepedia
//
//  Created by Juan Julián on 12/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import UIKit


class FilmDetailTableViewCell: UITableViewCell{
    
}

class FilmDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
     @IBOutlet weak var filmNameLabel: UILabel!
     @IBOutlet weak var filmCountryLabel: UILabel!
     @IBOutlet weak var filmYearLabel: UILabel!
     @IBOutlet weak var filmSynopsisLabel: UILabel!
     @IBOutlet weak var filmFrame: UIView!
     @IBOutlet weak var filmImage: UIImageView!
     @IBOutlet weak var directorsTableView: UITableView!
     @IBOutlet weak var actorsTableView: UITableView!
 
    let constants = Constants()
    
    var film: Film?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.directorsTableView {
            return film!.directors.count
        }
         return film!.cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmDetailCell", for:indexPath) as! FilmDetailTableViewCell
        
        return cell
    }
}
