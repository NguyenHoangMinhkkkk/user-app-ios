//
//  ProfileTabVC.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

class ProfileTabVC: UIViewController, UIScrollViewDelegate {
    var requestData = ApiManager()

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
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
        UserDefaults.standard.set(false, forKey: UserDefaultKey.IsLogged)
        UserDefaults.standard.synchronize()
        print("Log OUT")
    }
}
