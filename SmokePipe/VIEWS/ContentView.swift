//
//  ContentView.swift
//  SmokePipe
//  Stephen deStefano SwiftUI SpriteKit Particle Systems iOS tutorial 1
//  Created by yannemal on MON 11DEC2023
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    //DATA:
    
    var body: some View {
        //someVIEW:
        
        ZStack {
       Image("inspector")
                .resizable()
                .frame(width: 350, height: 350)
            SmokeView()
                .offset(x: -115, y: 100)
        }
        .background(Image("backgroundpurple").opacity(0.6))
        
    }
    //METHODS:
}

// smoke particle sks
struct SmokeView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<SmokeView>) -> SKView {
        //    Creates the view object and configures its initial state.
        //    Required for Protocol
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        // if transparancy needed set to clear
        view.backgroundColor = .clear
        // build Spritekitscene
        let scene = SKScene(size: CGSize(width: 800, height: 1000))
        // if transparancy needed set to clear
        scene.backgroundColor = UIColor.clear
        guard let smoke = SKEmitterNode(fileNamed: "Smoke.sks")
                  else { return SKView() }
        // if loaded correctly then customise further parameters of Particle:
        smoke.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        smoke.particleBlendMode = .screen
        smoke.particleScale = 0.01
        smoke.particleScaleRange = 0.05
        // particle node set up then add to scene in the View
        scene.addChild(smoke)
        // build view usinge Spritekit method
        view.presentScene(scene)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<SmokeView>) {
        //    Updates the state of the specified view with new information from SwiftUI.
        //    Required for Protocol
        
    }
}

#Preview {
    ContentView()
}
