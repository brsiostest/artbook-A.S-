//
//  UPViewController.swift
//  SanatKitabi
//
//  Created by BARIŞ AKTÜRK on 11.10.2022.
//

import UIKit

class UPViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        present(picker,animated: true)
        
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
    @IBAction func save(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
