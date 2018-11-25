//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, SelectPersonDelegate {
    
        // MARK: - Outlets
    
    @IBOutlet weak var nameLabel         : UILabel!
    @IBOutlet weak var modelLabel        : UILabel!
    @IBOutlet weak var manufacturerLabel : UILabel!
    @IBOutlet weak var costLabel         : UILabel!
    @IBOutlet weak var lengthLabel       : UILabel!
    @IBOutlet weak var speedLabel        : UILabel!
    @IBOutlet weak var crewLabel         : UILabel!
    @IBOutlet weak var passengerLabel    : UILabel!
    @IBOutlet weak var previousButton    : UIButton!
    @IBOutlet weak var nextButton        : UIButton!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        // MARK: - Actions
    
    @IBAction func previousTapped(_ sender: Any) {
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
    }

}
