//
//  SceneInjection.swift
//  SceneKitSpike
//
//  Created by Andre Pham on 5/3/2023.
//

import Foundation
import UIKit
import SwiftUI
import SceneKit

struct SceneInjection: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SceneViewController
    private let controller: SceneViewController
    
    init(controller: SceneViewController) {
        self.controller = controller
    }
    
    func makeUIViewController(context: Context) -> SceneViewController {
//        let controller = SceneViewController()
//        controller.setupSceneView()
//        //controller.showRectangle()
//        return controller
        self.controller.setupSceneView()
        return self.controller
    }
    
    func updateUIViewController(_ uiViewController: SceneViewController, context: Context) {
        // Do nothing
    }
    
}

class SceneViewController: UIViewController, SCNSceneRendererDelegate {
    
    private let scene = SCNScene(named: "art.scnassets/ship.scn")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showRectangle() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        self.view.addSubview(view)
    }
    
    func setupSceneView() {
        // 1: Load .obj file
        
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

        

        //ScenekitView.scene = scene
        
        let sceneView = SCNView(frame: CGRect(x: 0.0, y: 0.0, width: 500.0, height: 1000.0))
        
        sceneView.delegate = self
        
        sceneView.scene = scene
        
        sceneView.allowsCameraControl = true
        
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
        
//        sceneView.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = NSLayoutConstraint(item: sceneView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//        let verticalConstraint = NSLayoutConstraint(item: sceneView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
//        let widthConstraint = NSLayoutConstraint(item: sceneView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//        let heightConstraint = NSLayoutConstraint(item: sceneView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//        self.view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

        
        print("ADDED SceneViewController")
    }
    
    func startLoop() {
        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!

        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
    }
    
    func stopLoop() {
        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        ship.removeAllActions()
    }
    
    
}
