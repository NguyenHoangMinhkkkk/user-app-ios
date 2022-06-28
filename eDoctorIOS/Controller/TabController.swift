//
//  ViewController.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

class TabController: UITabBarController {
    let requestData = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginStateChanged),
                                               name: NSNotification.Name(rawValue: NotificationCenterKey.LoginSuccess),
                                               object: nil)

        let isLogged = UserDefaults.standard.bool(forKey: UserDefaultKey.IsLogged)

        if isLogged {
            print("Already Logged -> get summary")
            handleRequestAccountSummary()
        }
    }

    @objc func loginStateChanged(notification: NSNotification) {
        print("LoginStateChanged Logged -> get summary")
        handleRequestAccountSummary()
    }

    @objc func handleRequestAccountSummary() {
        requestData.requestAccountSummary { result in
            switch result {
            case .success(let consumerData):
                self.saveData(consumerData)
            case .failure(let error): print("Error -- requestAccountSummary", error.localizedDescription)
            }
        }
    }

    func saveData(_ consumerData: Consumer) {
        do {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(consumerData)
            UserDefaults.standard.set(encodedData, forKey: UserDefaultKey.ConsumerData)
            UserDefaults.standard.synchronize()
        } catch {
            print("NSKeyedArchiver.archivedData Failed", error)
        }
    }
}
