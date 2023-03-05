//
//  ContentView.swift
//  SceneKitSpike
//
//  Created by Andre Pham on 5/3/2023.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var scene = SCNScene(named: "MyScene")
            
    var cameraNode: SCNNode? {
        scene?.rootNode.childNode(withName: "camera", recursively: false)
    }
    
    var body: some View {
//        SceneView(
//            scene: scene,
//            pointOfView: cameraNode,
//            options: []
//        )
//        .background(.red)
        VStack {
            SceneInjection()
                .border(.red)
            
            Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
