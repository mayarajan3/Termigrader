//
//  ViewController.swift
//  Terms of Use Scanner
//
//  Created by Maya Rajan on 7/1/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
import Foundation

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var rate_linking: UILabel!
    @IBOutlet weak var help_button: UIButton!
    @IBOutlet weak var input_header: UILabel!
    @IBOutlet weak var send_button: UIButton!
    @IBOutlet weak var provide_link: UILabel!
    @IBOutlet weak var rate_label: UILabel!
    // MARK: Properties
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var company_name: UITextField!
    @IBOutlet weak var difficulty: UISlider!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var links: UISlider!
    @IBOutlet weak var if_url: UISwitch!
    @IBOutlet weak var copy_n_paste: UILabel!
    @IBOutlet weak var terms: UITextView!
    var final_name: String!
    var name: String!
    var contents_loaded: Bool!
    var constraint_one: NSLayoutConstraint!
    var constraint_two: NSLayoutConstraint!
    var constraint_three: NSLayoutConstraint!
    var constraint_four: NSLayoutConstraint!
    var url: Bool!
    static var html_content: String!
    static var score: String!
    static var linking: jdouble!
    static var first_read: Double!
    
    @IBOutlet weak var lineone: UIImageView!
    @IBOutlet weak var linetwo: UIImageView!
    @IBOutlet weak var linethree: UIImageView!
    @IBOutlet weak var linefour: UIImageView!
    @IBOutlet weak var linefive: UIImageView!
    @IBOutlet weak var linesix: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RATIO = 667/17
        
        url=true
        // Do any additional setup after loading the view, typically from a nib.
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        if_url.addTarget(self, action: #selector(if_url(_:)), for: .valueChanged)
        
        difficulty.value = 0.0
        links.value = 0.0
        
        lineone.frame.size.width = view.frame.width
        linetwo.frame.size.width = view.frame.width
        linethree.frame.size.width = view.frame.width
        linefour.frame.size.width = view.frame.width
        linefive.frame.size.width = view.frame.width
        linesix.frame.size.width = view.frame.width
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.isTranslucent = false
        keyboardToolbar.barTintColor = UIColor.white
        
        
        let addButton = UIBarButtonItem(
            title: "Paste",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(pasteItem)
        )
        addButton.tintColor = UIColor.black
        keyboardToolbar.items = [addButton]
        terms.inputAccessoryView = keyboardToolbar
        
        keyboardToolbar._java_lang_ref_original_release()
        addButton._java_lang_ref_original_release()
        borderColor._java_lang_ref_original_release()
        
        terms.sizeToFit()
        terms.returnKeyType = UIReturnKeyType.done
        terms.layer.borderWidth = 1.0
        terms.layer.borderColor = borderColor.cgColor
        terms.layer.cornerRadius = 5.0
        difficulty.minimumValue = 0.0
        difficulty.maximumValue = 10.0
        links.minimumValue = 0.0
        links.maximumValue = 10.0
        company_name.autocapitalizationType = UITextAutocapitalizationType.sentences;
        terms.autocapitalizationType = UITextAutocapitalizationType.sentences;
        company_name.delegate = self
        terms.delegate = self
        let mycolor = UIColor(hue: 0.5778, saturation: 0.56, brightness: 0.85, alpha: 1.0)
        if_url.onTintColor = mycolor
        if_url.layer.cornerRadius = if_url.frame.height
        mycolor._java_lang_ref_original_release()
        
        constraint_one = view.constraints.first { $0.identifier == "only_one" }
        constraint_two = view.constraints.first { $0.identifier == "jkjk" }
        constraint_three = view.constraints.first { $0.identifier == "link_constraint" }
        constraint_four = view.constraints.first { $0.identifier == "remove" }
        
        rate.isHidden = true
        links.isHidden = true
        linefive.isHidden=true
        constraint_two?.isActive = true
        constraint_one?.isActive = false
        constraint_three?.isActive = false
        constraint_four?.isActive = false
        if_url.isOn = true
        copy_n_paste.text = "Paste the url here: "
        
        input_header.setFontSize(sizee: getFont(original: 30))
        help_button.setFontSize(sizee: getButtonFont(original: 17))
        testlabel.setFontSize(sizee: getFont(original: 17))
        company_name.setFontSize(sizee: getFont(original: 17))
        rate.setFontSize(sizee: getFont(original: 17))
        copy_n_paste.setFontSize(sizee: getFont(original: 17))
        terms.setFontSize(sizee: getFont(original: 17))
        rate_label.setFontSize(sizee: getFont(original: 17))
        provide_link.setFontSize(sizee: getFont(original: 17))
        input_header.setFontSize(sizee: Float(input_header.font.pointSize))
        send_button.setFontSize(sizee: getFont(original: 17))
        rate_linking.setFontSize(sizee: getFont(original: 17))

        provide_link.sizeToFit()
        rate_label.sizeToFit()
        copy_n_paste.sizeToFit()
        rate_linking.sizeToFit()
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {

    }

    
    @IBAction func if_url(_ sender: UISwitch!) {
        if if_url.isOn {
            constraint_one?.isActive = false
            constraint_two?.isActive = true
            constraint_three?.isActive = false
            constraint_four?.isActive = false
            rate.isHidden = true
            links.isHidden = true
            copy_n_paste.text = "Paste the url here: "
            url = true
            linefive.isHidden=true
        }
        else {
            constraint_two?.isActive = false
            constraint_one?.isActive = true
            constraint_three?.isActive = true
            constraint_four?.isActive = true
            rate.isHidden = false
            links.isHidden = false
            copy_n_paste.text = "Copy and paste the terms and conditions here: "
            url = false
            linefive.isHidden=false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "transition_one") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Get_Results")
            //let navi =  UINavigationController.init(rootViewController: vc)
            Get_Results.revealed=false
            Show_Information.show_info=false
            See_Input.see=false
            self.show(vc, sender: self)
            vc._java_lang_ref_original_release()
            storyboard._java_lang_ref_original_release()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        company_name.resignFirstResponder()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            view.endEditing(true)
            return false
        }
        else {
            return true
        }
    }
    
    @IBAction func Send(_ sender: UIButton) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        let myGroup = DispatchGroup()
        let myGroup_non = DispatchGroup()
        let myGroup_in = DispatchGroup()
        var uh: String!
        if (company_name.text=="") {
            uh = "Company"
        }
        else {
            uh = company_name.text!
        }
        var the_difficulty: jdouble!
        the_difficulty = jdouble(self.difficulty.value)
        var the_linkster: jdouble!
        the_linkster = jdouble(self.links.value)/10
        var the_terms: String!
        the_terms = self.terms.text
        
        let strter = terms.text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        let difff = difficulty.value
        
        if url {

            let yo = Array(strter)
            //'h''t''t''p''no s'
            let messageURL = NSURL(string: strter)
            let sharedSession = URLSession.shared
            myGroup.enter()
            
            DispatchQueue.main.async {
                
                
                if ((yo.count)>5) {
                    if ((yo[0]=="h") && (yo[1]=="t") && (yo[2]=="t") && (yo[3]=="p") && ((yo[4]) != ("s"))) {
                        let alert = UIAlertController(title: "Unsafe URL", message: "Please enter a url with a secure connection.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.terms.text = ""
                        alert._java_lang_ref_original_release()
                    }
                }
                if (messageURL != nil) {
            let downloadTask: URLSessionDownloadTask = sharedSession.downloadTask(with: messageURL! as URL,
            completionHandler: {
                
                    (location: URL?, response: URLResponse?, error: Error?) -> Void in
                    var heck: Bool!
                    if location != nil {
                        heck = true
                    }
                    else {
                        heck = false
                    }
                    var yikes:Bool=true
                if heck {
                        do {
                            let hm = try NSString(contentsOf: location!, encoding: String.Encoding.utf8.rawValue)
                            hm._java_lang_ref_original_release()
                        } catch {
                            yikes=false
                        }
                } else {
                    DispatchQueue.main.async {
                        UIViewController.removeSpinner(spinner: sv)
                        self.alert()
                    }
                }
                    if heck && yikes {
                        
                    
                    let urlContents = try! NSString(contentsOf: location!, encoding: String.Encoding.utf8.rawValue)
                       do {
                           let attrStr = try NSAttributedString(
                            data: urlContents.data(using: String.Encoding.unicode.rawValue, allowLossyConversion: true)!,
                               options: [ .documentType: NSAttributedString.DocumentType.html],
                                    documentAttributes: nil)
                                    ViewController.html_content = attrStr.string
                            var count_link: jdouble!
                            if let url_dos = URL(string: strter) {
                                do {
                                        let contents = try String(contentsOf: url_dos)
                                        let tok =  contents.components(separatedBy:"href")
                                        count_link = jdouble(tok.count-1)
                                        let toktwo = ViewController.html_content.components(separatedBy: " ")
                                        ViewController.linking = (count_link/jdouble(toktwo.count))/0.05
                                    if (!self.findLetters(phrase: ViewController.html_content! as NSString)) {
                                        DispatchQueue.main.async {
                                            UIViewController.removeSpinner(spinner: sv)
                                            let alert = UIAlertController(title: "Error", message: "There was a problem reading the information from the URL.", preferredStyle: .alert)
                                            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                            Alg_Arg.cleanOut()
                                            self.company_name.text = ""
                                            self.terms.text = ""
                                            self.if_url.isOn = true
                                            self.difficulty.value = 0.0
                                            self.links.value = 0.0
                                            self.present(alert, animated: true, completion: nil)
                                        }
                                    }
                                    else {
        
                                   
                                        let vc = Get_Results(nibName: "Get_Results", bundle: nil)
                                        vc.comp_name = uh
                                        vc.show=false
                                        Get_Results.revealed=false
                                        vc.terms = ViewController.html_content
                                        Alg_Arg.alg(with: uh, with: jdouble(difff), with: ViewController.linking, with: ViewController.html_content)
                                        myGroup.leave()
                                        vc._java_lang_ref_original_release()
                                    }
                                
                               
                                
                            } catch {
                                // contents could not be loaded
                                DispatchQueue.main.async {
                                    UIViewController.removeSpinner(spinner: sv)
                                    self.alert()
                                }
                            }
                           
                        } else {
                            // the URL was bad!
                            DispatchQueue.main.async {
                                UIViewController.removeSpinner(spinner: sv)
                                self.alert()
                            }
                        }
                    } catch {
                        DispatchQueue.main.async {
                            UIViewController.removeSpinner(spinner: sv)
                            self.alert()
                        }
                    }
                      
                }
                else {
                    DispatchQueue.main.async {
                        UIViewController.removeSpinner(spinner: sv)
                        self.alert()
                    }
                }

            })
                    
                downloadTask.resume()
                
                
                //multiply times 100
                //.06 real bad
                //.03 good
                //.0255 moderate
                //.028 moderate
            
                                                                                    
                
            
                } else {
                    DispatchQueue.main.async {
                        UIViewController.removeSpinner(spinner: sv)
                        self.alert()
                    }
            }
            }
            
            
            myGroup.notify(queue: .main) {// change 2 to
                let concurrentQueue = DispatchQueue(label: Bundle.main.bundleIdentifier! + ".concurrentQueue", qos: .utility, attributes: .concurrent)
                
                concurrentQueue.async {
                    Alg_Arg.modification()
                    Alg_Arg.location_Knowing()
                    Alg_Arg.share_Information()
                    Alg_Arg.access_History()
                    
                }

                concurrentQueue.async {
                    Alg_Arg.third_Party()
                    Alg_Arg.glorification()
                    Alg_Arg.complexity()
                    Alg_Arg.responsibility()
                    Alg_Arg.vague_Language()
                }
                
                var change: Bool!
                change=false
                while (!change) {
                    if (Alg_Arg_access_hist && Alg_Arg_vague_lang) {
                        Alg_Arg.risk_Algorithm()
                        Alg_Arg.log()
                        self.performSegue(withIdentifier:"transition_one", sender: nil)
                        change=true
                    }
                }
            }
        }
        
        else {
            myGroup_non.enter()
            sv.bringSubview(toFront: self.view)
            DispatchQueue.global(qos: .background).async {
                Alg_Arg.alg(with: uh, with: the_difficulty, with: the_linkster, with: the_terms)
                Alg_Arg.modification()
                Alg_Arg.share_Information()
                Alg_Arg.access_History()
                Alg_Arg.third_Party()
                Alg_Arg.complexity()
                Alg_Arg.responsibility()
                Alg_Arg.vague_Language()
                Alg_Arg.location_Knowing()
                Alg_Arg.glorification()
                Alg_Arg.risk_Algorithm()
                Alg_Arg.log()
                DispatchQueue.main.async {
                    UIViewController.removeSpinner(spinner: sv)
                }
                myGroup_non.leave()
            
            }
                
            
            myGroup_non.notify(queue: .main) {
                let vc = Get_Results(nibName: "Get_Results", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
                UIViewController.removeSpinner(spinner: sv)
                self.performSegue(withIdentifier:"transition_one", sender: nil)
                
            }
            
        }
        
        sv._java_lang_ref_original_release()
        myGroup._java_lang_ref_original_release()
        myGroup_non._java_lang_ref_original_release()
        myGroup_in._java_lang_ref_original_release()
    }

    @objc func pasteItem() {
        let pasteboard = UIPasteboard.general
        terms.text = pasteboard.string
        pasteboard._java_lang_ref_original_release()
    }
    
    func alert() {
        let alert = UIAlertController(title: "Network Connection Error", message: "Either your url is invalid or you have no internet connection.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        Alg_Arg.cleanOut()
        company_name.text = ""
        terms.text = ""
        if_url.isOn = true
        difficulty.value = 0.0
        links.value = 0.0
        self.present(alert, animated: true, completion: nil)
        alert._java_lang_ref_original_release()
    }
    
    @IBAction func quit_process(_ sender: Any) {
        Alg_Arg.cleanOut()
        company_name.text = ""
        terms.text = ""
        if_url.isOn = true
        difficulty.value = 0.1
        links.value = 0.1
    }
    
    func pointTest_one(check: UIView) -> Bool {
        return check.point(inside: CGPoint(x: terms.center.x, y: terms.center.y+1), with: nil)
    }
    
    func pointTest_two(check: UIView) -> Bool {
        return check.point(inside: CGPoint(x: terms.center.x, y: terms.center.y-1), with: nil)
    }
    
    func getFont(original : Float) -> Float {
        if (view.frame.height<1000) {
            return (original*(Float(view.frame.height)-25))/667
        }
        else if (view.frame.height<1300) {
            return (original*(Float(view.frame.height)*0.75))/667
        }
        else {
            return (original*(Float(view.frame.height)*0.5))/667
        }
    }
    @IBAction func help(_ sender: Any) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let alert = UIAlertController(title: "Instructions", message: "Ha", preferredStyle: .actionSheet)
        var basic: [NSAttributedStringKey : Any]
        var titlelab: [NSAttributedStringKey : Any]
        if (view.frame.height<667) {
            basic = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(14)), NSAttributedStringKey.paragraphStyle: paragraphStyle]
            titlelab = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: CGFloat(getFont(original: 14))), NSAttributedStringKey.paragraphStyle: paragraphStyle]
        }
        else {
            basic = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: CGFloat(14)), NSAttributedStringKey.paragraphStyle: paragraphStyle]
            titlelab = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: CGFloat(14)), NSAttributedStringKey.paragraphStyle: paragraphStyle]
        }
        
        let title_zero = "What to Look For\n"
        let full = NSMutableAttributedString(string:title_zero, attributes: titlelab)
        
        let text_one = "Most of the time, the company's terms are found by searching for them on Google and copying and pasting the link. In addition, many companies separate their privacy policy and their terms and conditions, but much of the information having to do with consumer protection is located in the privacy policy. Therefore, you should search for and scan both the privacy policy and the terms and conditions to get the most accurate results."
        full.append(NSMutableAttributedString(string:text_one, attributes: basic))
        
        let title = "\nHow to Rate Difficulty\n"
        full.append(NSMutableAttributedString(string:title, attributes: titlelab))
        
        let text_two = "If you are able to instantly find the company's terms/policies, make sure the slider is all the way to the left. If it takes you more than a couple minutes, make sure the slider is all the way to the right."
        full.append(NSMutableAttributedString(string:text_two, attributes: basic))
        
        let title_two = "\nHow to Rate External Linking\n"
        full.append(NSMutableAttributedString(string:title_two, attributes: titlelab))
        
        let text_three = "This app will be unable to read how much external linking there is in the company's terms/policies if you choose to paste the content directly. Therefore, you must manually provide this information: if there are little to no external links within the company's policies, make sure the slider is all the way to the left; if you see several external links, make sure the slider is all the way to the right."
        full.append(NSMutableAttributedString(string:text_three, attributes: basic))
        
        alert.setValue(full, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = sender as! UIView
            popoverController.sourceRect = (sender as AnyObject).bounds
        }

        
        self.present(alert, animated: true, completion:nil)
    
    }
    
    func findLetters(phrase : NSString) -> Bool {
        let letters = NSCharacterSet.letters
    
        let range = phrase.rangeOfCharacter(from: letters)
    
        // range will be nil if no letters is found
        if range.location != NSNotFound {
            return true
        }
        else {
            return false
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

    
}



