//
//  StyleTextFields.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import Foundation
import UIKit

extension UITextField {
    func roundTopCorners(textField: UITextField, cornerRadiusNumber: CGFloat, borderWidthNumber: CGFloat, color: CGColor){
        textField.clipsToBounds = true
        textField.layer.borderWidth = borderWidthNumber
        textField.layer.borderColor = color
        textField.layer.cornerRadius = cornerRadiusNumber
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func roundBottomCorners(textField: UITextField, cornerRadiusNumber: CGFloat, borderWidthNumber: CGFloat, color: CGColor){
        textField.clipsToBounds = true
        textField.layer.borderWidth = borderWidthNumber
        textField.layer.borderColor = color
        textField.layer.cornerRadius = cornerRadiusNumber
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func roundAllCorners(textField: UITextField, cornerRadiusNumber: CGFloat, borderWidthNumber: CGFloat, color: CGColor){
        textField.clipsToBounds = true
        textField.layer.borderWidth = borderWidthNumber
        textField.layer.borderColor = color
        textField.layer.cornerRadius = cornerRadiusNumber
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
}

extension UIButton {
    func roundBottomCorners(button: UIButton, cornerRadiusNumber: CGFloat, borderWidthNumber: CGFloat){
        button.clipsToBounds = true
        button.layer.borderWidth = borderWidthNumber
        button.layer.cornerRadius = cornerRadiusNumber
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func roundAllCorners(button: UIButton, cornerRadiusNumber: CGFloat, borderWidthNumber: CGFloat){
        button.clipsToBounds = true
        button.layer.borderWidth = borderWidthNumber
        button.layer.cornerRadius = cornerRadiusNumber
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
