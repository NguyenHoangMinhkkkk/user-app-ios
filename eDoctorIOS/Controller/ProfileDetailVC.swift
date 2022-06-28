//
//  ProfileDetailVCViewController.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 15/03/2022.
//

import UIKit

class ProfileDetailVC: UIViewController {
    var performIdentify: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cá nhân"
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
