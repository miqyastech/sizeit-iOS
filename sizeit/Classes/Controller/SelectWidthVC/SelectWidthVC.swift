//
//  SelectWidthVC.swift
//  Sizeit
//
//  Created by Piyush on 13/04/21.
//

import UIKit

class SelectWidthVC: UIViewController {
    
    //MARK:- @IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSelectWeightTitle: UILabel!
    @IBOutlet weak var lblSelectWeightSubTitle: UILabel!
    @IBOutlet weak var lblHeightType:UILabel!
    @IBOutlet weak var viewSegment: UIView!
    @IBOutlet weak var btnLBS: UIButton!
    @IBOutlet weak var btnKG: UIButton!
    @IBOutlet weak var ViewWidth: UIView!
    @IBOutlet weak var widthCollectionView: UICollectionView!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnContinue: CustomButton!

    //MARK:- Variables
    var isLBSValue: Bool = false
    var totalValue: Int = 116
    var selectedIndex: Int = 15
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set size default
        self.setLocalization()
        self.widthCollectionView.delegate = self
        self.widthCollectionView.dataSource = self
        self.widthCollectionView.reloadData()
        self.lblHeightType.text = "50" + "kg".localize()
        if widthIndex != nil {
            self.isLBSValue = isLBS
            self.selectedIndex = widthIndex!
            self.showSegment(index:  self.isLBSValue ? 0 : 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.widthCollectionView.scrollToItem(at: IndexPath(row: widthIndex!, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
        else {
            self.showSegment(index: self.isLBSValue ? 0 : 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.widthCollectionView.scrollToItem(at: IndexPath(row: 15, section: 0), at: .centeredHorizontally, animated: false)
            }
        }
        viewSegment.layer.borderColor = colorGray.cgColor
        viewSegment.layer.borderWidth = 2
        viewSegment.layer.cornerRadius = 5
        viewSegment.layer.masksToBounds = true
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        //            self.widthCollectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
        //        }
    }
    
    func setLocalization() {
        self.lblTitle.text = "FIND MY SIZE".localize()
        self.lblSelectWeightTitle.attributedText = "Select your weight".localize().withBoldText(text: "weight".localize())
        self.lblSelectWeightSubTitle.text = "by dragging the ruler horizontally".localize()
        self.btnPrivacy.setAttributedTitle("Privacy Policy".localize().withBoldText(text: "Privacy Policy".localize()), for: .normal)
        self.btnContinue.setTitle("Continue".localize(), for: .normal)
        self.btnLBS.setTitle("LBS".localize(), for: .normal)
        self.btnKG.setTitle("KG".localize(), for: .normal)
    }
    
    //Show segments
    func showSegment(index: Int) {
        self.btnLBS.backgroundColor = .white
        self.btnKG.backgroundColor = .white
        self.btnLBS.setTitleColor(colorGray, for: .normal)
        self.btnKG.setTitleColor(colorGray, for: .normal)
        
        if index == 0 {
            self.btnLBS.backgroundColor = colorGray
            self.btnLBS.setTitleColor(.white, for: .normal)
        }
        else {
            self.btnKG.backgroundColor = colorGray
            self.btnKG.setTitleColor(.white, for: .normal)
        }
    }
    
    //Convert Lbs to kg
    func convertLbsToKg() -> Int {
        return Int(Double(self.selectedIndex + 36) * Double(0.453592))
    }
    
    //MARK:- @IBAction
    //Move to next screen
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    //Remove index
    @IBAction func btnDownClicked(_ sender: Any) {
        if isLBSValue {
            if selectedIndex == 0 {
                return
            }
            self.selectedIndex -= 1
            self.lblHeightType.text = "\(self.selectedIndex + 36)" + "lbs".localize()
        }
        else {
            if selectedIndex == 0 {
                return
            }
            self.selectedIndex -= 1
            self.lblHeightType.text = "\(self.selectedIndex + 35)" + "kg".localize()
        }
        self.widthCollectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    //Increase index
    @IBAction func btnUpClicked(_ sender: Any) {
        if isLBSValue {
            if selectedIndex == 293 {
                return
            }
            self.selectedIndex += 1
            self.lblHeightType.text = "\(self.selectedIndex + 36)" + "lbs".localize()
        }
        else {
            if selectedIndex == 115 {
                return
            }
            self.selectedIndex += 1
            self.lblHeightType.text = "\(self.selectedIndex + 35)" + "kg".localize()
        }
        self.widthCollectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    //Move to next screen
    @IBAction func btnContinueClicked(_ sender: Any) {
//        if !isLBSValue {
//            let weight = (self.selectedIndex + 36)
//            if weight < 35 || weight > 150{
//                showAlert(message: "Please choose weight between 35 to 150 kg".localize(), vc: self)
//                return
//            }
//        }
        kWeight = isLBSValue ? self.convertLbsToKg() : (self.selectedIndex + 36)
        isLBS = self.isLBSValue
        widthIndex = self.selectedIndex
        if #available(iOS 13.0, *) {
            let obj = self.storyboard?.instantiateViewController(identifier: "SelectAgeVC") as! SelectAgeVC
            self.navigationController?.pushViewController(obj, animated: false)
        } else {
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "SelectAgeVC") as! SelectAgeVC
            self.navigationController?.pushViewController(obj, animated: false)
        }
    }
    
    //Move to Privacy screen
    @IBAction func btnPrivacyClicked(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let obj = self.storyboard?.instantiateViewController(identifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
            self.navigationController?.pushViewController(obj, animated: false)
        } else {
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
            self.navigationController?.pushViewController(obj, animated: false)
        }
    }
    
    //Change Segment
    @IBAction func btnSegmentClicked(_ sender: UIButton) {
        if sender == self.btnLBS {
            if self.isLBSValue {
                return
            }
            self.isLBSValue = true
            self.lblHeightType.text = "135" + "lbs".localize()
            self.totalValue = 294
            self.selectedIndex = 99
            self.showSegment(index: 0)
        } else {
            if !self.isLBSValue {
                return
            }
            self.isLBSValue = false
            self.lblHeightType.text = "50" + "kg".localize()
            self.totalValue = 116
            self.selectedIndex = 15
            self.showSegment(index: 1)
        }
        self.widthCollectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.widthCollectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    //Close screen
    @IBAction func btnCloseAction(_ sender:UIButton) {
        self.dismissVC()
    }
}

extension SelectWidthVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK:- CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: collectionView.bounds.width / 2, bottom: 0, right: collectionView.bounds.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.totalValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.widthCollectionView.dequeueReusableCell(withReuseIdentifier: "WidthCell", for: indexPath) as! WidthCell
        if (indexPath.row%4) == 0 {
            cell.viewBig.isHidden = false
            cell.viewSmall.isHidden = true
        } else {
            cell.viewBig.isHidden = true
            cell.viewSmall.isHidden = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 6, height: 115)
    }
    
    //MARK:- ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = widthCollectionView.indexPathForItem(at: widthCollectionView.bounds.center)
        if indexPath == nil {
            return
        }
        self.selectedIndex = indexPath?.row ?? 0
        if isLBSValue {
            self.lblHeightType.text = "\((indexPath?.row ?? 0) + 36)" + "lbs".localize()
        }
        else {
            self.lblHeightType.text = "\((indexPath?.row ?? 0) + 35)" + "kg".localize()
        }
    }
}
