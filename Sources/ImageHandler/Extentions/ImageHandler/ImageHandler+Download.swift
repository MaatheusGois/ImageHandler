//
//  DownloadImage.swift
//
//  Created by Matheus Gois on 27/03/20.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

public enum ImageDownloadResponse: Error {
    case success(answer: UIImage)
    case error(description: String)
}

extension ImageHandler {
    public func downloadImageFromServerURL(urlString url: String, withCompletion completion: @escaping (ImageDownloadResponse) -> Void) {
        let urlReplaced = url.replacingOccurrences(of: " ", with: "%20")
        
        guard let myUrl = URL(string: urlReplaced) else {
            completion(ImageDownloadResponse.error(description: "Error: invalid URL"))
            return
        }
        
        let request = URLRequest(url: myUrl)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                completion(ImageDownloadResponse.error(description: error.localizedDescription))
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                if let image = UIImage(data: data!) {
                    completion(ImageDownloadResponse.success(answer: image))
                } else {
                    completion(ImageDownloadResponse.error(description: "Error: impossible convert data"))
                }
            })
            
        }
        task.resume()
    }
}
