//
//  UserDefaultsUtility.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/2/21.
//

import Foundation

enum UserDefaultsKeys: String, CaseIterable {
    case userIdKey = "userId"
    case userFirstNameKey = "userFirstName"
    case userLastNameKey = "userLastName"
    case userUsernameKey = "userUsername"
    case userEmailKey = "userEmail"
    case userProfilePhotoUrlKey = "userProfilePhotoUrl"
    case userCreatedAtKey = "userCreatedAt"
    case userUpdatedAtKey = "userUpdatedAt"
    case userIsAdminKey = "userIsAdmin"
    case userIsEmailVerifiedKey = "userIsEmailVerified"
}

class UserDefaultsUtility {
    static let defaults = UserDefaults.standard
    
    static var user: User? {
        get {
            guard let id = defaults.value(forKey: UserDefaultsKeys.userIdKey.rawValue) as? String,
                  let firstName = defaults.value(forKey: UserDefaultsKeys.userFirstNameKey.rawValue) as? String,
                  let lastName = defaults.value(forKey: UserDefaultsKeys.userLastNameKey.rawValue) as? String,
                  let username = defaults.value(forKey: UserDefaultsKeys.userUsernameKey.rawValue) as? String,
                  let email = defaults.value(forKey: UserDefaultsKeys.userEmailKey.rawValue) as? String,
                  let profilePhotoUrl = defaults.value(forKey: UserDefaultsKeys.userProfilePhotoUrlKey.rawValue) as? String,
                  let createdAt = defaults.value(forKey: UserDefaultsKeys.userCreatedAtKey.rawValue) as? String,
                  let updatedAt = defaults.value(forKey: UserDefaultsKeys.userUpdatedAtKey.rawValue) as? String,
                  let isAdmin = defaults.value(forKey: UserDefaultsKeys.userIsAdminKey.rawValue) as? Bool,
                  let isEmailVerified = defaults.value(forKey: UserDefaultsKeys.userIsEmailVerifiedKey.rawValue) as? Bool else { return nil }
            return User(id: id,
                        firstName: firstName,
                        lastName: lastName,
                        username: username,
                        email: email,
                        profilePhotoUrl: profilePhotoUrl,
                        createdAt: createdAt,
                        updatedAt: updatedAt,
                        isAdmin: isAdmin,
                        isEmailVerified: isEmailVerified)

        }
        set {
            guard let user = newValue else {
                defaults.removeObject(forKey: UserDefaultsKeys.userIdKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userFirstNameKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userLastNameKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userUsernameKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userEmailKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userProfilePhotoUrlKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userCreatedAtKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userUpdatedAtKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userIsAdminKey.rawValue)
                defaults.removeObject(forKey: UserDefaultsKeys.userIsEmailVerifiedKey.rawValue)
                return
            }
            defaults.set(user.id, forKey: UserDefaultsKeys.userIdKey.rawValue)
            defaults.set(user.firstName, forKey: UserDefaultsKeys.userFirstNameKey.rawValue)
            defaults.set(user.lastName, forKey: UserDefaultsKeys.userLastNameKey.rawValue)
            defaults.set(user.username, forKey: UserDefaultsKeys.userUsernameKey.rawValue)
            defaults.set(user.email, forKey: UserDefaultsKeys.userEmailKey.rawValue)
            defaults.set(user.profilePhotoUrl, forKey: UserDefaultsKeys.userProfilePhotoUrlKey.rawValue)
            defaults.set(user.createdAt, forKey: UserDefaultsKeys.userCreatedAtKey.rawValue)
            defaults.set(user.updatedAt, forKey: UserDefaultsKeys.userUpdatedAtKey.rawValue)
            defaults.set(user.isAdmin, forKey: UserDefaultsKeys.userIsAdminKey.rawValue)
            defaults.set(user.isEmailVerified, forKey: UserDefaultsKeys.userIsEmailVerifiedKey.rawValue)
        }
    }
    
    static func clear() {
        UserDefaultsKeys.allCases.forEach { defaults.removeObject(forKey: $0.rawValue )}
    }
}
