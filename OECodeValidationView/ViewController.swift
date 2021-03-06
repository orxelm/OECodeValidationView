//
//  ViewController.swift
//  OECodeValidationView
//
//  Created by Or Elmaliah on 20.5.2016.
//  Copyright © 2016 Or Elmaliah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var codeValidationView: OECodeValidationView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.codeValidationView.delegate = self
    }
}

extension ViewController: OECodeValidationViewDelegate {
    
    func oeCodeValidationView(oeCodeValidationView: OECodeValidationView, checkForValidCode code: String, withCompletionHandler completionHandler: completionHandlerCodeValidation) {
        completionHandler(success: false)
    }
}

