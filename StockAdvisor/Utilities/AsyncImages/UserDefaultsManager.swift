//
//  UserDefaultsManager.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import Foundation

final  class UserDefaultsManager {
    
    private static let symbolKey = "SYMBOL_KEY"
    
    var savedSymbols = [String]()
    
    static let  shared = UserDefaultsManager()
    // what's the deal  with  UserDefaults standard or  shared??
    // we are using UserDefaults.standard but  UserDefaultsManager.shared
    
    init() {
        get()
    }
    
    func get()  {
        if let saved = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String]  {
            savedSymbols = saved
        }
    }
    
    func set(symbol: String) {
        savedSymbols.append(symbol)
        UserDefaults.standard.set(self.savedSymbols, forKey: Self.symbolKey)
    }
}
