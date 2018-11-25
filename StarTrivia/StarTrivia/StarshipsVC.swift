//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, SelectPersonDelegate {
    
    @IBOutlet weak var nameLabel         : UILabel!
    @IBOutlet weak var modelLabel        : UILabel!
    @IBOutlet weak var manufacturerLabel : UILabel!
    @IBOutlet weak var costLabel         : UILabel!
    @IBOutlet weak var lengthLabel       : UILabel!
    @IBOutlet weak var speedLabel        : UILabel!
    @IBOutlet weak var crewLabel         : UILabel!
    @IBOutlet weak var passengersLabel   : UILabel!
    @IBOutlet weak var previousButton    : FadeButton!
    @IBOutlet weak var nextButton        : FadeButton!
    @IBOutlet weak var activityMonitor   : UIActivityIndicatorView!
    
    var person: Person!
    let api = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        previousButton.isEnabled = false
        nextButton.isEnabled = starships.count > 1
        
        guard let starship = starships.first else { return }
        getStarship(url: starship)
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func getStarship(url: String) {
        activityMonitor.startAnimating()
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                DispatchQueue.main.async {
                    self.setupLabels(starship: starship)
                    self.activityMonitor.stopAnimating()
                }
            }
        }
    }
    
    func setButtonState() {
        previousButton.isEnabled = currentStarship == 0 ? false : true
        nextButton.isEnabled = currentStarship == starships.count - 1 ? false : true
        
        getStarship(url: starships[currentStarship])
    }
    
    func setupLabels(starship: Starship) {
        nameLabel.text         = starship.name
        modelLabel.text        = starship.model
        manufacturerLabel.text = starship.manufacturer
        costLabel.text         = starship.cost
        lengthLabel.text       = starship.length
        speedLabel.text        = starship.speed
        crewLabel.text         = starship.crew
        passengersLabel.text   = starship.passengers
    }
}
