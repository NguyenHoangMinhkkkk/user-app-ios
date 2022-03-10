//
//  ProfileTabVC.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

class ProfileTabVC: UIViewController, UIScrollViewDelegate {
    var requestData = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConst.ProfileToLogin, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LoginVC
        destinationVC.performIdentify = "ProfileVC"
    }

    @IBAction func setNotLogin(_ sender: UIButton) {
        KeychainHelper.standard.delete(service: KeyChainConst.KeyChainLoginService, loginMethod: KeyChainConst.EdoctorSmsLogin)
        UserDefaults.standard.removeObject(forKey: UserDefaultKey.ConsumerData)
        UserDefaults.standard.set(false, forKey: UserDefaultKey.IsLogged)
        UserDefaults.standard.synchronize()
        print("Log OUT")
    }
}
