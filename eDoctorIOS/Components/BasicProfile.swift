//
//  BasicProfile.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 09/03/2022.
//

import UIKit

class BasicProfile: UIView {
    @IBOutlet var avatarImageView: CircleUIImageView!
    @IBOutlet var userNameLabel: cTitleLabel!
    @IBOutlet var birthDayLabel: cLargeLabel!
    @IBOutlet var genderLabel: cNormalLabel!
    @IBOutlet var phoneNumberLabel: cSmallLabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
//        self.isHidden = true
        getConsumerData()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initAvatar()
    }

    func initAvatar() {
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = UIColor.systemGray6.cgColor
    }

    func getConsumerData() {
        do {
            if let data = UserDefaults.standard.data(forKey: UserDefaultKey.ConsumerData) {
                let decoder = PropertyListDecoder()
                let consumerData = try decoder.decode(Consumer.self, from: data)
                if let safeProfiles = consumerData.consumer?.profiles {
                    for profile in safeProfiles {
                        if profile.relation == "self" {
                            userNameLabel.text = profile.fullName
                            birthDayLabel.text = String("Ngày sinh: \(profile.birthDate_date)/\(profile.birthDate_month)/\(profile.birthDate_year)")
                            phoneNumberLabel.text = String("SĐT: \(profile.phoneNumber)")
                            genderLabel.text = profile.gender != "" ? (profile.gender == "male" ? "Nam" : "Nữ") : "--"
                        }
                    }
                }
            }
        } catch {
            print("BasicProfile Get data failed.", error)
        }
    }

    let nibName = "BasicProfile"

    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
    }

    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
