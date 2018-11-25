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
    @IBOutlet weak var activityMonitor   : UIActivityIndicatorView!
    
    var person: Person!
    let api = VehicleAPI()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        previousButton.isEnabled = false
        nextButton.isEnabled = vehicles.count > 1
        
        guard let vehicle = vehicles.first else { return }
        getVehicle(url: vehicle)
    }
    
        // MARK: - Actions
    
    @IBAction func previousTapped(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }

    func getVehicle(url: String) {
        activityMonitor.startAnimating()
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                DispatchQueue.main.async {
                    self.setupLabels(vehicle: vehicle)
                    self.activityMonitor.stopAnimating()
                }
            }
        }
    }
    
    func setButtonState() {
        
        previousButton.isEnabled = currentVehicle == 0 ? false : true
        nextButton.isEnabled = currentVehicle == vehicles.count - 1 ? false : true

        getVehicle(url: vehicles[currentVehicle])
        
   //---------------------------------------------------------------------------------------------------------//
        
        // if currentVehicle == 0 {
        //     previousButton.isEnabled = false
        // } else {
        //     previousButton.isEnabled = true
        // }
        //
        // if currentVehicle == vehicles.count - 1 {
        //     nextButton.isEnabled = false
        // } else {
        //     nextButton.isEnabled = true
        // }
    }
    
    func setupLabels(vehicle: Vehicle) {
        nameLabel.text         = vehicle.name
        modelLabel.text        = vehicle.model
        manufacturerLabel.text = vehicle.manufacturer
        costLabel.text         = vehicle.cost
        lengthLabel.text       = vehicle.length
        speedLabel.text        = vehicle.speed
        crewLabel.text         = vehicle.crew
        passengerLabel.text    = vehicle.passengers
    }
}
