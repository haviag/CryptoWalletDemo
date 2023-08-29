//
//  CryptoDetailViewModel.swift
//  CryptoWalletDemo
//
//  Created by Raul Mantilla on 28/08/23.
//

import Foundation

class CryptoDetailViewModel {
    let assetID: String
    let assetName: String
    let assetType: String
    let statistics: String
    let currentPrice: String
    init(from model: CryptoModel) {
        self.assetID = model.asset_id
        self.assetName = model.name
        self.assetType = model.type_is_crypto == 1 ? "Criptomoneda" : "Moneda Tradicional"
        self.statistics = """
        Cantidad de símbolos: \(model.data_symbols_count.formatted(.number))
        
        Volumen en la última hora (USD): \(model.volume_1hrs_usd.formatted(.currency(code: "USD")))
        
        Volumen en el último día (USD): \(model.volume_1day_usd.formatted(.currency(code: "USD")))
        
        Volumen en el último mes (USD): \(model.volume_1mth_usd.formatted(.currency(code: "USD")))
        """
        let priceFormatted = String(format: "%.2f", model.price_usd ?? 0)
        self.currentPrice = "Precio en USD: $\(priceFormatted)"
    }
}
