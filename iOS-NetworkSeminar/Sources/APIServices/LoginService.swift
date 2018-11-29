//
//  LoginService.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import Alamofire

struct LoginService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = LoginService()
    let loginURL = url("/login")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //로그인 api
    func login(email: String, password: String, completion: @escaping (Token, Int?) -> Void) {
        let body = [
            "email" : email,
            "password" : password,
        ]
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                if value.status == 200 {
                    print("로그인 성공")
                }else if value.status == 400{
                    print("로그인 실패")
                }else if value.status == 500{
                    print("서버 내부 에러")
                }
                guard let token = value.data else {return}
                completion(token,value.status)
            case .error(let error):
                print(error)
                print("전송 실패")
            }
        }
    }
    
}
