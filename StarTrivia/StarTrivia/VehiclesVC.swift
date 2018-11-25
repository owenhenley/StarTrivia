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
    let api = VehicleAPI()
    var vehicles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
        // MARK: - Actions
    
    @IBAction func previousTapped(_ sender: Any) {
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
    }

    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                DispatchQueue.main.async {
                    self.setupLabels(vehicle: vehicle)
                }
            }
        }
    }
    
    func setupLabels(vehicle: Vehicle) {
        nameLabel.text = vehicle.name
        modelLabel.text = vehicle.model
        manufacturerLabel.text = vehicle.manufacturer
        costLabel.text = vehicle.cost
        lengthLabel.text = vehicle.length
        speedLabel.text = vehicle.speed
        crewLabel.text = vehicle.crew
        passengerLabel.text = vehicle.passengers
    }
}
