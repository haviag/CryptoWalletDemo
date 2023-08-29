//
//  CryptoTableViewCellViewModel.swift
//  CryptoWalletDemo
//
//  Created by Raul Mantilla on 28/08/23.
//

import Foundation

class CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let iconUrl: URL?
    var iconData: Data?
    
    init(name: String, symbol: String, price: String, iconUrl: URL?, iconData: Data? = nil) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconUrl = iconUrl
        self.iconData = iconData
    }
}
