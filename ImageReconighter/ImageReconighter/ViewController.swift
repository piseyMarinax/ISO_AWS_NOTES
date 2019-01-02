//
//  ViewController.swift
//  ImageReconighter
//
//  Created by mp001 on 9/16/18.
//  Copyright © 2018 mp001. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelResult.isHidden = true
        
        let tapGesture = try? UITapGestureRecognizer(target: self, action: #selector(pickImage))
        imageView.addGestureRecognizer(tapGesture!)
        imageView.isUserInteractionEnabled = true
        
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DetectImage(_ sender: UIButton) {
    }
    
    let imagePicker = UIImagePickerController()
    
    @objc func pickImage()
    {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Lightray", style: .default, handler: {
            (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker,animated: true,completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker,animated: true,completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
            self.present(self.imagePicker,animated: true,completion: nil)
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.imageView.image = image
            self.imagePicker.dismiss(animated: true, completion: nil)
        }
    }
}

