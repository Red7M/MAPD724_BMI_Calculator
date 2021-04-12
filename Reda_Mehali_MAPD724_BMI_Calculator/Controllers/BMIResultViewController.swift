//
//  BMIResultViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//  Student ID: 301-159-604
//  Created by Reda Mehali on 3/28/21.
//


import UIKit

class BMIResultViewController: UIViewController {

    //@IBOutlets
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    @IBOutlet var bmiChangeVal: UILabel!
    @IBOutlet var reCalculateButton: UIButton!
    @IBOutlet var reCalculateBottomConstraint: NSLayoutConstraint!
    
    // Init user defaults
    let userDefaults = UserDefaults.standard
    
    //Variables
    var bmiValue: String?
    var bmiColor: UIColor?
    var advice: String?
    
    //Views
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        self.view.backgroundColor = bmiColor
        self.adviceLabel.text = advice?.uppercased()
        
        self.bmiLabel.textColor = .white
        self.adviceLabel.textColor = .white
        
        self.compareBMIs(recentBmi: bmiValue!, previousBmi: getBmiIfAny())
        self.storeBMI(bmiVal: bmiValue!)
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("heightWeightNotification"), object: nil, userInfo: ["bmiValue": bmiValue!])
        
        self.dismiss(animated: true, completion: nil)
    }
    
    private func compareBMIs(recentBmi: String, previousBmi: String) {
        let recent = Double(recentBmi)!
        let previous = Double(previousBmi)!
        
        if (previous == 0) {
            // this is your first bmi entry
            bmiChangeVal.text = "_"
            return;
        }
        
        let difference = (previous - recent)
        if (difference > 0) {
            // You lost
            bmiChangeVal.text = "You lost \(abs(difference)) kg/m²";
        } else if (difference < 0) {
            // You gained
            bmiChangeVal.text = "You gained \(abs(difference)) kg/m²";
        } else {
            // you maintained
            bmiChangeVal.text = "There was no change in your bmi"
        }
    }
    
    private func getBmiIfAny() -> String {
        let bmiStr = userDefaults.value(forKey: "bmiKey")
        return (bmiStr == nil) ? "0" : bmiStr as! String
    }
    
    private func storeBMI(bmiVal: String) {
        userDefaults.setValue(bmiVal, forKey: "bmiKey")
    }
}

