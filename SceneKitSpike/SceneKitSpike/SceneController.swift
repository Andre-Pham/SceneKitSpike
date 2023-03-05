//
//  SceneController.swift
//  SceneKitSpike
//
//  Created by Andre Pham on 5/3/2023.
//

import Foundation
import SceneKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1: Load .obj file
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)

        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)

        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!

        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))

        //ScenekitView.scene = scene
        
        let sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500.0, height: 500.0))
        
//        // 2: Add camera node
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        // 3: Place camera
//        cameraNode.position = SCNVector3(x: 0, y: 10, z: 35)
//        // 4: Set camera on scene
//        scene.rootNode.addChildNode(cameraNode)
//
//        // 5: Adding light to scene
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
//        scene.rootNode.addChildNode(lightNode)
//
//        // 6: Creating and adding ambien light to scene
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light?.type = .ambient
//        ambientLightNode.light?.color = UIColor.darkGray
//        scene.rootNode.addChildNode(ambientLightNode)
//
//        let sceneView = SCNView()
//
//        // If you don't want to fix manually the lights
////        sceneView.autoenablesDefaultLighting = true
//
//        // Allow user to manipulate camera
//        sceneView.allowsCameraControl = true
//
//        // Show FPS logs and timming
//        // sceneView.showsStatistics = true
//
//        // Set background color
//        sceneView.backgroundColor = UIColor.red
//
//        // Allow user translate image
//        sceneView.cameraControlConfiguration.allowsTranslation = false
//
//        // Set scene settings
//        sceneView.scene = scene
        
        self.view.addSubview(sceneView)
        
        print("ADDED")
    }
    
    
}
