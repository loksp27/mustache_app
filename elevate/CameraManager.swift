import AVFoundation
import Foundation

class CameraManager: NSObject, ObservableObject, AVCaptureFileOutputRecordingDelegate {
    var captureSession: AVCaptureSession?
    var videoOutput: AVCaptureMovieFileOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?

    override init() {
        super.init()
        self.setupSession()
    }

    func setupSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high

        guard let captureSession = captureSession else { return }

        // Setup video input
        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
              captureSession.canAddInput(videoInput) else { return }
        captureSession.addInput(videoInput)

        // Setup audio input
        guard let audioDevice = AVCaptureDevice.default(for: .audio),
              let audioInput = try? AVCaptureDeviceInput(device: audioDevice),
              captureSession.canAddInput(audioInput) else { return }
        captureSession.addInput(audioInput)

        // Setup video output
        videoOutput = AVCaptureMovieFileOutput()
        if let videoOutput = videoOutput, captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }

        // Setup preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill

        captureSession.startRunning()
    }

    func startRecording() {
        guard let videoOutput = videoOutput else { return }
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let outputPath = documentsDirectory.appendingPathComponent(UUID().uuidString).appendingPathExtension("mov")
        videoOutput.startRecording(to: outputPath, recordingDelegate: self)
    }

    func stopRecording() {
        videoOutput?.stopRecording()
    }

    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print("Error recording video: \(error.localizedDescription)")
        } else {
            print("Video saved: \(outputFileURL)")
            // Optionally, save the video URL to your app's data model if you want to list and play back recordings.
        }
    }
}
