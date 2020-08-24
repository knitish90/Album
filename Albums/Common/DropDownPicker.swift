//
//  DropDownPicker_iPhone.swift
//  Landmark
//
//  Created by Nitish.kumar on 12/04/18.
//  Copyright © 2018 Landmark Group. All rights reserved.
//

import Foundation
import UIKit

protocol dropDownPickerViewDelegate : class {
    func didPickerViewRowSelected(_ selectedText : String , index : Int)
}


class DropDownPicker: UIView,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var listPickerView  :   UIPickerView? = nil;
    var listArray       :   [String]!
    
    weak var delegate        :   dropDownPickerViewDelegate?
    var selectedText    :   String!
    
    var lastSelectedText        =   String()
    var lastSelectedIndex       =   Int()
    
    override init(frame: CGRect) {
        super.init(frame:frame);
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showPicker(_ dropDownList : [String] , toView : UIView) {
        
        listArray   =   dropDownList
        
        if(listPickerView == nil ){
            
            let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 44));
            let doneButton:UIBarButtonItem  =   UIBarButtonItem(title: "Done", style: .plain, target: self, action:  #selector(DropDownPicker.onDoneButtonAction))
            
            let flexibleSpace:UIBarButtonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil);
            let fixedeSpace:UIBarButtonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil);
            fixedeSpace.width = 20.0;
            
            let cancelButton    =   UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(DropDownPicker.cancelButtonTapped(_:)))
            toolbar.setItems([fixedeSpace,cancelButton,flexibleSpace,doneButton,fixedeSpace], animated: true);
            self.addSubview(toolbar);
            
            listPickerView = UIPickerView(frame: CGRect(x: 0, y: 44, width: self.frame.size.width, height: 150));
            listPickerView?.delegate    =   self
            listPickerView?.dataSource  =   self
        }
                
        self.addSubview(listPickerView!)
        keyWindow?.addSubview(self)
        
        let sharedApplication:UIApplication = UIApplication.shared
        let viewHeight = sharedApplication.windows[0].frame.size.height
        
        listPickerView?.reloadAllComponents()
        
        self.frame = CGRect(x: 0, y: viewHeight + self.bounds.height, width: self.bounds.width, height: self.bounds.height)
        
        for view in listPickerView!.subviews {
            if (view.bounds.size.height < 2.0 && view.backgroundColor == nil) {
                view.backgroundColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
            }
        }
        
        UIView.animate(withDuration: Double(0.2),animations: {
            self.frame = CGRect(x: 0, y: viewHeight - self.bounds.height , width: self.bounds.width, height: self.bounds.height)
        },completion: { finished in
        })
    }
    
    
    @objc func cancelButtonTapped(_ sender:UIButton) {
        dismissPicker()
    }
    
    func dismissPicker() {
        let sharedApplication:UIApplication = UIApplication.shared
        let viewHeight = sharedApplication.windows[0].frame.size.height
        UIView.animate( withDuration: Double(0.2), animations: {
            self.frame = CGRect(x: 0, y: viewHeight + self.bounds.height, width: self.bounds.width, height: self.bounds.height)
        },completion: { finished in
            if(finished) {
                self.removeFromSuperview()
            }
        })
    }
    
    @objc func onDoneButtonAction(){
        selectedText    =   listArray[listPickerView!.selectedRow(inComponent: 0)]
        delegate?.didPickerViewRowSelected(selectedText, index: (listPickerView?.selectedRow(inComponent: 0))!)
        dismissPicker();
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (listArray[row] ).capitalized
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedText    =   listArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: self.bounds.width - 20, height: 35));
        pickerLabel.textColor = UIColor.black
        if row < listArray.count {
            pickerLabel.text = listArray[row].capitalized
        }
        
        pickerLabel.font = UIFont.systemFont(ofSize: 14.0)
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.lineBreakMode = .byWordWrapping;
        pickerLabel.numberOfLines   =   1
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35.0
    }
}
