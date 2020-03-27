# ImageHandler

This handler is to helper you with your image manager in your projects.

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
