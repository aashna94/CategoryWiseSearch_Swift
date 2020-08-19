//
//  JRWPBFilterVM.swift
//  PassbookRevamp
//
//  Created by Aashna Narula on 11/02/20.
//  Copyright © 2020 Aashna Narula. All rights reserved.
//

import Foundation

enum FilterCellType {
    case AccountType
    case FrequentContacts
    case TransactionType
    case MerchantCategory
    case Tag
    case FrequentContactsDetailCell
    case TagDetailCell
    case TransactionTypeDetailCell
    case MerchantCategoryDetailCell
    case AccountTypeDetailCell
}

class FilterDetails {
    var title : String = ""
}

class JRWPBFilterVM {
    
    var detailedArray: [FilterCellType: [String]] = [:]
    var array: [FilterCellType] = []
    var accountArray: [String] = ["AccountType", "AccountType", "AccountType","AccountType"]
    var frequentContactsArray: [String] = ["Anish", "Kartik", "Mayank","Anish", "Kartik", "Mayank","Anish", "Kartik", "Mayank"]
    var transactionArray: [String] = ["TransactionType", "TransactionType", "TransactionType"]
    var merchantCategoryArray: [String] = ["MerchantCategory", "Merchant", "MerchantCategory", "MerchantCategory", "Merchant","MerchantCategory", "Merchant", "MerchantCategory", "MerchantCategory", "Merchant","MerchantCategory", "Merchant", "MerchantCategory", "MerchantCategory", "Merchant"]
    var tagArray: [String] = ["Tag", "Tag", "Tag"]
    
    init() {
        self.configureAccountType()
        self.configureFrequentContacts()
        self.configureTransactionType()
        self.configureMerchantCategory()
        self.configureTag()
    }
    
    func configureAccountType() {
        let numberOfAccountType = accountArray.count
        if numberOfAccountType > 0 {
            self.array.append(.AccountType)
            self.array.append(.AccountTypeDetailCell)
            self.detailedArray[.AccountType] = accountArray
        }
    }
    
    func configureFrequentContacts() {
        let numberOfFrequentContacts = frequentContactsArray.count
        if numberOfFrequentContacts > 0 {
            self.array.append(.FrequentContacts)
            self.array.append(.FrequentContactsDetailCell)
            self.detailedArray[.FrequentContacts] = frequentContactsArray
        }
    }
    
    func configureTransactionType() {
        let numberOfTransactionType = transactionArray.count
        if numberOfTransactionType > 0 {
            self.array.append(.TransactionType)
            self.array.append(.TransactionTypeDetailCell)
            self.detailedArray[.TransactionType] = transactionArray
        }
    }
    
    func configureMerchantCategory() {
        let numberOfMerchantCategory = merchantCategoryArray.count
        if numberOfMerchantCategory > 0 {
            self.array.append(.MerchantCategory)
            self.array.append(.MerchantCategoryDetailCell)
            self.detailedArray[.MerchantCategory] = merchantCategoryArray
        }
    }
    
    func configureTag() {
        let numberOfTag = tagArray.count
        if numberOfTag > 0 {
            self.array.append(.Tag)
            self.array.append(.TagDetailCell)
            self.detailedArray[.Tag] = tagArray
        }
    }
}
