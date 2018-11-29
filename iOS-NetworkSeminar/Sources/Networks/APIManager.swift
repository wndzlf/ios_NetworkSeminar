//
//  APIManager.swift
//  iOS-NetworkSeminar
//
//  Created by admin on 28/11/2018.
//  Copyright © 2018 sopt. All rights reserved.
//

import Foundation

protocol APIManager {
    
}
extension APIManager {
    static func url(path: String) -> String {
        return "\"http://bghgu.tk:8080" + path
    }
}
