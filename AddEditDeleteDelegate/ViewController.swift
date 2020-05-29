//
//  ViewController.swift
//  AddEditDeleteDelegate
//
//  Created by admin on 2/23/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var arrayName: [String] = ["mot", "hai"]
    var indexTong: Int?
    var secondvcLocal = SecondViewController()
//    var seconviewcontroller = SecondViewController()
    @IBOutlet weak var noDataFoodter: UIView!
    @IBOutlet weak var haveDataFoodter: UIView!
    var haveNoData: Bool = true {
        didSet {
            if haveNoData == true {
                tableView.tableFooterView = noDataFoodter
            } else {
                tableView.tableFooterView = haveDataFoodter
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        secondvcLocal.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if arrayName.count == 0 {
            haveNoData = true
        } else {
            haveNoData = false
        }
        indexTong = nil
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        cell.textLabel?.text = arrayName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secondvcLocal = (storyboard?.instantiateViewController(identifier: "storyboard") as? SecondViewController)!
            secondvcLocal.dataSecond = arrayName[indexPath.row]
            indexTong = indexPath.row // gan index luc khi mk bam de truyen data, de lay index cuc bo
            navigationController?.pushViewController(secondvcLocal, animated: true)
        secondvcLocal.delegate = self
    }
    
    @IBAction func nextToSecond() {
        secondvcLocal = (storyboard?.instantiateViewController(identifier: "storyboard") as? SecondViewController)!
        navigationController?.pushViewController(secondvcLocal, animated: true)
        secondvcLocal.delegate = self
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        if arrayName.count == 0 {
            haveNoData = true
        } else {
            haveNoData = false
        }
    }
}

extension ViewController: passDataDelegate {
    func passData() {
        if indexTong != nil {
            arrayName[indexTong!] = secondvcLocal.textFierdSecond.text ?? "m"
            
        } else {
            arrayName.append(secondvcLocal.textFierdSecond.text ?? "m")
        }
        tableView.reloadData()
        
//        guard let indexTong1 = tableView.indexPathForSelectedRow else { return }
        
        
    }
}
