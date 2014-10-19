//
//  ViewController.swift
//  My Album
//
//  Created by Ranjith Nagella on 10/18/14.
//  Copyright (c) 2014 Ranjith Nagella. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagesButtonPresssed(sender: AnyObject) {
        
        var imageViewController = UIImagePickerController()
        imageViewController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imageViewController.delegate = self
        presentViewController(imageViewController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        println("did finish? yes")
        var image = info[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}

