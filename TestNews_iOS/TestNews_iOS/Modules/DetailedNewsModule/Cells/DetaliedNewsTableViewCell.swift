//
//  DetaliedNewsTableViewCell.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import UIKit

protocol DetaliedNewsTableViewCellProtocol {
   func configureCell(content: String)
}

class DetaliedNewsTableViewCell: UITableViewCell, DetaliedNewsTableViewCellProtocol {
    static let key = "DetaliedNewsTableViewCell"
    @IBOutlet weak var contentNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(content: String) {
        contentNews.text = content
    }
}
