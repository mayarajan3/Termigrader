//
//  Segue_Direction.swift
//  Terms_of_Use_Scanner
//
//  Created by Maya Rajan on 7/7/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit

class Segue_Direction: UIStoryboardSegue {
    let duration: TimeInterval = 1
    let delay: TimeInterval = 0
    let animationOptions: UIViewAnimationOptions = [.curveEaseIn, .curveEaseOut]
    override func perform() {
        
        let sourceView = source.view
        let destinationView = destination.view
        
        // get screen height
        let screenHeight = UIScreen.main.bounds.size.height
        destinationView!.transform = CGAffineTransform(translationX:0, y:-screenHeight)
        
        // add destination view to view hierarchy
        UIApplication.shared.keyWindow?.insertSubview(destinationView!, aboveSubview: sourceView!)
        
        // animate
        UIView.animate(withDuration:duration, delay: delay, options: animationOptions, animations: {
            destinationView!.transform = CGAffineTransform.identity
        }) { (_) in
            self.source.present(self.destination, animated: false, completion: nil)
        }

    }
        
    
    
}

