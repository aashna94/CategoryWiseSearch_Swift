//
//  ViewController.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 11/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class JRWPBFilterVC: UIViewController {
    
    class func newInstance()-> JRWPBFilterVC {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "JRWPBFilterVC") as! JRWPBFilterVC
        vc.viewModel = JRWPBFilterVM()
        return vc
    }
    
    var viewModel: JRWPBFilterVM!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = JRWPBFilterVM()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        self.tableView.reloadData()
    }
}

extension JRWPBFilterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.viewModel.array[indexPath.row] {
        case .AccountType:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBFilterHeaderCell") as? JRWPBFilterHeaderCell else {return  UITableViewCell()}
            cell.setupCell(title: "Account Type")
            return cell
        case .FrequentContacts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBFilterHeaderCell") as? JRWPBFilterHeaderCell else {return  UITableViewCell()}
            cell.setupCell(title: "Frequent Contacts")
            return cell
        case .TransactionType:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBFilterHeaderCell") as? JRWPBFilterHeaderCell else {return  UITableViewCell()}
            cell.setupCell(title: "Transaction Type")
            return cell
        case .MerchantCategory:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBFilterHeaderCell") as? JRWPBFilterHeaderCell else {return  UITableViewCell()}
            cell.setupCell(title: "Merchant Category")
            return cell
        case .Tag:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBFilterHeaderCell") as? JRWPBFilterHeaderCell else {return  UITableViewCell()}
            cell.setupCell(title: "Tag")
            return cell
        case .AccountTypeDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBGenericFilterTableCell") as? JRWPBGenericFilterTableCell else {return  UITableViewCell()}
            cell.setupViewModel(typeOfCell: .AccountType, viewModel: self.viewModel)
            let bnds = self.tableView.bounds
            cell.configureCell(bnds: bnds)
            return cell
        case .FrequentContactsDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBContactFilterTableCell") as? JRWPBContactFilterTableCell else {return  UITableViewCell()}
            cell.setupViewModel(typeOfCell: .FrequentContacts, viewModel: self.viewModel)
            return cell
        case .TransactionTypeDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBGenericFilterTableCell") as? JRWPBGenericFilterTableCell else {return  UITableViewCell()}
            cell.setupViewModel(typeOfCell: .TransactionType, viewModel: self.viewModel)
            let bnds = self.tableView.bounds
            cell.configureCell(bnds: bnds)
            return cell
        case .MerchantCategoryDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBGenericFilterTableCell") as? JRWPBGenericFilterTableCell else {return  UITableViewCell()}
            cell.setupViewModel(typeOfCell: .MerchantCategory, viewModel: self.viewModel)
            let bnds = self.tableView.bounds
            cell.configureCell(bnds: bnds)
            return cell
        case .TagDetailCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JRWPBGenericFilterTableCell") as? JRWPBGenericFilterTableCell else {return  UITableViewCell()}
            cell.setupViewModel(typeOfCell: .Tag, viewModel: self.viewModel)
            let bnds = self.tableView.bounds
            cell.configureCell(bnds: bnds)
            return cell
        }
    }
}
