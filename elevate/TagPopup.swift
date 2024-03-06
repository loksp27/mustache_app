//
//  TagPopup.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//
import SwiftUI

struct TagPopup: View {
    @Binding var isPresented: Bool
    @State private var tag: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter a tag for your recording")
            TextField("Tag", text: $tag)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save") {
                // Here, you would save the recording with the tag
                self.isPresented = false
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
