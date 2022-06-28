//
//  MTextFieldView.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 16/03/2022.
//

import UIKit

class MTextFieldView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    let nibName = "MTextFieldView"

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
