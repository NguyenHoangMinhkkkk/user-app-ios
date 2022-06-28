//
//  ProfileTabVC.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

extension ProfileTabVC: BasicProfileDelegate {
    func performSegueFromBasicProfile() {
        performSegue(withIdentifier: SegueConst.GoToProfileDetail, sender: self)
    }
}

class ProfileTabVC: UIViewController {
    var requestData = ApiManager()

    @IBOutlet var basicProfile: BasicProfile!

    override func viewDidLoad() {
        super.viewDidLoad()
        basicProfile.delegate = self
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConst.ProfileToLogin, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? LoginVC {
            destinationVC.performIdentify = "ProfileVC"
        }
        if let destinationVC = segue.destination as? ProfileDetailVC {
            destinationVC.performIdentify = "ProfileDetailVC"
        }
    }

    @IBAction func setNotLogin(_ sender: UIButton) {
        KeychainHelper.standard.delete(service: KeyChainConst.KeyChainLoginService, loginMethod: KeyChainConst.EdoctorSmsLogin)
        UserDefaults.standard.removeObject(forKey: UserDefaultKey.ConsumerData)
        UserDefaults.standard.set(false, forKey: UserDefaultKey.IsLogged)
        UserDefaults.standard.synchronize()
        print("Log OUT")
    }
}
