//
//  ViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        
       /* + işareti oluşturma*/
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem:UIBarButtonItem.SystemItem.add,target: self,action: #selector (addButtonClicked))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
    
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toUPVC", sender: nil)
    }
                     
                     
                     
                     
                     
}


