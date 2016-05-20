//
//  OECodeValidationView.swift
//  OECodeValidationView
//
//  Created by Or Elmaliah on 20.5.2016.
//  Copyright © 2016 Or Elmaliah. All rights reserved.
//

import UIKit

@IBDesignable
class OECodeValidationView: UIView {
    
    private var inputTextFields = [UITextField]()
    private var codeStackView = UIStackView()
    
    private let numberOfFields = 5
    
    // MARK: - NSObject
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<self.numberOfFields {
            let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            textField.font = UIFont.systemFontOfSize(16)
            self.codeStackView.addArrangedSubview(textField)
            self.inputTextFields.append(textField)
        }
        
        self.codeStackView.axis = .Horizontal
        self.codeStackView.alignment = .Fill
        self.codeStackView.distribution = .EqualSpacing
        self.codeStackView.spacing = 8
        
        
        let constraint1 = NSLayoutConstraint(item: self.codeStackView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: 0)
        
        let constraint2 = NSLayoutConstraint(item: self.codeStackView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: 0)
        
        self.addSubview(self.codeStackView)
        self.addConstraints([constraint1, constraint2])
        
        
    }
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Animation
    
    private func startJiggleAnimation() {
        let jiggle = CABasicAnimation(keyPath: "position")
        jiggle.duration = 0.05
        jiggle.repeatCount = 3
        jiggle.autoreverses = true
        jiggle.fromValue = NSValue(CGPoint: CGPoint(x: self.codeStackView.center.x - 5, y: self.codeStackView.center.y))
        jiggle.toValue = NSValue(CGPoint: CGPoint(x: self.codeStackView.center.x + 5, y: self.codeStackView.center.y))
        jiggle.removedOnCompletion = true
        self.codeStackView.layer.addAnimation(jiggle, forKey: "position")
    }
}
