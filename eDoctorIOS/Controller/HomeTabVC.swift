//
//  HomeTabVC.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

class HomeTabVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollview: UIScrollView!

    @IBOutlet var basicProfile: BasicProfile!

    let apiManager = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LoginVC
        destinationVC.performIdentify = "HomeTabVC"
    }
}
