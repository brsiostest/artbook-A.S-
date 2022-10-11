//
//  UPViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit
import CoreData

class UPViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var choosenPainting = ""
    var chosenPaintingId  : UUID?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
     
        if choosenPainting != "" {
            
            // veriyi aktarma
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!) // ???????
            fetchRequest.returnsObjectsAsFaults = false
            do{
                let results = try context!.fetch(fetchRequest)
                if results.count > 0{
                    
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String{
                            nameText.text = name}
                        if let artist = result.value(forKey: "artist") as? String{
                            artistText.text = artist
                        }
                        if let year = result.value(forKey: "year") as? String{
                            yearText.text = year
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data:imageData)
                            selectImage.image = image
                        }
                        
                    }
                    
        
                    
                }
                
            }catch{
                print("error")
            }
                
            
            
        }
        
        
        
        
        
        
        
        
        
        // görsel tıklmayı açma
        selectImage.isUserInteractionEnabled = true
        let imageRecognizer = UITapGestureRecognizer(target: self, action:  #selector(chooseImage))
        selectImage.addGestureRecognizer(imageRecognizer)
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboarfOff))
        view.addGestureRecognizer(gestureRecognizer)
    }

    // galeriden foto seçme
    @objc func chooseImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker,animated: true)
        saveButton.isEnabled = true
        
    }
    
    // galeriden çıkma
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
   // keyboard off
    @objc func keyboarfOff(){
        view.endEditing(true)
    }
    @IBAction func save(_ sender: Any) { // veriyi kaydetme
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Entitye ulama
        let newPaintings = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPaintings.setValue(nameText.text, forKey: "name")
        newPaintings.setValue(artistText.text, forKey: "artist")
        
        if let year = Int(yearText.text!){
            newPaintings.setValue(year, forKey: "year")
        }
        
        newPaintings.setValue(UUID(), forKey: "id")
        
        let data = selectImage.image!.jpegData(compressionQuality: 0.5)
        newPaintings.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("success")
        }catch{
            print("error")
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
