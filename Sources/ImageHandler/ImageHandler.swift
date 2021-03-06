//
//  ImageHandler.swift
//
//  Created by Matheus Silva on 27/03/20.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//


import UIKit

public class ImageHandler: NSObject {
    static public let share = ImageHandler()
    private override init() {}
    
    // Picker Image
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    weak var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    
}
