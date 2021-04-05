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
    @IBOutlet var reCalculateButton: UIButton!
    @IBOutlet var reCalculateBottomConstraint: NSLayoutConstraint!
    
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
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("heightWeightNotification"), object: nil, userInfo: ["bmiValue": bmiValue!])
        
        self.dismiss(animated: true, completion: nil)
    }
}

