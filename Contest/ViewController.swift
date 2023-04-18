//
//  ViewController.swift
//  Contest
//
//  Created by Juliana Nielson on 4/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let emailText = emailTextField.text else { return emailTextField.text = "" }
        if emailText.isEmpty {
            UIView.animate(withDuration: 0.1) { [self] in
                let shakeTransform = CGAffineTransform(translationX: 5, y: 0)
                emailTextField.transform = shakeTransform
            } completion: { [self] _ in
                UIView.animate(withDuration: 0.1) { [self] in
                    let backwardsShakeTransform = CGAffineTransform(translationX: -10, y: 0)
                    emailTextField.transform = backwardsShakeTransform
                } completion: { [self] _ in
                    UIView.animate(withDuration: 0.1) { [self] in
                        emailTextField.transform = CGAffineTransform.identity
                    }
                }
            }
        } else {
            performSegue(withIdentifier: "Entered Contest", sender: self)
        }
    }
    //There's gotta be a better way to do this...
}
