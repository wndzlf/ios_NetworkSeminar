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
        
        
        UserService.shared.signUp(name: name, email: email, password: password, part: "IOS") {
            print("이게 실행 되어야함")
//            let BoardVC = self.storyboard?.instantiateViewController(withIdentifier: "BoardVC")
//            self.present(BoardVC!, animated: true, completion: nil)
        }
    }
}
