//
//  NewHeightWeightVC.swift
//  sizeit
//
//  Created by iMac on 26/01/22.
//

import UIKit

class NewHeightWeightVC: UIViewController {
    
    //MARK:- Variable Declration
    
    var topMargin:CGFloat = -5
    var bottompMargin:CGFloat = -13
    var imgBGMain = UIImage()
    var handlerViewCart:() -> Void = {}
    var param = [String:AnyObject]()

    //MARK:- Outlte zone
    
    @IBOutlet weak var lblHeightTop:NSLayoutConstraint!
    @IBOutlet weak var lblWeightTop:NSLayoutConstraint!
    @IBOutlet weak var lblWeightTitle:UILabel!
    @IBOutlet weak var lblHeightTitle:UILabel!
    @IBOutlet weak var txtHeight:UITextField!
    @IBOutlet weak var txtWeight:UITextField!
    @IBOutlet weak var viewHeight:CustomView!
    @IBOutlet weak var viewWidth:CustomView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubTitle:UILabel!
    @IBOutlet weak var lblMeterTitle:UILabel!
    @IBOutlet weak var lblLbsTitle:UILabel!
    @IBOutlet weak var btnContinueTitle:UIButton!
    @IBOutlet weak var lblFtTitle:UILabel!
    @IBOutlet weak var lblKgTitle:UILabel!
    @IBOutlet weak var lblCmTitle:UILabel!
    @IBOutlet weak var lblLbsSubTitle:UILabel!
    @IBOutlet weak var imgBG:UIImageView!
    
    //MARK:- ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(isClickOnViewCart), name: Notification.Name(rawValue: view_cart_notification_key), object: nil)
    }
    
    func setupUI() {
        
        [txtHeight,txtWeight].forEach { txtField in
            _ = textFieldShouldEndEditing(txtField!)
            txtField?.tintColor = app_black_color
        }
      
        lblTitle.text = "FIND MY SIZE".localize().capitalized
        lblSubTitle.text = "Find your personalized size recommendation!".localize()
        lblHeightTitle.text = " \("Your Height".localize().uppercased()) "
        lblWeightTitle.text = " \("Your Weight".localize().uppercased()) "
        lblMeterTitle.text = "ft".localize()
        lblFtTitle.text = "\("ft".localize()) /"
        lblCmTitle.text = "cm".localize()
        lblLbsTitle.text = "kg".localize().lowercased()
        lblLbsSubTitle.text = "lbs".localize().lowercased()
        lblKgTitle.text = "\("kg".localize()) /"
        btnContinueTitle.setTitle("Continue".localize(), for: .normal)
        
        let tapHeight = UITapGestureRecognizer(target: self, action: #selector(viewOnTap(_:)))
        viewHeight.addGestureRecognizer(tapHeight)
        
        let tapWidth = UITapGestureRecognizer(target: self, action: #selector(viewOnTap(_:)))
        viewWidth.addGestureRecognizer(tapWidth)
        
        imgBG.image = imgBGMain
        
        if AppLanuage == SizeItLanguage.Arabic.rawValue {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            [txtWeight,txtHeight].forEach { lbl in
                lbl?.textAlignment = .right
            }
            
            btnContinueTitle.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            btnContinueTitle.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
        
        /*lblTitle.font = themeFont(size: 27, fontname: .aliceR)
        lblSubTitle.font = themeFont(size: 17, fontname: .mavenR)
        
        [lblHeightTitle,lblWeightTitle].forEach { lbl in
            lbl.font = themeFont(size: 12, fontname: .mavenB)
        }
        
        [lblFtTitle,lblCmTitle,lblKgTitle,lblLbsSubTitle].forEach { lbl in
            lbl.font = themeFont(size: 14, fontname: .aliceR)
        }
        
        [lblMeterTitle,lblLbsTitle].forEach { lbl in
            lbl.font = themeFont(size: 18, fontname: .aliceR)
        }
        
        [txtWeight,txtHeight].forEach { lbl in
            lbl.font = themeFont(size: 22, fontname: .aliceR)
        }*/
        
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
    
    @objc func isClickOnViewCart() {
        handlerViewCart()
    }
}

//MARK:- Action Zone

extension NewHeightWeightVC {
    
    @IBAction func btnContinueAction(_ sender:UIButton) {
        if self.txtHeight.text?.isEmpty ?? true {
            showAlert(message: "Please enter height".localize(), vc: self)
        } else if self.txtWeight.text?.isEmpty ?? true {
            showAlert(message: "Please enter width".localize(), vc: self)
        } else {
            param = [String:AnyObject]()
            param = ["height":txtHeight.text as AnyObject,
                     "width":txtWeight.text as AnyObject,
                     "apiKey":apiKey as AnyObject,
                     "userId":kUserId as AnyObject]
            let obj = mainStoryboard.instantiateViewController(withIdentifier: "BodyTypeVC") as! BodyTypeVC
            obj.imgBGMain = imgBGMain
            obj.param = param
            self.navigationController?.pushViewController(obj, animated: true)
        }
        
    }
    
    @IBAction func btnFTAction(_ sender:UIButton) {
        [lblFtTitle,lblKgTitle].forEach { lbl in
            lbl?.textColor = app_theme_text_color
        }
        
        [lblCmTitle,lblLbsSubTitle].forEach { lbl in
            lbl?.textColor = app_theme_second_text_color
        }
        
        lblMeterTitle.text = "ft".localize()
        lblLbsTitle.text = "kg".localize()
    }
    
    @IBAction func btnCMAction(_ sender:UIButton) {
        [lblFtTitle,lblKgTitle].forEach { lbl in
            lbl?.textColor = app_theme_second_text_color
        }
        
        [lblCmTitle,lblLbsSubTitle].forEach { lbl in
            lbl?.textColor = app_theme_text_color
        }
        
        lblMeterTitle.text = "cm".localize()
        lblLbsTitle.text = "lbs".localize()
    }
    
    @IBAction func btnKGAction(_ sender:UIButton) {
        [lblFtTitle,lblKgTitle].forEach { lbl in
            lbl?.textColor = app_theme_text_color
        }
        
        [lblCmTitle,lblLbsSubTitle].forEach { lbl in
            lbl?.textColor = app_theme_second_text_color
        }
        
        lblMeterTitle.text = "ft".localize()
        lblLbsTitle.text = "kg".localize()
    }
    
    @IBAction func btnLBSAction(_ sender:UIButton) {
        [lblFtTitle,lblKgTitle].forEach { lbl in
            lbl?.textColor = app_theme_second_text_color
        }
        
        [lblCmTitle,lblLbsSubTitle].forEach { lbl in
            lbl?.textColor = app_theme_text_color
        }
        
        lblMeterTitle.text = "cm".localize()
        lblLbsTitle.text = "lbs".localize()
    }
    
}

//MARK:- UITextfield Delegate

extension NewHeightWeightVC:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtHeight {
            lblHeightTop.constant = bottompMargin
            lblWeightTop.constant = topMargin
            lblHeightTitle.textColor = app_black_color
            lblWeightTitle.textColor = app_theme_text_color
        } else if textField == txtWeight {
            lblHeightTop.constant = topMargin
            lblWeightTop.constant = bottompMargin
            lblWeightTitle.textColor = app_black_color
            lblHeightTitle.textColor = app_theme_text_color
        }
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == txtHeight {
            lblHeightTop.constant = topMargin
            lblHeightTitle.textColor = app_theme_text_color
        } else if textField == txtWeight {
            lblWeightTop.constant = topMargin
            lblWeightTitle.textColor = app_theme_text_color
        }
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        return true
    }
}
