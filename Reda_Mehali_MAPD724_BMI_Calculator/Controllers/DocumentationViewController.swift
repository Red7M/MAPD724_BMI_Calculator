//
//  DocumentationViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//
//  Created by Reda Mehali on 4/11/21.
//

import UIKit

class DocumentationViewController : UIViewController {
    
    @IBOutlet weak var documentationLabel: UILabel!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(colorChange(_:)), name: Notification.Name("colorChangeNotification"), object: nil)
    }
    
    @objc func colorChange(_ notification: Notification) {
        documentationLabel.tintColor = (notification.userInfo!["color"]! as! UIColor)
    }
}
