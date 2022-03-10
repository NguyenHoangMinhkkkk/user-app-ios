//
//  LoginModal.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 07/03/2022.
//

import UIKit

class VerifyOtpVC: UIViewController {
    var performIdentify: String = ""
    var phoneNumber: String = ""
    var pinNumber: Int = 1111

    var requestData = ApiManager()

    @IBOutlet var phoneNumberLabel: UILabel!

    @IBOutlet var tokenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if phoneNumber != "" {
            phoneNumberLabel.text = phoneNumber
        }
    }

    @IBAction func verifyOtpPressed(_ sender: UIButton) {
        requestData.requestSmsVerify(phoneNumber, pinNumber) { result in
            switch result {
            case .success(let data):
                self.saveToken(token: data.token)
                DispatchQueue.main.async { self.tokenLabel.text = data.token }
            case .failure(let error):
                print("RequestSmsSignIn Error", error.localizedDescription as Any)
            }
        }
    }

    func saveToken(token: String) {
        print(token)
        let tokenData = Data(token.utf8)
        KeychainHelper.standard.save(tokenData, service: KeyChainConst.KeyChainLoginService, loginMethod: KeyChainConst.EdoctorSmsLogin)

        UserDefaults.standard.set(true, forKey: UserDefaultKey.IsLogged)
        UserDefaults.standard.synchronize()

        DispatchQueue.main.async {
            // dissmiss all
            NotificationCenter.default.post(name: NSNotification.Name(NotificationCenterKey.LoginSuccess), object: nil)
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}
