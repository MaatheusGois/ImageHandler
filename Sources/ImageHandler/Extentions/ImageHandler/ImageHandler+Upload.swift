//
//  ImageHandler+Upload.swift
//
//  Created by Matheus Silva on 27/03/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

public enum ImageUploadResponse: Error {
    case success(answer: Any)
    case error(description: String)
}

extension ImageHandler {
    public func uploadRequest(url: String,
                       image: UIImage,
                       imageName name: String,
                       compression: CGFloat,
                       filePathKey: String,
                       withCompletion completion: @escaping (ImageUploadResponse) -> Void) {
        
        guard let myUrl = URL(string: url) else {
            completion(ImageUploadResponse.error(description: "Error: invalid URL"))
            return
        }
        
        var request = URLRequest(url: myUrl)
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        guard let imageData = image.jpegData(compressionQuality: compression) else {
            completion(ImageUploadResponse.error(description: "Error: Compression is impossible"))
            return
        }
        
        var body = Data()
        body = createBody(nil , filePathKey, imageData, boundary, name)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                guard let data = data else {
                    completion(ImageUploadResponse.error(description: "Error: Server not work"))
                    return
                }
                
                let response = try JSONSerialization.jsonObject(with: data, options: [])

                guard let res = response as? [String: Any] else {
                    completion(ImageUploadResponse.error(description: "Error: Response not is a JSON"))
                    return
                }
                completion(ImageUploadResponse.success(answer: res))
                
            } catch let error as NSError {
                completion(ImageUploadResponse.error(description: error.localizedDescription))
            }
        }
        task.resume()
    }
    
    private func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    private func createBody(_ parameters: [String: String]?,_ filePathKey: String?,_ imageDataKey: Data,_ boundary: String, _ nameOfImageForToSave:String) -> Data {
        var body = Data()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = nameOfImageForToSave
        let mimetype = "image/jpeg"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        
        
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageDataKey)
        body.appendString("\r\n")
        body.appendString("--\(boundary)--\r\n")
        return body
    }
}
