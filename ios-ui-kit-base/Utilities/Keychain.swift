//
//  Keychain.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

enum KeychainKeys: String, CaseIterable {
    case tokenKey = "token"
}

class Keychain {
    class var token: String? {
        get {
            guard let value = getString(valueForKey: KeychainKeys.tokenKey.rawValue),
                  value.isEmpty == false else { return nil }
            return value
        }
        set {
            if let value = newValue {
                setString(value: value, forKey: KeychainKeys.tokenKey.rawValue)
            } else {
                setString(value: "", forKey: KeychainKeys.tokenKey.rawValue)
            }
        }
    }
    
    class func setString(value: String, forKey key: String) {
        let data = Data(value.utf8)
        let query = getSetStringQuery(key: key, data: data)
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    class func getString(valueForKey key: String) -> String? {
        let query = getGetStringQuery(key: key)
        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr {
            guard let data = dataTypeRef as? Data else { return nil }
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
    
    class func clear() {
        KeychainKeys.allCases.forEach { setString(value: "", forKey: $0.rawValue) }
    }
    
    private class func getSetStringQuery(key: String, data: Data) -> CFDictionary {
        return [kSecClass as String: kSecClassGenericPassword as String,
                kSecAttrAccount as String: key,
                kSecValueData as String: data] as CFDictionary
    }
    
    private class func getGetStringQuery(key: String) -> CFDictionary {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecReturnData as String: kCFBooleanTrue!,
                kSecMatchLimit as String: kSecMatchLimitOne] as CFDictionary
    }
}
