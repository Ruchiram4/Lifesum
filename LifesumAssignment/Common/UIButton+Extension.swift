//
//  UILabel+Extension.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/9/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func addCharacterSpacingForTitle(kernValue: Double = 1.2, state: UIControl.State) {
        guard let text = titleLabel?.text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        setAttributedTitle(string, for: state)
    }
}
