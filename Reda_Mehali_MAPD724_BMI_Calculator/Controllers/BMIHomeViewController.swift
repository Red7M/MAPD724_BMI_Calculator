//
//  ViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//  Student ID: 301-159-604
//  Created by Reda Mehali on 3/28/21.
//

import UIKit
import WebKit

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
    
    @objc func heightWeightChange(_ notification: Notification) {
        let bmiValue = Double(notification.userInfo!["bmiValue"]! as! String)!
        print(bmiValue)
        if (bmiValue < 18.5) {
            self.showToast(message: "You need to eat more pancakes", font: .systemFont(ofSize: 12.0))
        } else if (bmiValue > 24.9) {
            self.showToast(message: "You need to eat less pancakes", font: .systemFont(ofSize: 12.0))
        } else {
            self.showToast(message: "You are in a good shape", font: .systemFont(ofSize: 12.0))
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

