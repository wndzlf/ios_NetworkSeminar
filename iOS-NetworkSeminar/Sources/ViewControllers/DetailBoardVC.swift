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
    
    var board:Board?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userId = board?.userId else {return}
        guard let title = board?.boardTitle else {return}
        guard let contents = board?.boardContents else {return}
        guard let like = board?.boardLike else {return}
        guard let date = board?.boardDate else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd hh:mm"
        let resultDate = dateFormatter.string(from: date)
        
        timeLabel.text = "\(resultDate.description)"
        nameLabel.text = "\(userId)"
        titleLabel.text = title
        contentsText.text = contents
        likeLabel.text = "좋아요 \(like)개"
    }
}
