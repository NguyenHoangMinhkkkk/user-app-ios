//
//  AuthManager.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 08/03/2022.
//

import Foundation

@objc protocol AuthChangeListener: AnyObject {
    func authStateDidChange(isLogged: Bool)
}

class AuthManager {
    private var listeners: [WeakReference<AuthChangeListener>] = []
    
    func addListener(_ listener: AuthChangeListener) {
        if listeners.compactMap({ $0.value }).contains(listener) { return } // or compare an id?
        
        listeners.append(WeakReference(value: listener))
    }
    
    func logIn(username: String, password: String) {
        /*
             call functions to log in the user
         */
        listeners.forEach { $0.value?.authStateDidChange(isLogged: true) }
    }
    
    func logOut() {
        /*
             call functions to log out the user
         */
        listeners.forEach { $0.value?.authStateDidChange(isLogged: false) }
    }
}

class WeakReference<T: AnyObject> {
    weak var value: T?

    init(value: T) {
        self.value = value
    }

    func release() {
        value = nil
    }
}
