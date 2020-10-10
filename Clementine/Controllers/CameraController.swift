//
//  ViewController.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import Combine
import AVFoundation

import Vision

class CameraController: Controller {

    // MARK: - Output
    @Published var output: UIImage?

    // MARK: - Queue for working with the session
    private let sessionQueue = DispatchQueue(
        label: "ru.clementine.av-session", qos: .userInitiated)

    private let model: VNCoreMLModel

    // MARK: - View Model
    private let viewModel: CameraModel

    // MARK: - Main session for module
    private let session: AVCaptureSession

    // MARK: - Setup view as Camera
    override func loadView() {
        view = Camera()
    }

    private var cameraView: Camera {
        guard let view = view as? Camera else {
            fatalError("Expected Camera instance")
        }
        return view
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    // MARK: - Init
    init(session: AVCaptureSession, mlModel: VNCoreMLModel, viewModel: CameraModel) {

        self.session = session
        self.viewModel = viewModel
        model = mlModel

        super.init()

        sessionQueue.async { [unowned self] in
            self.configurate(session: session)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.session = session
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sessionQueue.async { [unowned self] in
            self.session.startRunning()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sessionQueue.async { [unowned self] in
            self.session.stopRunning()
        }
    }

    private func configurate(session: AVCaptureSession) {

        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }

        session.beginConfiguration()

        if let input = try? AVCaptureDeviceInput(device: captureDevice),
            session.canAddInput(input) {
            session.addInput(input)
        }

        let output = AVCaptureVideoDataOutput()
        let queue = DispatchQueue(label: "ru.clementine.av-session.output")
        output.setSampleBufferDelegate(self, queue: queue)

        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        session.commitConfiguration()
    }
}

extension CameraController: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {

        guard
            let buffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        else {
            return
        }

        let ciImage = CIImage(cvImageBuffer: buffer).oriented(.right)

        let mlRequest = VNCoreMLRequest(model: model) {
            [weak self, ciImage] (request, error) in

            guard
                let results = request.results as? [VNRecognizedObjectObservation],
                let observation = results.first,
                observation.confidence > 0.75
            else {
                return
            }

            let bounding = observation.boundingBox

            let x = bounding.origin.x * ciImage.extent.size.width
            let width = bounding.width * ciImage.extent.size.width
            let height = bounding.height * ciImage.extent.size.height
            let y = ciImage.extent.size.height * (1 - bounding.origin.y) - height
            let rect = CGRect(x: x, y: y, width: width, height: height)

            let croppedImage = ciImage.cropped(to: rect)

            let image = UIImage(ciImage: croppedImage)

            self?.output = UIImage(ciImage: ciImage)
        }

        try? VNImageRequestHandler(
            cvPixelBuffer: buffer, orientation: .right, options: [:]).perform([mlRequest])
    }
}
