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
    var output: (() -> Void)?

    // MARK: - Queue for working with the session
    private let sessionQueue = DispatchQueue(
        label: "ru.clementine.av-session", qos: .userInitiated)

    // MARK: - ML Properties
    @Published private var detections = [VNRecognizedObjectObservation]()

    private let model: VNCoreMLModel
    private lazy var detectionRequest: VNCoreMLRequest = {
        VNCoreMLRequest(model: model) { [weak self] (request, error) in
            if let results = request.results as? [VNRecognizedObjectObservation] {
                results.forEach { print($0.labels) }
            }
        }
    }()

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

    // MARK: - Init
    init(session: AVCaptureSession, model: VNCoreMLModel) {

        self.session = session
        self.model = model

        super.init()

        configurate()

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

    // MARK: - Initial configuration
    private func configurate() {

        detections.publisher
            .map { $0 }
            .sink { object in
                print(object.uuid)
            }
            .store(in: &subscribers)

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

        if let buffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            try? VNImageRequestHandler(cvPixelBuffer: buffer, options: [:])
                .perform([detectionRequest])
        }
    }
}
