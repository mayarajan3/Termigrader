//
//  Show_Information.swift
//  Terms_of_Use_Scanner
//
//  Created by Maya Rajan on 7/7/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit

class Show_Information: UIViewController {


    
    @IBOutlet weak var about: UITextView!
    @IBOutlet weak var backB: UIButton!
    static var show_info: Bool!
    
    var strings:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Get_Results.revealed==true) {
            Show_Information.show_info=true
        }
        about.sizeToFit()
        
        let basic = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(getFont(original: 14)))]
        
        let line = "\n"
        let theline = NSMutableAttributedString(string:line)
        //let full = NSMutableAttributedString(string:line, attributes: basic)
        
        let title = "DISCLAIMER\n" //THE FIRST LABEL
        let titlelab = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: CGFloat(getFont(original: 25)))]
        let full = NSMutableAttributedString(string:title, attributes: titlelab)
        
        full.append(theline)
        let updated = "Last updated: July 15, 2018\n"
        let updat = NSMutableAttributedString(string:updated, attributes: basic)
        full.append(updat)
        full.append(theline)
        //let label = "About the Scoring System"
        let label = "Mobile Application Disclaimer" //THE FIRST LABEL
        let firstlab = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: CGFloat(getFont(original: 23)))]
        let mm = NSMutableAttributedString(string:label, attributes: firstlab)
        full.append(mm)
        full.append(theline)

        about.isEditable = false
    
        
        let first_dis="The information provided by Termigrader (\"we,\" \"us,\" or \"our\") on our mobile application is for general informational purposes only. All information on our mobile application is provided in good faith, however  we make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information on our mobile application. UNDER NO CIRCUMSTANCE SHALL WE HAVE ANY LIABILITY TO YOU FOR ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF THE USE OF OUR MOBILE APPLICATION OR RELIANCE ON ANY INFORMATION PROVIDED ON OUR MOBILE APPLICATION. YOUR USE OF OUR MOBILE APPLICATION AND YOUR RELIANCE ON ANY INFORMATION ON THE MOBILE APPLICATION IS SOLELY AT YOUR OWN RISK."
        //FIRST DIS PARAGRAPH
        
        let normalString3 = NSMutableAttributedString(string:first_dis, attributes: basic)
        full.append(normalString3)
        full.append(theline)
        
        //let label_dos = "About the Results"
        let label_dos="Professional Disclaimer" //SECOND LABEL
        let dos = NSMutableAttributedString(string: label_dos, attributes: firstlab)
        full.append(theline)
        full.append(dos)
        full.append(theline)
        
       
        
        let numone = "This mobile application cannot and does not contain legal advice. The legal information is provided for general informational and educational purposes only and is not a substitute for professional advice. Accordingly, before taking any actions based upon such information, we encourage you to consult with the approriate professionals. We do not provide any kind of legal advice. THE USE OR RELIANCE OF ANY INFORMATION CONTAINED ON OUR MOBILE APPLICATION IS SOLELY AT YOUR RISK." //SECOND PARAGRAPH
        
        let att = NSMutableAttributedString(string:numone, attributes: basic)
        
        full.append(att)
        full.append(theline)
        full.append(theline)
        let con = "Contact Information"
        let tres = NSMutableAttributedString(string: con, attributes: firstlab)
        full.append(tres)
        full.append(theline)
        
        //THE THIRD ONE
        let conz = "Any questions? Comments? Feedback?\nEmail terms.of.use.scanner@gmail.com"
        let thecon = NSMutableAttributedString(string:conz, attributes: basic)
        full.append(thecon)
        
        
        about.attributedText = full
        about.scrollRangeToVisible(NSMakeRange(0, 0))
        
        about.isScrollEnabled = true
        
        backB.setFontSize(sizee: getButtonFont(original: 17))
        
        
    }
    
    override func viewDidLayoutSubviews() {
        self.about.setContentOffset(.zero, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "more_info_back") {
            let a = Get_Results()
            if (Get_Results.revealed==true) {
                a.show=true
            }
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Get_Results")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        //more_info_back
        self.performSegue(withIdentifier: "more_info_back", sender: nil)
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
