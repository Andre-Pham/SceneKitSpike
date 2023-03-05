//
//  ContentView.swift
//  SceneKitSpike
//
//  Created by Andre Pham on 5/3/2023.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    private let controller = SceneViewController()
    
    var body: some View {
//        SceneView(
//            scene: scene,
//            pointOfView: cameraNode,
//            options: []
//        )
//        .background(.red)
        VStack {
            SceneInjection(controller: self.controller)
                .border(.red)
            
            Button("Start Loop") {
                self.controller.startLoop()
            }
            
            Button("End Loop") {
                self.controller.stopLoop()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
