//
//  BoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class BoardVC: UIViewController {
    @IBOutlet var tableVIew: UITableView!
    
    var boardList:[Board] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        BoardService.shared.getBoardList { [weak self] boards in
            //`self`는 self와 같은 이름의 예약어를 사용하게 해줌
            guard let `self` = self else {return}
            self.boardList = boards
            self.tableVIew.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    var boardId: Int?
    var boardTitle: String?
    var boardContents: String?
    var boardDate: Date?
    var userId: Int?
    var boardLike: Int?
    var boardPhoto: String?
    var auth: Bool?
    var like: Bool?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let naviVC = segue.destination as! UINavigationController
            let childVC = naviVC.topViewController as! DetailBoardVC
            childVC.boardList = boardList
        }
    }
}

extension BoardVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let writeBoardVC = self.storyboard?.instantiateViewController(withIdentifier: "WriteBaordVC") as! WriteBoardVC
        
        navigationController?.pushViewController(writeBoardVC, animated: true)
    }
}

extension BoardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVIew.dequeueReusableCell(withIdentifier: "cellId") as! BoardCell
        
        let board = boardList[indexPath.row] as! Board
        
        if let imageURL = board.boardPhoto {
            cell.cellImage.imageFromUrl(imageURL, defaultImgPath: "")
        }
        if let time = board.boardDate {
                cell.dataLabel.text = "\(time)"
        }
        if let like = board.boardLike {
            cell.likeLabel.text = "\(like)"
        }
        if let name = board.userId {
            cell.nameLabel.text = "\(name)"
        }
        
        cell.titleLabel.text = board.boardTitle
        cell.contentsLabel.text = board.boardContents
    
        return cell
    }
}
