//
//  JRWPBFilterCollectionViewCell.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 11/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func setupCell(title: String) {
        self.cellTitle.text = title
    }
}
