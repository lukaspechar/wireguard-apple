//
//  RustBlokkConfig.swift
//  WireGuardKit
//
//  Created by Lukas Pechar on 07/07/2025.
//


public class RustBlokkConfig {
    let blokkDatabasePath: String
    let countryDatabasePath: String
    let cacheLocation: String
    var userBlacklist: [String]? = []
    var userWhitelist: [String]? = []
    var enabledLists: [String]? = []
    let aggressiveMode: Bool
    
    public init(blokkDatabasePath: String, countryDatabasePath: String, cacheLocation: String, aggressiveMode: Bool) {
        self.blokkDatabasePath = blokkDatabasePath
        self.countryDatabasePath = countryDatabasePath
        self.cacheLocation = cacheLocation
        self.aggressiveMode = aggressiveMode
    }
}

