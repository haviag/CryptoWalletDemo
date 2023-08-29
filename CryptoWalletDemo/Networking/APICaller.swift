//
//  APICaller.swift
//  CryptoWalletDemo
//
//  Created by Harold Villacob on 28/08/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "E6A8B508-075B-4775-8AAC-3A2B760C6AC7"
        static let assetsEndpoint = "https://rest.coinapi.io/v1/assets"
        static let iconsEndpoint = "https://rest.coinapi.io/v1/assets/icons/32"
        static let metricsEndpoint = "https://rest.coinapi.io/v1/metrics/asset"
    }
    
    private init() {}
    
    public var icons: [IconModel] = []
    
    private var whenReadyBlock: ((Result<[CryptoModel], Error>) -> Void)?
    
    public func getAllCryptoData(completion: @escaping (Result<[CryptoModel], Error>) -> Void) {
        guard !icons.isEmpty else {
            whenReadyBlock = completion
            return
        }
        
        guard let url = URL(string: Constants.assetsEndpoint + "?apiKey=" + Constants.apiKey) else {
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                // Decode response
                let cryptos = try JSONDecoder().decode([CryptoModel].self, from: data)

                completion(.success(cryptos/*.sorted { firts, second -> Bool in
                    return firts.price_usd ?? 0 > second.price_usd ?? 0
                }*/))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    public func getAllIcons() {
        guard let url = URL(string: Constants.iconsEndpoint + "?apiKey=" + Constants.apiKey) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                // Decode response
                self?.icons = try JSONDecoder().decode([IconModel].self, from: data)
                if let completion = self?.whenReadyBlock {
                    self?.getAllCryptoData(completion: completion)
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
