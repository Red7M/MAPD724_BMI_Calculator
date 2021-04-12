//
//  HelpViewController.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//
//  Created by Reda Mehali on 4/11/21.
//
import UIKit

class HelpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func helpDocumentationPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(identifier: "DocumentationViewController") as! DocumentationViewController;
        self.present(vc, animated: true, completion: nil);
    }
    
    @IBAction func colorChangePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(identifier: "ColorChangeViewController") as! ColorChangeViewController;
        self.present(vc, animated: true, completion: nil);
    }
    
    
}
