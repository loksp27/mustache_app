//
//  ContentView.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var cameraManager = CameraManager()

    var body: some View {
        VStack {
            if let layer = cameraManager.previewLayer {
                CameraPreview(previewLayer: layer)
                    .frame(height: 400)
            } else {
                Text("Unable to access the camera.").bold().italic()
            }
            HStack {
                Button("Start Recording") {
                    cameraManager.startRecording()
                }
                .padding()
                .foregroundColor(.green)

                Button("Stop Recording") {
                    cameraManager.stopRecording()
                }
                .padding()
                .foregroundColor(.red)
            }
        }
        .onAppear {
            cameraManager.setupSession()
        }
        TabView {
            VideoRecordingView()
                   .tabItem {
                    Image(systemName: "video.fill")
                    Text("Record")
                  }
           
            SavedVideosView()
             .tabItem {
             Image(systemName: "folder.fill")
             Text("Saved")
             }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    var previewLayer: AVCaptureVideoPreviewLayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//        var body: some View {
//    //        VideoRecordingView()
//    //        TabView {
//    //                   VideoRecordingView()
//    //                       .tabItem {
//    //                           Image(systemName: "video.fill")
//    //                           Text("Record")
//    //                       }
//    //
//    //                   SavedVideosView()
//    //                       .tabItem {
//    //                           Image(systemName: "folder.fill")
//    //                           Text("Saved")
//    //                       }
//    //               }    }
//
//
//}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
