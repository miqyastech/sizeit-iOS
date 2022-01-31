//
//  PrivacyPolicyVC.swift
//  Sizeit
//
//  Created by Jaydeep on 13/04/21.
//

import UIKit

class PrivacyPolicyVC: UIViewController {
   
    //MARK:- @IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc1: UILabel!
    @IBOutlet weak var lblDesc2: UILabel!
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLocalization()
    }
    
    func setLocalization() {
        self.lblTitle.text = "FIND MY SIZE".localize()
        self.lblDesc1.text = "Privacy_Desc1".localize()
        self.lblDesc2.text = "Privacy_Desc2".localize()
    }
    
    //MARK:- @IBAction
    //Back previous screen
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
  
    //Close screen
    @IBAction override func btnCloseAction(_ sender:UIButton) {
        self.dismissVC()
    }
}
