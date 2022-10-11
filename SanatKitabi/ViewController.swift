//
//  ViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem:UIBarButtonItem.SystemItem.add,target: self,action: #selector (addButtonClicked))
    }
    
    
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toUPVC", sender: nil)
    }
                     
                     
                     
                     
                     
}


