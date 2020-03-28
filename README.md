# ImageHandler  
This **handler** is to helper you with your image manager in your projects.  


## Preview  
<a href="https://ibb.co/6ZxD7vx" target="_blank"><img src="https://i.ibb.co/thtYTZt/preview.gif" alt="preview" border="0" /></a>

## Examples  
- [Serveron Github](https://github.com/MaatheusGois/ImageUpload)

### Usage  

Picker
```swift
import ImageHandler

ImageHandler.share.pickImage(self) { image in
    //image here
}
```  

Upload (save image in jpeg only)
```swift
import ImageHandler

let image = UIImage() //put here your image

ImageHandler.share.uploadRequest(url: "\(url)/upload", 
                                 image: image, 
                                 imageName: "potato.jpeg", 
                                 compression: 0.3, 
                                 filePathKey: "fileUploader") { (response) in
    switch response {
    case .success(let answer):
        print(answer)
    case .error(let description):
        print(description)
    }
}
```  

Download
```swift
import ImageHandler

let url =  "http://localhost:3000/flowersImage.jpeg"

ImageHandler.share.downloadImageFromServerURL(urlString: "") { (response) in
    switch response {
    case .success(let answer):
        //answer is your image
        break
    case .error(let description):
        print(description)
    }
}

```  

## Warning

Don't forget of set the "Privacity Key" in Info.plist:
```
<key>NSCameraUsageDescription</key>
<string></string>

```

And if you test in localhost server, you need desabilite the secure connection:
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```
And when the test moment is finish, enable again o7. 
