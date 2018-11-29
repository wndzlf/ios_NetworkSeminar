//
//  UserService.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import Alamofire

struct UserService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<User>
    static let shared = UserService()
    let userURL = url("/users")
    let userDefaults = UserDefaults.standard
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    var status: Int?
    
    //회원 가입 api
    func signUp(name: String, email: String, password: String, part: String, completion: @escaping () -> Void) {
        //코드작성
        let body = [
            "name" : name,
            "email" : email,
            "password" : password,
            "part" : part
        ]
        postable(userURL, body: body, header: headers) { (res) in
            switch res {
            case .success(let value):
                if value.status == 201 {
                    print("회원가입 성공")
                }else if value.status == 400 {
                    print("회원가입 실패")
                }else if value.status == 600 {
                    print("데이터베이스 에러")
                }else if value.status == 500 {
                    print("서버 내부 에러")
                }
            case .error(let error):
                    print(error)
                    print("전송 실패")
            }
        }
        
    }
    
}
