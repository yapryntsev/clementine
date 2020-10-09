//
//  Camera.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import AVFoundation

final class Camera: UIView {

    // MARK: - Session
    weak var session: AVCaptureSession? {
        didSet {
            previewLayer.session = session
        }
    }

    // MARK: - Layer setup
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    private var previewLayer: AVCaptureVideoPreviewLayer {
        guard let layer = layer as? AVCaptureVideoPreviewLayer else {
            fatalError("Expected `AVCaptureVideoPreviewLayer` layer class.")
        }
        return layer
    }

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        configurate()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configurate()
    }

    private func configurate() {
        previewLayer.videoGravity = .resizeAspectFill
    }
}
