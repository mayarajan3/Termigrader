//
//  Get_Results.swift
//  Terms_of_Use_Scanner
//
//  Created by Maya Rajan on 7/6/18.
//  Copyright © 2018 Maya Rajan. All rights reserved.
//

import UIKit


class Get_Results: UIViewController {
    
    @IBOutlet weak var desc_one: UILabel!
    @IBOutlet weak var desc_two: UILabel!
    @IBOutlet weak var desc_three: UILabel!
    @IBOutlet weak var desc_four: UILabel!
    @IBOutlet weak var desc_five: UILabel!
    @IBOutlet weak var desc_six: UILabel!
    
    @IBOutlet weak var see_more_info: UIButton!
    @IBOutlet weak var disclaimer: UIButton!
    
    @IBOutlet weak var one_one: UIImageView!
    @IBOutlet weak var one_two: UIImageView!
    @IBOutlet weak var one_three: UIImageView!
    @IBOutlet weak var two_one: UIImageView!
    @IBOutlet weak var two_two: UIImageView!
    @IBOutlet weak var two_three: UIImageView!
    @IBOutlet weak var three_one: UIImageView!
    @IBOutlet weak var three_two: UIImageView!
    @IBOutlet weak var three_three: UIImageView!
    @IBOutlet weak var four_one: UIImageView!
    @IBOutlet weak var four_two: UIImageView!
    @IBOutlet weak var four_three: UIImageView!
    @IBOutlet weak var five_one: UIImageView!
    @IBOutlet weak var five_two: UIImageView!
    @IBOutlet weak var five_three: UIImageView!
    @IBOutlet weak var six_one: UIImageView!
    @IBOutlet weak var six_two: UIImageView!
    @IBOutlet weak var six_three: UIImageView!
    
    @IBOutlet weak var line_one: UIImageView!
    @IBOutlet weak var line_two: UIImageView!
    @IBOutlet weak var line_three: UIImageView!
    @IBOutlet weak var line_four: UIImageView!
    @IBOutlet weak var line_five: UIImageView!
    @IBOutlet weak var line_six: UIImageView!
    @IBOutlet weak var line_seven: UIImageView!
    
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var copier: UIButton!
    //@IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var the_score: UILabel!
    @IBOutlet weak var the_header: UILabel!
    @IBOutlet weak var seeInput: UIButton!
    //@IBOutlet weak var the_ext_info: UILabel!
    @IBOutlet weak var the_ext_info: UITextView!
    var the_stuff:String=""
    var terms:String=""
    var score:String=""
    var qualitative:String=""
    var comp_name: String=""
    static var revealed: Bool!
    var show: Bool!
    var ozzie: String=""
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        the_ext_info.layer.borderWidth = 1.0
        the_ext_info.layer.borderColor = borderColor.cgColor
        the_ext_info.layer.cornerRadius = 5.0
        the_ext_info.isEditable = false
        the_ext_info.scrollRangeToVisible(NSMakeRange(0, 0))
        the_ext_info.isScrollEnabled = true
        
        borderColor._java_lang_ref_original_release()
        
        line_one.frame.size.width = view.frame.width
        line_two.frame.size.width = view.frame.width
        line_three.frame.size.width = view.frame.width
        line_four.frame.size.width = view.frame.width
        line_five.frame.size.width = view.frame.width
        line_six.frame.size.width = view.frame.width
        line_seven.frame.size.width = view.frame.width

    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        
        the_header.text = "Results for: " + Alg_Arg_app_name
        the_ext_info.sizeToFit()
        
        if (Show_Information.show_info==false && See_Input.see==false && Get_Results.revealed==false) {
            the_ext_info.isHidden = true
        }
        if (getTerms()==" ") {
            the_ext_info.text = "No input was provided."
            the_score.text = "Grade: N/A"
            one_one.isHidden=true
            one_two.isHidden=true
            one_three.isHidden=true
            two_one.isHidden=true
            two_two.isHidden=true
            two_three.isHidden=true
            three_one.isHidden=true
            three_two.isHidden=true
            three_three.isHidden=true
            four_one.isHidden=true
            four_two.isHidden=true
            four_three.isHidden=true
            five_one.isHidden=true
            five_two.isHidden=true
            five_three.isHidden=true
            six_one.isHidden=true
            six_two.isHidden=true
            six_three.isHidden=true
        }
        else {
            the_ext_info.text = Alg_Arg.getInfo()
            the_score.text = Alg_Arg.getScore()
        }
        
        if (getTerms() != " ") {
            if (Alg_Arg_criteria_one=="bad") {
                one_two.isHidden=true
                one_three.isHidden=true
            }
            else if (Alg_Arg_criteria_one=="average") {
                one_three.isHidden=true
            }
            else {}
        
            if (Alg_Arg_criteria_two=="bad") {
                two_two.isHidden=true
                two_three.isHidden=true
            }
            else if (Alg_Arg_criteria_two=="average") {
                two_three.isHidden=true
            }
            else {}
        
            if (Alg_Arg_criteria_three=="bad") {
                three_two.isHidden=true
                three_three.isHidden=true
            }
            else if (Alg_Arg_criteria_three=="average") {
                three_three.isHidden=true
            }
            else {}
            
            if (Alg_Arg_criteria_four=="bad") {
                four_two.isHidden=true
                four_three.isHidden=true
            }
            else if (Alg_Arg_criteria_four=="average") {
                four_three.isHidden=true
            }
            else {}
        
            if (Alg_Arg_criteria_five=="bad") {
                five_two.isHidden=true
                five_three.isHidden=true
            }
            else if (Alg_Arg_criteria_five=="average") {
                five_three.isHidden=true
            }
            else {}
        
            if (Alg_Arg_criteria_six=="bad") {
                six_two.isHidden=true
                six_three.isHidden=true
            }
            else if (Alg_Arg_criteria_six=="average") {
                six_three.isHidden=true
            }
            else {}
        }
                

            let label_height = getFont(original: 50)
            setLabelConstraint(size: CGFloat(label_height))
            setPicSize(size: CGFloat((label_height+6)-24))
            the_score.setFontSize(sizee: getFont(original: Float(the_score.font.pointSize)))
            the_header.setFontSize(sizee: getFont(original: Float(the_header.font.pointSize)))
            the_ext_info.setFontSize(sizee: getFont(original: Float(13)))
            desc_one.setFontSize(sizee: getFont(original: 13))
            desc_two.setFontSize(sizee: getFont(original: 13))
            desc_three.setFontSize(sizee: getFont(original: 13))
            desc_four.setFontSize(sizee: getFont(original: 13))
            desc_five.setFontSize(sizee: getFont(original: 13))
            desc_six.setFontSize(sizee: getFont(original: 13))

            done.setFontSize(sizee: getFont(original: 17))
            copier.setFontSize(sizee: getFont(original: 17))
            seeInput.setFontSize(sizee: getFont(original: 17))
            see_more_info.setFontSize(sizee: getFont(original: 17))
            disclaimer.setFontSize(sizee: getFont(original: 17))
        
        
        Alg_Arg.releaseAll()
        
        
    }
    
    func releaseEm() {
        
        done._java_lang_ref_original_release()
        copier._java_lang_ref_original_release()
        the_score._java_lang_ref_original_release()
        the_header._java_lang_ref_original_release()
        seeInput._java_lang_ref_original_release()
        the_ext_info._java_lang_ref_original_release()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //releaseEm()
        if (segue.identifier == "transition_two") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
            self.show(vc, sender: self)
            vc._java_lang_ref_original_release()
            storyboard._java_lang_ref_original_release()
        }
        if (segue.identifier=="see_input") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "See_Input")
            self.show(vc, sender: self)
            vc._java_lang_ref_original_release()
            storyboard._java_lang_ref_original_release()
        }
        if (segue.identifier=="results_information") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "More_Information")
            self.navigationController?.pushViewController(vc, animated: true)
            vc._java_lang_ref_original_release()
            storyboard._java_lang_ref_original_release()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //releaseEm()
    }

    @IBAction func ext_hidden(_ sender: Any) {
        the_ext_info.isHidden=false
        Get_Results.revealed=true
    }
    @IBAction func goToInfo(_ sender: Any) {
        self.performSegue(withIdentifier:"results_information", sender: nil)
    }
    
    @IBAction func seeInput(_ sender: Any) {
        self.performSegue(withIdentifier:"see_input", sender: nil)
    }
    @IBAction func copyInfo(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        var append: String=""
        append.append(the_header.text! + "\n" + the_score.text! + "\n")
        append.append("The comany's relationship with advertisers/third parties: ")
        if (Alg_Arg_criteria_one=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_one=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nInformation that the company collects from you: ")
        if (Alg_Arg_criteria_two=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_two=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nHow the company treats legal pursuits: ")
        if (Alg_Arg_criteria_three=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_three=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nHow the company treats updating the terms: ")
        if (Alg_Arg_criteria_four=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_four=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nThe language used within the terms: ")
        if (Alg_Arg_criteria_five=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_five=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nHow difficult it is to access the terms: ")
        if (Alg_Arg_criteria_six=="bad") {
            append.append("Poor")
        }
        else if (Alg_Arg_criteria_six=="average") {
            append.append("Moderate")
        }
        else {
            append.append("Strong")
        }
        append.append("\nMore Detailed Information\n" + the_ext_info.text!)
        pasteboard.string = append
        
        
        let alert = UIAlertController(title: "Success!", message: "The information has been copied.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        alert._java_lang_ref_original_release()
        pasteboard._java_lang_ref_original_release()
        Alg_Arg.releaseAll()
        
    }
    
    @IBAction func Send(_ sender: Any) {
        Alg_Arg.cleanOut()
        self.performSegue(withIdentifier:"transition_two", sender: nil)
    }
    
    func receiveItems(name: String, theterms: String, thescore: String, extinfo: String) {
        score = thescore
        terms = theterms
        comp_name = name
        qualitative = extinfo
    }
    
    func getTerms() -> String {
            for i in 0..<(Alg_Arg_reg.length()) {
                ozzie.append((Alg_Arg_reg.object(at: UInt(i)) as! String) + " ")
            }
            Alg_Arg.releaseAll()
        return ozzie
        
    }
    
    
    func setPicSize(size : CGFloat) {
        if (view.frame.height<1000) {
            
            var sum: Int=0
            for subview in view.subviews {
                for constraint in subview.constraints {
                    if constraint.identifier == "square" {
                        constraint.isActive=false
                        sum=sum+1
                    }
                }
            }
            
            one_one.frame = CGRect(x:one_one.center.x, y:one_one.center.y, width: size, height: size)
            one_two.frame = CGRect(x:one_two.center.x, y:one_two.center.y, width: size, height: size)
            one_three.frame = CGRect(x:one_three.center.x, y:one_three.center.y, width: size, height: size)
            two_one.frame = CGRect(x:two_one.center.x, y:two_one.center.y, width: size, height: size)
            two_two.frame = CGRect(x:two_two.center.x, y:two_two.center.y, width: size, height: size)
            two_three.frame = CGRect(x:two_three.center.x, y:two_three.center.y, width: size, height: size)
            three_one.frame = CGRect(x:three_one.center.x, y:three_one.center.y,width: size, height: size)
            three_two.frame = CGRect(x:three_two.center.x, y:three_two.center.y, width: size, height: size)
            three_three.frame = CGRect(x:three_three.center.x, y:three_three.center.y, width: size, height: size)
            four_one.frame = CGRect(x:four_one.center.x, y:four_one.center.y, width: size,  height: size)
            four_two.frame = CGRect(x:four_two.center.x, y:four_two.center.y, width: size, height: size)
            four_three.frame = CGRect(x:four_three.center.x, y:four_three.center.y, width: size, height: size)
            five_one.frame = CGRect(x:five_one.center.x, y:five_one.center.y, width: size, height: size)
            five_two.frame = CGRect(x:five_two.center.x, y:five_two.center.y, width: size, height: size)
            five_three.frame = CGRect(x:five_three.center.x, y:five_three.center.y, width: size, height: size)
            six_one.frame = CGRect(x:six_one.center.x, y:six_one.center.y, width: size, height: size)
            six_two.frame = CGRect(x:six_two.center.x, y:six_two.center.y, width: size,         height: size)
            six_three.frame = CGRect(x:six_three.center.x, y:six_three.center.y, width:     size, height: size)
        
        
        setConstraints(sub: one_one, size: size)
        setConstraints(sub: one_two, size: size)
        setConstraints(sub: one_three, size: size)
        setConstraints(sub: two_one, size: size)
        setConstraints(sub: two_two, size: size)
        setConstraints(sub: two_three, size: size)
        setConstraints(sub: three_one, size: size)
        setConstraints(sub: three_two, size: size)
        setConstraints(sub: three_three, size: size)
        setConstraints(sub: four_one, size: size)
        setConstraints(sub: four_two, size: size)
        setConstraints(sub: four_three, size: size)
        setConstraints(sub: five_one, size: size)
        setConstraints(sub: five_two, size: size)
        setConstraints(sub: five_three, size: size)
        setConstraints(sub: six_one, size: size)
        setConstraints(sub: six_two, size: size)
        setConstraints(sub: six_three, size: size)
        }

    }
    
    func setLabelConstraint(size : CGFloat) {
        desc_one.addConstraint(NSLayoutConstraint(item: desc_one, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        desc_two.addConstraint(NSLayoutConstraint(item: desc_two, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        desc_three.addConstraint(NSLayoutConstraint(item: desc_three, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        desc_four.addConstraint(NSLayoutConstraint(item: desc_four, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        desc_five.addConstraint(NSLayoutConstraint(item: desc_five, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        desc_six.addConstraint(NSLayoutConstraint(item: desc_six, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
    }
    
    func getFont(original : Float) -> Float {
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
    
    func setConstraints(sub : UIView, size : CGFloat) {
        sub.addConstraint(NSLayoutConstraint(item: sub, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
        sub.addConstraint(NSLayoutConstraint(item: sub, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size))
    }
    

}
