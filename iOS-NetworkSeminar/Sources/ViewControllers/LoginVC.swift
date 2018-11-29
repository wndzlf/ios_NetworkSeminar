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
            if data?.token == nil {
                self.emailText.text = ""
                self.passwordText.text = ""
                if status == 400 {
                    let alterController = UIAlertController(title: "로그인 실패", message: " ", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alterController.addAction(action)
                    self.present(alterController, animated: true, completion: nil)
                }else if status == 500 {
                    let alterController = UIAlertController(title: "로그인 실패", message: "서버 내부 에러", preferredStyle: UIAlertController.Style.alert)
                    let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alterController.addAction(action)
                    self.present(alterController, animated: true, completion: nil)
                }
            }
            
            guard let token = data?.token else {return}
            UserDefaults.standard.set(token, forKey: "token")
            let BoardVC = self.storyboard?.instantiateViewController(withIdentifier: "BoardVC")
            self.present(BoardVC!, animated: true, completion: nil)
        }
    }
}
