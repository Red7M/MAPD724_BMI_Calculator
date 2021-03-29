//
//  RoundButton.swift
//  Reda_Mehali_MAPD724_BMI_Calculator
//  Student ID: 301-159-604
//  Created by Reda Mehali on 3/28/21.
//

import UIKit

@IBDesignable
open class RoundButton: UIButton {
 
    // define some functions
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
}
