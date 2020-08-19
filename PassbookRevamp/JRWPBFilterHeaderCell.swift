//
//  JRWPBFilterHeaderCell.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 11/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBFilterHeaderCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupCell(title: String) {
        self.title.text = title
    }
}
