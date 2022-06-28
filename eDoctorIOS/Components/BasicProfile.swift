//
//  BasicProfile.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 09/03/2022.
//

import UIKit

protocol BasicProfileDelegate {
    func performSegueFromBasicProfile()
}

class BasicProfile: UIView, UIGestureRecognizerDelegate {
    @IBOutlet var avatarImageView: CircleUIImageView!
    @IBOutlet var userNameLabel: cTitleLabel!
    @IBOutlet var birthDayLabel: cLargeLabel!
    @IBOutlet var genderLabel: cNormalLabel!
    @IBOutlet var phoneNumberLabel: cSmallLabel!

    var delegate: BasicProfileDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        isHidden = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView))
        tapGesture.delegate = self
        gestureRecognizers = [tapGesture]
        getConsumerData()
        layer.borderWidth = 1
    }

    @objc func clickView() {
        print("click profile")
        delegate?.performSegueFromBasicProfile()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initAvatar()
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
                            DispatchQueue.main.async {
                                self.userNameLabel.text = profile.fullName
                                self.birthDayLabel.text = String("Ngày sinh: \(profile.birthDate_date)/\(profile.birthDate_month)/\(profile.birthDate_year)")
                                self.phoneNumberLabel.text = String("SĐT: \(profile.phoneNumber ?? "Chưa cập nhật")")
                                self.genderLabel.text = "Giới tính: \(profile.gender != "" ? (profile.gender == "male" ? "Nam" : "Nữ") : "--")"
                                if let safeUrl = profile.avatar?.versions?.original?.url {
                                    let url = URL(string: safeUrl)!
                                    let data = try? Data(contentsOf: url)
                                    self.avatarImageView.image = UIImage(data: data!)
                                }
                                self.isHidden = false
                            }
                        }
                    }
                }
            }
        } catch {
            print("BasicProfile Get data failed.", error)
        }
    }
}
