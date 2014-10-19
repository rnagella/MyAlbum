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
    var lastRotation = CGFloat()
    let rotateRec = UIRotationGestureRecognizer()
    let pinchRec = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rotateRec.addTarget(self, action: "rotatedView:")
        pinchRec.addTarget(self, action: "pinchedView:")
        
        imageView.addGestureRecognizer(rotateRec)
        imageView.addGestureRecognizer(pinchRec)
        
        imageView.userInteractionEnabled = true
        imageView.multipleTouchEnabled = true
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

    @IBAction func addLabelButtonPressed(sender: AnyObject) {
        println("add label")
    }
    
    func rotatedView(sender: UIRotationGestureRecognizer) {
        println("rotate view")
        var lastRotation = CGFloat()
//        self.view.bringSubviewToFront(rotateView)
        if(sender.state == UIGestureRecognizerState.Ended){
            lastRotation = 0.0;
        }
        var rotation = 0.0 - (lastRotation - sender.rotation)
        var point = rotateRec.locationInView(imageView)
        var currentTrans = sender.view?.transform
        var newTrans = CGAffineTransformRotate(currentTrans!, rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }
    
    func pinchedView(sender: UIPinchGestureRecognizer) {
        
        sender.view?.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }
}

