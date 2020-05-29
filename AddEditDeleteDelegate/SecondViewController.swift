//
//  SecondViewController.swift
//  AddEditDeleteDelegate
//
//  Created by admin on 2/23/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
protocol passDataDelegate {
    func passData()
}

class SecondViewController: UIViewController {
    @IBOutlet weak var textFierdSecond: UITextField!
    var dataSecond: String?
    var delegate: passDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataSecond != nil {
            textFierdSecond.text = dataSecond
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataSecond = textFierdSecond.text
    }
    
    @IBAction func clickBack() {
        
        // gan textSecond.text cho cai thang dataTongSecond, khi mk viet textSecond.text o class view thi no hieu nhu la cai thang dataTongSecond, khi viết như thế thì nó hiểu đc các câu lệnh của dataTongSecond.
        
        var dataTongSecond = textFierdSecond.text
        if (dataTongSecond?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            
        } else {
            self.delegate?.passData()
        }
        
        
//        guard let dataDelegate = textFierdSecond.text else { return }
//        if dataDelegate.trimmingCharacters(in: .whitespaces).isEmpty {
//        } else {
//            self.delegate?.passData()
//        }
        navigationController?.popViewController(animated: true)
    }
}
