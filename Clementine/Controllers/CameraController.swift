//
//  ViewController.swift
//  Clementine
//
//  Created by YAPRYNTSEV Aleksey on 09.10.2020.
//

import UIKit
import AVFoundation

import Vision

class CameraController: UIViewController {

    // MARK: - Output
    var output: (() -> Void)?

    // MARK: - Queue for working with the session
    private let sessionQueue = DispatchQueue(
        label: "ru.clementine.av-session", qos: .userInitiated)

    // MARK: - Main session for module
    var session: AVCaptureSession

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

    init(session: AVCaptureSession) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
        sessionQueue.async { [unowned self] in
            self.configurate(session: session)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    func configurate(session: AVCaptureSession) {

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
            let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
            let model = try? VNCoreMLModel(for: CarDetector().model)
        else {
            return
        }

        let request = VNCoreMLRequest(model: model) { (request, error) in

            guard let results = request.results as? [VNClassificationObservation] else {
                return
            }

            guard let observation = results.first else {
                return
            }

            print(observation.identifier, observation.confidence)
        }

        try? VNImageRequestHandler(
            cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}
