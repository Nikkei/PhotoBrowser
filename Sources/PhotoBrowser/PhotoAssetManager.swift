//
//  PhotoAssetManager.swift
//  PhotoBrowser
//
//  Created by tamanyan on 4/6/17.
//

import UIKit

class PhotoAssetManager {
    static func image(_ named: String) -> UIImage? {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle(for: PhotoAssetManager.self)
        #endif
        return UIImage(named: "PhotoBrowser.bundle/\(named)", in: bundle, compatibleWith: nil)
    }
}
