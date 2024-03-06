import SwiftUI

struct VideoScreen: View {
    @State private var showTagPopup = false
    @State private var selectedMustache: String? = nil // Assuming you have mustache identifiers

    var body: some View {
        VStack {
            // Placeholder for video feed
            Text("Video Feed Placeholder")
                .frame(width: 300, height: 300)
                .background(Color.gray)
                .cornerRadius(8)
            
            // Mustaches selection
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(["Mustache1", "Mustache2", "Mustache3"], id: \.self) { mustache in
                        Button(action: {
                            self.selectedMustache = mustache
                        }) {
                            Text(mustache)
                        }
                        .padding()
                        .background(self.selectedMustache == mustache ? Color.blue : Color.gray)
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
            
            // Start/Stop recording button
            Button(action: {
                self.showTagPopup.toggle()
            }) {
                Text("Stop Recording")
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .sheet(isPresented: $showTagPopup) {
            TagPopup(isPresented: self.$showTagPopup)
        }
    }
}
#Preview {
    VideoScreen()
}
