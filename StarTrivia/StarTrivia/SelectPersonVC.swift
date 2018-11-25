//
//  SelectPersonVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/23/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

protocol SelectPersonDelegate {
    var person: Person! { get set }
}

class SelectPersonVC: UIViewController {
    
        // MARK: - Outlets
    @IBOutlet weak var nameLabel       : UILabel!
    @IBOutlet weak var heightLabel     : UILabel!
    @IBOutlet weak var massLabel       : UILabel!
    @IBOutlet weak var hairLabel       : UILabel!
    @IBOutlet weak var birthYearLabel  : UILabel!
    @IBOutlet weak var genderLabel     : UILabel!
    @IBOutlet weak var homeworldButton : UIButton!
    @IBOutlet weak var vehichlesButton : UIButton!
    @IBOutlet weak var starshipsButton : UIButton!
    @IBOutlet weak var filmsButton     : UIButton!
    @IBOutlet weak var activityMonitor : UIActivityIndicatorView!
    
        // MARK: - Propeerties
    
    let personAPI = PersonAPI()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        // MARK: - Actions
    
    @IBAction func randomTapped(_ sender: Any) {
        
        activityMonitor.startAnimating()
        let random = Int.random(in: 1...87)
        
        personAPI.getRandomPersonAlamofire(id: random) { (person) in
                if let person = person {
                    self.setupViews(person: person)
                    self.person = person
                    self.activityMonitor.stopAnimating()
            }
        }
    }
    
    
    func setupViews(person: Person) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        massLabel.text = person.mass
        hairLabel.text = person.hair
        birthYearLabel.text = person.birthYear
        genderLabel.text = person.gender
        
        // Set button state
        homeworldButton.isEnabled = !person.homeworldUrl.isEmpty
        vehichlesButton.isEnabled = !person.vehicleUrls.isEmpty
        starshipsButton.isEnabled = !person.starshipUrls.isEmpty
        filmsButton.isEnabled = !person.filmUrls.isEmpty
    }
    
        // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination = segue.destination as? SelectPersonDelegate {
            destination.person = person
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        // enum Segue : String {
        //     case homeworld = "homeworld"
        //     case vehicles  = "vehicles"
        //     case starships = "starships"
        //     case films     = "films"
        // }
        //
        // switch segue.identifier {
        // case Segue.homeworld.rawValue:
        //     if let destinationVC = segue.destination as? HomeworldVC {
        //         destinationVC.person = person
        //     }
        // case Segue.vehicles.rawValue:
        //     if let desinationVC = segue.destination as? VehiclesVC {
        //         desinationVC.person = person
        //     }
        // case Segue.starships.rawValue:
        //     if let desinationVC = segue.destination as? StarshipsVC {
        //         desinationVC.person = person
        //     }
        // case Segue.films.rawValue:
        //     if let desinationVC = segue.destination as? FilmsVC {
        //         desinationVC.person = person
        //     }
        // default:
        //     break
        // }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        // if segue.identifier == "homeworld" {
        //     if let destinationVC = segue.destination as? HomeworldVC {
        //         destinationVC.person = person
        //     }
        // } else if segue.identifier == "vehicles" {
        //     if let desinationVC = segue.destination as? VehiclesVC {
        //         desinationVC.person = person
        //     }
        // } else if segue.identifier == "starships" {
        //     if let desinationVC = segue.destination as? StarshipsVC {
        //         desinationVC.person = person
        //     }
        // } else if segue.identifier == "films" {
        //     if let desinationVC = segue.destination as? FilmsVC {
        //         desinationVC.person = person
        //     }
        // }
    }
}
