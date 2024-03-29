//
//  AuxFunctions.swift
//  Moviepedia
//
//  Created by Juan Julián on 03/01/2019.
//  Copyright © 2019 Juan Julián. All rights reserved.
//

import Foundation
import UIKit

//Extracts data from json and returns an Array containing each element as a Dictionary.
func parseDataFromJSON(resourceName: String, resourceDirectory: String = "Data") -> Array<Dictionary<String, AnyObject>> {
    var info: Array<Dictionary<String, AnyObject>> = []
    
    if let path = Bundle.main.path(forResource: resourceName, ofType: "json", inDirectory: resourceDirectory) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, NSArray>{
                for i in Array(jsonResult)[0].value{
                    if let element = i as? Dictionary<String, AnyObject>{
                        info.append(element)
                    }
                }
                return info
            }
        } catch {
            // handle error
            return info
        }
    }
    return info
}

extension UIImageView {
    func downloadImage(link: String, mode: UIView.ContentMode = .scaleAspectFill){
        contentMode = mode
        guard let url = URL(string: link) else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}

