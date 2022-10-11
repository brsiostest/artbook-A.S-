//
//  UPViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit

class UPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func save(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
