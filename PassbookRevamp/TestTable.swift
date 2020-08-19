//
//  TestTable.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 12/03/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import UIKit

class TestTable: UIViewController {

    @IBOutlet var viewHt: NSLayoutConstraint!
    @IBOutlet var tblHt: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    var array: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.array = ["aashna","a","a","aashna","a","a","aashna","a"]
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        self.tableView.reloadData()
    }
    
    private func handleTableViewHeight() {
        let height = view.frame.height * 0.8
        let contentSize = tableView.contentSize.height + viewHt.constant
        
        if contentSize > height{
            tblHt.constant = height
        }else{
            tblHt.constant = tableView.contentSize.height
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTableView()
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
        self.handleTableViewHeight()
    }
}

extension TestTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableCell") as? TestTableCell else {return  UITableViewCell()}
            cell.setCell(n: self.array[indexPath.row])
            return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
}

class TestTableCell: UITableViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    
    func setCell(n: String) {
        self.cellTitle.text = n
    }
}

