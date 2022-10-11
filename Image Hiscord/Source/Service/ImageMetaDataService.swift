//
//  ImageMetaDataService.swift
//  Image Hiscord
//
//  Created by 김진우 on 2022/10/11.
//

import Foundation
import ImageIO

protocol ImageMetaDataServiceProtocol {
    func getEXIFDictionary(image data: Data) -> [String: Any]
}

final class ImageMetaDataService: ImageMetaDataServiceProtocol {
    func getEXIFDictionary(image data: Data) -> [String: Any] {
        var result: [String: Any] = [:]
        if let cgImageSource = CGImageSourceCreateWithData(data as CFData, nil),
           let properties = CGImageSourceCopyPropertiesAtIndex(cgImageSource, 0, nil) as? [String: Any],
           let exif = properties["{Exif}"],
           let dictionary = exif as? [String: Any] {
            result = dictionary
            dump(dictionary)
        }
        return result
    }
}
