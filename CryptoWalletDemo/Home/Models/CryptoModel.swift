//
//  CryptoModel.swift
//  CryptoWalletDemo
//
//  Created by Harold Villacob on 28/08/23.
//

import Foundation

struct CryptoModel: Codable {
    let asset_id: String
    let name: String
    let type_is_crypto: Int
    let data_symbols_count: Int
    let volume_1hrs_usd: Double
    let volume_1day_usd: Double
    let volume_1mth_usd: Double
    let price_usd: Float?
}
