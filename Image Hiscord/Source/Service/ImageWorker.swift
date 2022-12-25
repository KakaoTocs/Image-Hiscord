//
//  ImageWorker.swift
//  Image Hiscord
//
//  Created by 김진우 on 2022/10/11.
//

import UIKit
import RxSwift

protocol ImageWorkerProtocol {
    func chooseImage() -> Observable<UIImage?>
    func extractImageMeta(image data: Data) -> Observable<ImageMeta?>
}

final class ImageWorker: ImageWorkerProtocol {
    // MARK: - Property
    let imageMetaDataService: ImageMetaDataServiceProtocol
    
    // MARK: - Init
    init(imageMetaDataService: ImageMetaDataServiceProtocol) {
        self.imageMetaDataService = imageMetaDataService
    }
    
    // MARK: - Interface
    func chooseImage() -> Observable<UIImage?> {
        return .just(nil)
    }
    
    func extractImageMeta(image data: Data) -> Observable<ImageMeta?> {
        return Observable.just(imageMetaDataService.readEXIFDictionary(image: data))
            .map(imageMetaGenerate(_:))
    }
}

extension ImageWorker {
    private func imageMetaGenerate(_ exifDictionary: [String: Any]) -> ImageMeta? {
        return nil
    }
}
