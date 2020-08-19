//
//  JRWPBContactFilterTableCell.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 12/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBContactFilterTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var array: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    
    func setupViewModel(typeOfCell: FilterCellType, viewModel: JRWPBFilterVM) {
        if let arr = viewModel.detailedArray[typeOfCell] {
            self.array = arr
        }
    }
}

extension JRWPBContactFilterTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JRWPBFilterCollectionViewContactCell", for: indexPath) as? JRWPBFilterCollectionViewContactCell else {return UICollectionViewCell()}
        cell.setupCell(title: self.array[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 5
        let itemWidth = 375/numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth + 39)
    }
}
