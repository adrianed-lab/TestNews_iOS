//
//  NewsTitleTableViewCell.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import UIKit

protocol NewsTitleTableViewCellProtocol: AnyObject {
    func configureCell(title: String, date: String)
}

class NewsTitleTableViewCell: UITableViewCell, NewsTitleTableViewCellProtocol {
    static let key = "NewsTitleTableViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override var isSelected: Bool  {
        didSet {
            titleLabel.textColor = isSelected ? .lightGray : .black
        }
    }
    
    func configureCell(title: String, date: String) {
        titleLabel.text = title
        dateLabel.text = date
    }
}
