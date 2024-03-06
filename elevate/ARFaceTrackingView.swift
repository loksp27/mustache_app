//
//  ARFaceTrackingView.swift
//  elevate
//
//  Created by Loksubhash Pulivarthi on 3/5/24.
//

import SwiftUI
import ARKit
import SceneKit

struct ARFaceTrackingView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let view = ARSCNView()
        view.delegate = context.coordinator

        // Enable default lighting.
        view.automaticallyUpdatesLighting = true
        
        // Set the session's configuration to track a face.
        let configuration = ARFaceTrackingConfiguration()
        view.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        return view
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {
        // Handle updates here, if necessary.
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARFaceTrackingView

        init(parent: ARFaceTrackingView) {
            self.parent = parent
        }

        func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
            guard let faceAnchor = anchor as? ARFaceAnchor else { return }

            // Check if the mustache node already exists.
            let mustacheNodeName = "mustache"
            let existingNode = node.childNode(withName: mustacheNodeName, recursively: false)
            
            // Create or update the mustache node.
            let mustacheNode: SCNNode
            if let existingNode = existingNode {
                mustacheNode = existingNode
                // Update the node's position or other properties here if needed.
            } else {
                // Assume mustache.scn is the name of your 3D model file.
                let mustacheScene = SCNScene(named: "mustache.scn")!
                mustacheNode = mustacheScene.rootNode.childNodes.first!
                
                mustacheNode.name = mustacheNodeName
                node.addChildNode(mustacheNode)
            }

            // Position the mustache node based on the face anchor.
            // You might need to adjust the position and orientation to match the anchor's points.
            mustacheNode.transform = SCNMatrix4(faceAnchor.transform)
        }
    }
}

#Preview {
    ARFaceTrackingView()
}
