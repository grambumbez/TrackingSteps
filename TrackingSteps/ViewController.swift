//
//  ViewController.swift
//  TrackingSteps
//
//  Created by Айдар on 02.07.2020.
//  Copyright © 2020 Айдар. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    var StartStepsGo: Bool =  false
    let StartStepsMonitoring = StartSteps()
    
    
    
    @IBOutlet weak var steps: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func actionButton(_ sender: UIButton) {
        if StartStepsGo {
            button.setTitle("Старт", for: .normal)
            StartStepsMonitoring.stopMonitoring()
        } else {
            button.setTitle("Стоп", for: .normal)
            StartStepsMonitoring.startMonitiring()
        }
        StartStepsGo = !StartStepsGo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartStepsMonitoring.delegate = self
    }


}
extension ViewController: CountingDelegate {
    func countingParametrs(steps: Int) {
        DispatchQueue.main.async {
            self.steps.text = ("Шаги: \(steps)")
        }
    }
    
    
}
