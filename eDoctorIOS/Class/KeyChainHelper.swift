
/*
     kSecValueData: A key that represents the data being saved to the keychain.
     kSecClass: A key that represents the type of data being saved. Here we set its value as kSecClassGenericPassword indicating that the data we are saving is a generic password item.
     kSecAttrService and kSecAttrAccount: These 2 keys are mandatory when kSecClass is set to kSecClassGenericPassword. The values for both of these keys will act as the primary key for the data being saved. In other words, we will use them to retrieve the saved data from the keychain later on.
 */

/*

 **READING DATA**
     let data = KeychainHelper.standard.read(service: "access-token", account: "facebook")!
     let accessToken = String(data: data, encoding: .utf8)!
     print(accessToken)

 */

import Foundation

final class KeychainHelper {
    static let standard = KeychainHelper()
    private init() {}

    func save(_ data: Data, service: String, loginMethod: String) {
        // Create query
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: loginMethod,
        ] as CFDictionary

        // Add data in query to keychain
        let status = SecItemAdd(query, nil)

        if status != errSecSuccess {
            // Print out the error
            print("Error: \(status)")
        }

        if status == errSecDuplicateItem {
            // Item already exist, thus update it.
            let query = [
                kSecAttrService: service,
                kSecAttrAccount: loginMethod,
                kSecClass: kSecClassGenericPassword,
            ] as CFDictionary

            let attributesToUpdate = [kSecValueData: data] as CFDictionary

            // Update existing item
            SecItemUpdate(query, attributesToUpdate)
        }
    }

    func read(service: String, loginMethod: String) -> Data? {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: loginMethod,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true,
        ] as CFDictionary

        var result: AnyObject?
        SecItemCopyMatching(query, &result)

        return (result as? Data)
    }

    func delete(service: String, loginMethod: String) {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: loginMethod,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary

        // Delete item from keychain
        SecItemDelete(query)
    }
}
