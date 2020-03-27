//
//  Data.swift
//
//  Created by Matheus Silva on 27/03/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

extension Data {
    mutating func appendString(_ string: String) {
        let data = string.data(
            using: String.Encoding.utf8,
            allowLossyConversion: true)
        append(data!)
    }
}
