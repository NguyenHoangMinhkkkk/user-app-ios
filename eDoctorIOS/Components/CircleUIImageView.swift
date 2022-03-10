//
//  CircleUIView.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 09/03/2022.
//

import UIKit

@IBDesignable public class CircleUIImageView: UIImageView {
    override public func layoutSubviews() {
        super.layoutSubviews()

        // hard-coded this since it's always round
        layer.cornerRadius = bounds.size.width / 2
        clipsToBounds = true
    }
}
