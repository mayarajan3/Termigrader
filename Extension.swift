//
//  Spinner.swift
//  Terms_of_Use_Scanner
//
//  Created by Maya Rajan on 7/14/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
            //let spinnerView = UIView.init(frame: onView.bounds)
        let spinnerView = UIView.init(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: onView.frame.size.width, height: onView.frame.size.height)))
        
        spinnerView.isUserInteractionEnabled = true
        spinnerView.isUserInteractionEnabled = true
        
            spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.isUserInteractionEnabled = true
            ai.startAnimating()
            ai.center = spinnerView.center
        
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
                onView.addSubview(spinnerView)
            }
            
            return spinnerView
        }
        
        class func removeSpinner(spinner :UIView) {
            DispatchQueue.main.async {
                spinner.removeFromSuperview()
            }
        }
    

}

extension UITextView {
    func increaseFontSize() {
        self.font =  UIFont(name: self.font!.fontName, size: self.font!.pointSize+1)!
    }
    func decreaseFontSize() {
        self.font =  UIFont(name: self.font!.fontName, size: self.font!.pointSize-1)!
    }
    func setFontSize(sizee : Float) {
        self.font =  UIFont(name: self.font!.fontName, size: CGFloat(sizee))!
    }
}

extension UILabel {
    func increaseFontSize() {
        self.font = self.font.withSize(self.font.pointSize+1)
    }
    func decreaseFontSize() {
        self.font = self.font.withSize(self.font.pointSize-1)
    }
    func setFontSize(sizee: Float) {
        self.font = self.font.withSize(CGFloat(sizee))
    }
}

extension UITextField {
    func increaseFontSize() {
        self.font =  UIFont(name: self.font!.fontName, size: self.font!.pointSize+1)!
    }
    func decreaseFontSize() {
        self.font =  UIFont(name: self.font!.fontName, size: self.font!.pointSize-1)!
    }
    func setFontSize(sizee : Float) {
        self.font =  UIFont(name: self.font!.fontName, size: CGFloat(sizee))!
    }
}

extension UIButton {
    func setFontSize(sizee : Float) {
        self.titleLabel?.setFontSize(sizee: sizee)
    }
}




