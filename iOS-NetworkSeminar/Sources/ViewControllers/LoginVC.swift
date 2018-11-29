//
//  LoginVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailText.text else {return}
        guard let password = passwordText.text else {return}
        
        LoginService.shared.login(email: email, password: password) { (data,status) in
            
            guard let stat = status else {return }
            if stat == 200 {
                guard let token = data.token else {return}
                UserDefaults.standard.set(token, forKey: "token")
                let BoardVC = self.storyboard?.instantiateViewController(withIdentifier: "BoardVC")
                self.present(BoardVC!, animated: true, completion: nil)
            }else {
                let alterController = UIAlertController(title: "로그인 실패", message: " ", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alterController.addAction(action)
                self.present(alterController, animated: true, completion: nil)
            }
        }
    }
}
