//
//  LoginModal.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 07/03/2022.
//

import UIKit

class LoginVC: UIViewController {
    var performIdentify: String = ""
    var phoneNumber: String = "0375283507"
    var onLoginSuccessed: CGFunction?

    var requestData = ApiManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setDidLogin(_ sender: UIButton) {
        requestData.requestSmsSignIn(phoneNumber) { result in
            switch result {
            case .success:
                DispatchQueue.main.async { self.goVerifyPinNumber() }
            case .failure(let error):
                print("RequestSmsSignIn Error", error.localizedDescription as Any)
            }
        }
    }

    func goVerifyPinNumber() {
        performSegue(withIdentifier: SegueConst.GoToVerifyOtp, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! VerifyOtpVC
        destinationVC.performIdentify = "VerifyOtpVC"
        destinationVC.phoneNumber = phoneNumber
    }
}
