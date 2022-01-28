//
//  NewHeightWeightVC.swift
//  sizeit
//
//  Created by iMac on 26/01/22.
//

import UIKit

class NewHeightWeightVC: UIViewController {
    
    //MARK:- Variable Declration
    
    var topMargin:CGFloat = -7
    var bottompMargin:CGFloat = -23

    //MARK:- Outlte zone
    
    @IBOutlet weak var lblHeightTop:NSLayoutConstraint!
    @IBOutlet weak var lblWeightTop:NSLayoutConstraint!
    @IBOutlet weak var lblWeightTitle:UILabel!
    @IBOutlet weak var lblHeightTitle:UILabel!
    @IBOutlet weak var txtHeight:UITextField!
    @IBOutlet weak var txtWeight:UITextField!
    @IBOutlet weak var viewHeight:CustomView!
    @IBOutlet weak var viewWidth:CustomView!
    
    //MARK:- ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        let tapHeight = UITapGestureRecognizer(target: self, action: #selector(viewOnTap(_:)))
        viewHeight.addGestureRecognizer(tapHeight)
        
        let tapWidth = UITapGestureRecognizer(target: self, action: #selector(viewOnTap(_:)))
        viewWidth.addGestureRecognizer(tapWidth)
        
    }

    @objc func viewOnTap(_ sender: UITapGestureRecognizer? = nil) {
        print(" tag \(sender?.view?.tag ?? 0)")
        if sender?.view?.tag == 0{
            txtHeight.becomeFirstResponder()
           _ =  textFieldShouldBeginEditing(txtHeight)
        } else {
            txtWeight.becomeFirstResponder()
           _ =  textFieldShouldBeginEditing(txtWeight)
        }
    }
}

//MARK:- Action Zone

extension NewHeightWeightVC {
    
    @IBAction func btnContinueAction(_ sender:UIButton) {
        let obj = mainStoryboard.instantiateViewController(withIdentifier: "BodyTypeVC") as! BodyTypeVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
}

//MARK:- UITextfield Delegate

extension NewHeightWeightVC:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtHeight {
            lblHeightTop.constant = bottompMargin
            lblWeightTop.constant = topMargin
        } else if textField == txtWeight {
            lblHeightTop.constant = topMargin
            lblWeightTop.constant = bottompMargin
        }
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == txtHeight {
            lblHeightTop.constant = topMargin
        } else if textField == txtWeight {
            lblWeightTop.constant = topMargin
        }
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        return true
    }
}
