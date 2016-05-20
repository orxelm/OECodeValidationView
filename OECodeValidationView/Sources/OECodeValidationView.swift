//
//  OECodeValidationView.swift
//  OECodeValidationView
//
//  Created by Or Elmaliah on 20.5.2016.
//  Copyright © 2016 Or Elmaliah. All rights reserved.
//

import UIKit

public protocol OECodeValidationViewDelegate: class {
    
}

@IBDesignable
public class OECodeValidationView: UIView {
    
    private var inputTextFields = [UITextField]()
    private var codeStackView = UIStackView()
    
    private let numberOfFields: Int = 5
    private let textFieldSize: CGFloat = 50
    private let spacing: CGFloat = 8
    
    // MARK: - NSObject
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let width = (CGFloat(self.numberOfFields) * self.textFieldSize) + (CGFloat(self.numberOfFields.predecessor()) * self.spacing)
        assert(width < self.bounds.width, "textfields size is too big")
        
        self.codeStackView.axis = .Horizontal
        self.codeStackView.alignment = .Fill
        self.codeStackView.distribution = .EqualSpacing
        self.codeStackView.spacing = self.spacing
        self.codeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerXConstraint = NSLayoutConstraint(item: self.codeStackView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: self.codeStackView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        
        self.addSubview(self.codeStackView)
        self.addConstraints([centerXConstraint, centerYConstraint])
        
        
        for index in 0..<self.numberOfFields {
            let textField = UITextField()
            textField.borderStyle = .RoundedRect
            textField.textAlignment = .Center
            textField.font = UIFont.systemFontOfSize(20)
            textField.keyboardType = .NumberPad
            textField.delegate = self
            textField.clearsOnInsertion = true
            textField.heightAnchor.constraintEqualToConstant(self.textFieldSize).active = true
            textField.widthAnchor.constraintEqualToConstant(self.textFieldSize).active = true
            
            self.codeStackView.addArrangedSubview(textField)
            self.inputTextFields.append(textField)
            
            if index == 0 {
                textField.becomeFirstResponder()
            }
        }
    }
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: - Add Support
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

extension OECodeValidationView: UITextFieldDelegate {
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.characters.count >= 0 && string.characters.count > 0 {
            textField.text = string
            
            if let index = self.inputTextFields.indexOf(textField) {
                if index < (self.inputTextFields.count.predecessor()) {
                    self.inputTextFields[index.successor()].becomeFirstResponder()
                }
                else {
                    
                }
            }
            
            return false
        }
        else if textField.text?.characters.count >= 1  && string.characters.count == 0 {
            textField.text = nil
            
            if let index = self.inputTextFields.indexOf(textField) where index > 0 {
                self.inputTextFields[index.predecessor()].becomeFirstResponder()
            }
            
            return false
        }
        
        return true
    }
}
