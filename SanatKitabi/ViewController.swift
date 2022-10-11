//
//  ViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   
    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]() // table view için
    var idArray = [UUID]()
    
    var selectedPainting = ""
    var selectedPaintingsId : UUID?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
  
       /* + işareti oluşturma*/
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem:UIBarButtonItem.SystemItem.add,target: self,action: #selector (addButtonClicked))
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
       nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        getData()
    }
    
    
    func getData(){ // veriyi çekme
        
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelagate.persistentContainer.viewContext
        
        // istek oluşturma
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false // ?????
        
        do{
            let results  = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "name") as? String{
                    self.nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID{
                    self.idArray.append(id)
                }
                
                self.tableView.reloadData()
            }
            
            
        }catch{
            print("error")
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
 
        
        

    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toUPVC", sender: nil)
    }
                     

                     
                     
                     
}


