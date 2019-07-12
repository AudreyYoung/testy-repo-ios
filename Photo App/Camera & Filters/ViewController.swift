//
//  ViewController.swift
//  Photo App
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate{
    
    let backgroundImageView = UIImageView()
    
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
    }
    
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "flowerpinkphoto")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func takePhotoPressed(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        imagePickerController.dismiss(animated: true, completion: nil)
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func saveImage(imageName: String){
        guard  let image = myImageView.image
            else{
                return
        }
        
        
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }
    
    
    @IBAction func savePhotoPressed(_ sender: Any) {
        saveImage(imageName: "test.png")
        UIImageWriteToSavedPhotosAlbum(myImageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    @IBAction func filter1Pressed(_ sender: Any) {
        
        guard  let image = myImageView.image
            else{
                return
        }
        
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let cImage = CIImage(image: image)
        filter.setValue(cImage, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),
                               orientation: .right)
        myImageView.image = newImage
        
    }


@IBAction func filter2Pressed(_ sender: Any) {
    guard  let image = myImageView.image
        else{
            return
    }
    
    let context = CIContext()
    let filter = CIFilter(name: "CIVibrance")!
    filter.setValue(2, forKey: kCIInputAmountKey)
    let cImage = CIImage(image: image)
    filter.setValue(cImage, forKey: kCIInputImageKey)
    let result = filter.outputImage!
    let cgImage = context.createCGImage(result, from: result.extent)
    
    let filteredImage = UIImage(cgImage: cgImage!)
    let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),
                           orientation: .right)
    myImageView.image = newImage
}

@IBAction func filter3Pressed(_ sender: Any) {
    guard  let image = myImageView.image
        else{
            return
    }
    
    let context = CIContext()
    let filter = CIFilter(name: "CIBoxBlur")!
    filter.setValue(30, forKey: kCIInputRadiusKey)
    let cImage = CIImage(image: image)
    filter.setValue(cImage, forKey: kCIInputImageKey)
    let result = filter.outputImage!
    let cgImage = context.createCGImage(result, from: result.extent)
    
    let filteredImage = UIImage(cgImage: cgImage!)
    let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),
                           orientation: .right)
    myImageView.image = newImage
}

@IBOutlet weak var myImageView: UIImageView!

}

