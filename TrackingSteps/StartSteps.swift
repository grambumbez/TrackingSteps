//
//  StartSteps.swift
//  TrackingSteps
//
//  Created by Айдар on 03.07.2020.
//  Copyright © 2020 Айдар. All rights reserved.
//

import Foundation
import CoreMotion

protocol CountingDelegate {
    func countingParametrs(steps: Int)
}

class StartSteps {
    
    var pedometer = CMPedometer()
    var startDate: Date? = nil
    var numberOfSteps: Int! = 0
    
    var delegate: CountingDelegate?
    
    func startMonitiring() {
        startDate = Date()
        pedometer.startUpdates(from: Date()) { (pedometerDate, error) in
            if let pedometerDate = pedometerDate {
                self.setPedometerDate(pedDate: pedometerDate)
                self.delegate?.countingParametrs(steps: self.numberOfSteps)
            }
        }
    }
    func setPedometerDate(pedDate: CMPedometerData) {
        self.numberOfSteps = Int(truncating: pedDate.numberOfSteps)
    }
    
    func stopMonitoring() {
        startDate = nil
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }
}
