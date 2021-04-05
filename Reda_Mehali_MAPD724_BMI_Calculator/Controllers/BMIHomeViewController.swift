//
//  ViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//  Student ID: 301-159-604
//  Created by Reda Mehali on 3/28/21.
//

import UIKit

class BMIHomeViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    @IBOutlet var calculateBtn: UIButton!
    @IBOutlet var stackviewBottomConstraint: NSLayoutConstraint!
    
    var bmiCalculator = BMICalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(heightWeightChange(_:)), name: Notification.Name("heightWeightNotification"), object: nil)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        bmiCalculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        self.heightLabel.text = heightValue + "m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        self.weightLabel.text = weightValue + "Kg"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! BMIResultViewController
            resultVC.bmiValue = bmiCalculator.getBMIValue()
            resultVC.bmiColor = bmiCalculator.getColor()
            resultVC.advice = bmiCalculator.getAdvice()
        }
    }
    
    @objc func heightWeightChange(_ height: Int) {
        print(height)
    }
}

