//
//  ViewController.swift
//  Instagram
//
//  Created by DeviOS on 14/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagemSelecionada: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.imagemSelecionada.image = image
        
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }

    @IBAction func chamarCamera(sender: UIBarButtonItem) {
        
        println("Foi")
        let imgPick = UIImagePickerController()
        imgPick.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imgPick.allowsEditing = false
        
        imgPick.delegate = self
        self.presentViewController(imgPick, animated: true) { () -> Void in
            
        }
    }
}

