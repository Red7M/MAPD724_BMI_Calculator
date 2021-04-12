//
//  ColorChangeViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//
//  Created by Reda Mehali on 4/11/21.
//

import UIKit

class ColorChangeViewController : UIViewController {
    
    override func viewDidLoad() {}
    
    
    @IBAction func orangeColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.orange)
    }
    
    
    @IBAction func blueColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.blue)
    }
    
    
    @IBAction func greenColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.green)
    }
    
    
    @IBAction func yellowColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.yellow)
    }
    
    
    @IBAction func redColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.red)
    }
    
    @IBAction func indigoColorPressed(_ sender: UIButton) {
        postColorNotification(UIColor.systemIndigo)
    }
    
    private func postColorNotification(_ color: UIColor) {
        NotificationCenter.default.post(name: Notification.Name("colorChangeNotification"), object: nil, userInfo: ["color": color])
    }
    
}
