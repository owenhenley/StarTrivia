//
//  SelectPersonVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/23/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
        // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
        // MARK: - Propeerties
    
    let personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomTapped(_ sender: Any) {
        
        let random = Int.random(in: 1...87)
        
        personAPI.getRandomPersonAlamofire(id: random) { (person) in
                if let person = person {
                    self.nameLabel.text = person.name
                    self.heightLabel.text = person.height
                    self.massLabel?.text = person.mass
                    self.hairLabel.text = person.hair
                    self.birthYearLabel.text = person.birthYear
                    self.genderLabel.text = person.gender
            }
        }
    }
}
