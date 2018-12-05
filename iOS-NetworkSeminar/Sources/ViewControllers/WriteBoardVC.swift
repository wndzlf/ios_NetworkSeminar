//
//  WriteBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class WriteBoardVC: UIViewController {

    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var contentsText: UITextField!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentsText.frame.size.height = 250
    }
    
    @IBAction func finishWrite(_ sender: Any) {
        BoardService.shared.uploadBoard(title: titleText.text ?? "", contents: contentsText.text ?? "", image:img.image! ) { [weak self] in 
            guard let `self` = self else {return}
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
}
