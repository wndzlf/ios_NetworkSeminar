//
//  SignupVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sinupAction(_ sender: Any) {
        guard let email = emailText.text else {return}
        guard let password = passwordText.text else {return}
        guard let name = nameText.text else {return}
        let part = "iOS"
        
        
        UserService.shared.signUp(name: name, email: email, password: password, part: part) { (status) in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
