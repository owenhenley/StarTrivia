//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, SelectPersonDelegate {
    
    
    @IBOutlet weak var nameLabel       : UILabel!
    @IBOutlet weak var climateLabel    : UILabel!
    @IBOutlet weak var terrainLabel    : UILabel!
    @IBOutlet weak var populationLabel : UILabel!
    @IBOutlet weak var activityMonitor : UIActivityIndicatorView!
    
    var person: Person!
    let api = HomeworldAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityMonitor.startAnimating()
        api.getHomeWorld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                DispatchQueue.main.async {
                    self.setupLabels(homeworld: homeworld)
                    self.activityMonitor.stopAnimating()
                }
            }
        }
    }
    
    func setupLabels(homeworld: Homeworld) {
        nameLabel.text = homeworld.name
        climateLabel.text = homeworld.climate
        terrainLabel.text = homeworld.terrain
        populationLabel.text = homeworld.terrain
    }
}
