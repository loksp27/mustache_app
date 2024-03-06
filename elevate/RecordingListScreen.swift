//
//  RecordingListScreen.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//

import SwiftUI

struct RecordingsListScreen: View {
    let recordings = [Recording(videoPath: "path/to/video1", duration: 120, tag: "Fun"), Recording(videoPath: "path/to/video2", duration: 45, tag: "Vacation")]
    
    var body: some View {
        NavigationView {
            List(recordings) { recording in
                VStack(alignment: .leading) {
                    Text("Tag: \(recording.tag)")
                    Text("Duration: \(recording.duration) seconds")
                }
            }
            .navigationBarTitle("Recordings")
            .navigationBarItems(trailing: NavigationLink(destination: VideoScreen()) {
                Text("New Recording")
            })
        }
    }
}

