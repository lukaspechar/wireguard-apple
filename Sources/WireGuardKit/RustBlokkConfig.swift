//
//  RustBlokkConfig.swift
//  WireGuardKit
//
//  Created by Lukas Pechar on 07/07/2025.
//
import Foundation

public class RustBlokkConfig: NSObject {
    let blokkDatabasePath: String
    let countryDatabasePath: String
    let cacheLocation: String
    @objc public var userBlacklist: [String]? = []
    @objc public var userWhitelist: [String]? = []
    @objc public var enabledLists: [String]? = []
    let aggressiveMode: Bool
    
    let blockUTF8: Bool
    let blockIPs: Bool
    
    public init(blokkDatabasePath: String, countryDatabasePath: String, cacheLocation: String, aggressiveMode: Bool, blockUTF8: Bool, blockIPs: Bool) {
        self.blokkDatabasePath = blokkDatabasePath
        self.countryDatabasePath = countryDatabasePath
        self.cacheLocation = cacheLocation
        self.aggressiveMode = aggressiveMode
        self.blockIPs = blockIPs
        self.blockUTF8 = blockUTF8
    }
            
}

