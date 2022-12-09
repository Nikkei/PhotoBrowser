//
//  PhotoImage.swift
//  PhotoBrowser
//
//  Created by tamanyan on 4/6/17.
//

import UIKit
import VisionKit

open class PhotoImage: ImageAnalysisInteractionDelegate {
    open fileprivate(set) var image: UIImage?
    open fileprivate(set) var imageURL: URL?
    open fileprivate(set) var videoURL: URL?
    open fileprivate(set) var isEnabledAnalyzer: Bool
    open var text: String

    // MARK: - Initialization

    public init(image: UIImage, text: String = "", videoURL: URL? = nil, isEnabledAnalyzer: Bool = false) {
        self.image = image
        self.text = text
        self.videoURL = videoURL
        if #available(iOS 16.0, *) {
            self.isEnabledAnalyzer = isEnabledAnalyzer
        } else {
            self.isEnabledAnalyzer = false
        }
    }

    public init(imageURL: URL, text: String = "", videoURL: URL? = nil, isEnabledAnalyzer: Bool = false) {
        self.imageURL = imageURL
        self.text = text
        self.videoURL = videoURL
        if #available(iOS 16.0, *) {
            self.isEnabledAnalyzer = isEnabledAnalyzer
        } else {
            self.isEnabledAnalyzer = false
        }
    }

    open func addImageTo(_ imageView: UIImageView, completion: ((_ image: UIImage?) -> Void)? = nil) {
        if let image = image {
            imageView.image = image
            if #available(iOS 16.0, *) {
                Task {
                    try? await self.analyze(imageView, image: image)
                }
            }
            completion?(image)
        } else if let imageURL = imageURL {
            PhotoConfig.loadImage(imageView, imageURL) { error, image in
                if #available(iOS 16.0, *) {
                    Task {
                        guard let image else { return }
                        try? await self.analyze(imageView, image: image)
                    }
                }
                completion?(image)
            }
        }
    }

    @available(iOS 16, *)
    @MainActor
    func analyze(_ imageView: UIImageView, image: UIImage) async throws {
        guard isEnabledAnalyzer && ImageAnalyzer.isSupported else { return }
        let interaction = ImageAnalysisInteraction()
        interaction.preferredInteractionTypes = .automatic
        imageView.addInteraction(interaction)
        interaction.delegate = self
        let configuration = ImageAnalyzer.Configuration([.text, .machineReadableCode])
        let analyzer = ImageAnalyzer()
        let analysis = try await analyzer.analyze(image, configuration: configuration)
        interaction.analysis = analysis
    }
}
