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
    
    func isCode(code: String) -> (Void -> Bool) {
        return {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                return false
            }
        }
    }
}

