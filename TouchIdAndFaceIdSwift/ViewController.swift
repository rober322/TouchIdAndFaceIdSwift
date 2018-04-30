//
//  ViewController.swift
//  TouchIdAndFaceIdSwift
//
//  Created by Rober Martinez on 30/04/18.
//  Copyright © 2018 Rober Martinez. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            let biometryType: String
            
            switch context.biometryType {
            case .none:
                biometryType = "autenticador biometrico"
            case .touchID:
                biometryType = "Touch ID"
            case .faceID:
                biometryType = "Face ID"
            }
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Queremos logiarnos con tu \(biometryType)", reply: { (isCorrect, error) in
                
                if isCorrect {
                    print("Es correcto")
                } else {
                    print("No es correcto")
                }
            })
        } else {
            let refreshAlert = UIAlertController(title: "Información", message: "Su dispositivo no cuenta con un autenticador touchId ni faceId", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            }))
            
            present(refreshAlert, animated: true, completion: nil)
        }
    }
    
}

