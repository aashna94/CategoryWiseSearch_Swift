//
//  JRWPBFilterTableCell.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 11/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBGenericFilterBaseCell: UITableViewCell {
    
}

class JRWPBGenericFilterTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var array: [String] = []
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 5.0
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        self.collectionView.reloadData()
    }
  
    func setupViewModel(typeOfCell: FilterCellType, viewModel: JRWPBFilterVM) {
        if let arr = viewModel.detailedArray[typeOfCell] {
            self.array = arr
        }
    }
    
    func configureCell(bnds: CGRect) {
        if self.collectionView.collectionViewLayout.collectionViewContentSize.height > 150 {
            self.collectionViewHeightConstraint.constant = 150.0
        } else {
            self.frame = bnds
            self.layoutIfNeeded()
            self.collectionView.reloadData()
            self.collectionViewHeightConstraint.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height + 20
        }
    }
}

extension JRWPBGenericFilterTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JRWPBFilterCollectionViewCell", for: indexPath) as? JRWPBFilterCollectionViewCell else {return UICollectionViewCell()}
        cell.setupCell(title: self.array[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let obj = array[indexPath.item]
        let titleWidth = getItemWidth(with: obj)
        return CGSize(width:titleWidth + 20 , height: 36)
    }
    
    private func getItemWidth(with title:String) ->CGFloat {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        lbl.numberOfLines = 1
        lbl.text = title
        lbl.sizeToFit()
        let width = lbl.frame.width
        return width
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
    }
    
}
