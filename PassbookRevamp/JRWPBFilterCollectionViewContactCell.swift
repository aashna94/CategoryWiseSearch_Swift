//
//  JRWPBFilterCollectionViewContactCell.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 12/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBFilterCollectionViewContactCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(title: String) {
        self.title.text = title
    }
    
}
