//
//  SelectStomachVC.swift
//  Sizeit
//
//  Created by Jaydeep on 13/04/21.
//

import UIKit

class SelectStomachVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSelectStomachTitle: UILabel!
    @IBOutlet weak var lblSelectStomachSubTitle: UILabel!
    @IBOutlet weak var btnFlatter: UIButton!
    @IBOutlet weak var btnAvarage: UIButton!
    @IBOutlet weak var btnRounder: UIButton!
    @IBOutlet weak var imgStomach: UIImageView!
    @IBOutlet weak var btnContinue: CustomButton!

    //MARK: - Variables
    var selectedIndex:Int = 1
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLocalization()
        if selectedStomachIndex != nil {
            self.selectedIndex = selectedStomachIndex!
        }
        
        //Chanage Stomach default selection
        self.changeStomach(index: self.selectedIndex)
        // Do any additional setup after loading the view.
    }
    
    func setLocalization() {
        self.lblTitle.text = "FIND MY SIZE".localize()
        self.lblSelectStomachTitle.text = "Choose the stomach".localize()
        self.lblSelectStomachSubTitle.text = "that most looks like yours".localize()
        self.btnFlatter.setTitle("Flatter".localize(), for: .normal)
        self.btnAvarage.setTitle("Average".localize(), for: .normal)
        self.btnRounder.setTitle("Rounder".localize(), for: .normal)
        self.btnContinue.setTitle("Continue".localize(), for: .normal)
    }
    
    //Chanage Stomach selection
    func changeStomach(index: Int) {
        selectedStomachIndex = index
        self.btnFlatter.setTitleColor(.lightGray, for: .normal)
        self.btnAvarage.setTitleColor(.lightGray, for: .normal)
        self.btnRounder.setTitleColor(.lightGray, for: .normal)
        self.btnFlatter.removeUnderline()
        self.btnAvarage.removeUnderline()
        self.btnRounder.removeUnderline()
        if index == 0 {
            self.imgStomach.image = UIImage(named: "stomach_flatter", in: bundleName, compatibleWith: nil)
            self.btnFlatter.underline()
            self.btnFlatter.setTitleColor(.black, for: .normal)
        }
        else if index == 1 {
            self.btnAvarage.underline()
            self.imgStomach.image = UIImage(named: "stomach_average", in: bundleName, compatibleWith: nil)
            self.btnAvarage.setTitleColor(.black, for: .normal)
        }
        else {
            self.imgStomach.image = UIImage(named: "stomach_rounder", in: bundleName, compatibleWith: nil)
            self.btnRounder.underline()
            self.btnRounder.setTitleColor(.black, for: .normal)
        }
    }
    
    //MARK: - @IBAction
    //Back previous screen
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    //Move to Stomach screen
    @IBAction func btnContinueClicked(_ sender: Any) {
        kBelly = 10
        if #available(iOS 13.0, *) {
            let obj = self.storyboard?.instantiateViewController(identifier: "SelectHipsVC") as! SelectHipsVC
            self.navigationController?.pushViewController(obj, animated: false)
        } else {
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "SelectHipsVC") as! SelectHipsVC
            self.navigationController?.pushViewController(obj, animated: false)
        }
    }
    
    //Close screen
    @IBAction override func btnCloseAction(_ sender:UIButton) {
        self.dismissVC()
    }
    
    //Change Stomach selection
    @IBAction func btnFlatterAction(_ sender:UIButton) {
        self.changeStomach(index: 0)
    }
    
    @IBAction func btnAvarageAction(_ sender:UIButton) {
        self.changeStomach(index: 1)
    }
    
    @IBAction func btnRounderAction(_ sender:UIButton) {
        self.changeStomach(index: 2)
    }
}
