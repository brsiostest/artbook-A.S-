//
//  UPViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit

class UPViewController: UIViewController {

    
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
   
    @IBAction func save(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
