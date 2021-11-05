//
//  ImageCache.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation

class ImageCache: NSCache<NSString,NSData> {
    static let shared = ImageCache()
    func setData(_ data: Data, forKey key: String) {
        setObject(NSData(data: data), forKey: NSString(string: key))
    }
    func getData(forKey key: String) -> Data? {
        guard let nsData = object(forKey: NSString(string: key)) else { return nil }
        return Data(referencing: nsData)
    }
}
