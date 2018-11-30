//
//  DetailBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class DetailBoardVC: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsText: UITextView!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var likeImage: UIImageView!
    
    var boardList: [Board] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

   

}
