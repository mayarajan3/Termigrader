//
//  See_Input.swift
//  Terms_of_Use_Scanner
//
//  Created by Maya Rajan on 7/7/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit

class See_Input: UIViewController {

    @IBOutlet weak var the_text: UITextView!
    @IBOutlet weak var back: UIButton!
    var the_terms:String = ""
    static var see: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Get_Results.revealed == true) {
            See_Input.see=true
        }
        // Do any additional setup after loading the view.
        
        let basic = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(getFont(original: 14)))]
        
        let title = "Terms Scanned\n" //THE FIRST LABEL
        let titlelab = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: CGFloat(getFont(original: 23)))]
        let full = NSMutableAttributedString(string:title, attributes: titlelab)
        
        var the_terms: String!
        the_text.isEditable = false
        let test = Alg_Arg_original
        if (test==" ") {
            the_terms = "No input was provided."
        }
        else {
             the_terms = test
        }
        let zz = NSMutableAttributedString(string:the_terms, attributes: basic)
        full.append(zz)
        the_text.attributedText = full
        back.setFontSize(sizee: getButtonFont(original: 17))
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="transition_back_results") {
            let a = Get_Results()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Get_Results")
            if (Get_Results.revealed==true) {
                a.show = true
            }
            self.show(vc, sender: self)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        the_text.setContentOffset(CGPoint.zero, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.performSegue(withIdentifier:"transition_back_results", sender: nil)
    }
    
    func getFont(original : Float) -> Float {
        if (view.frame.height<550) {
            return (original*(Float(view.frame.height)))/667
        }
        else {
            return original
        }
    }
    
    func getButtonFont(original : Float) -> Float {
        if (view.frame.height<1000) {
            return (original*(Float(view.frame.height)-100))/667
        }
        else if (view.frame.height<1300) {
            return (original*(Float(view.frame.height)*0.75))/667
        }
        else {
            return (original*(Float(view.frame.height)*0.6))/667
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
