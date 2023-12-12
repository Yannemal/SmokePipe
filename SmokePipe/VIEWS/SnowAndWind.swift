//
//  SnowAndWind.swift
//  SmokePipe
//  Stephen deStefano SwiftUI SpriteKit Particle Systems iOS tutorial 2 : Coffee Steam
//  Created by yannemal on TUE 12DEC2023
//

import SwiftUI
import SpriteKit

struct SnowAndWind: View {
    //DATA:
    var body: some View {
      // someVIEW:
        ZStack {
            Image("christmasmall")
                .resizable()
                .frame(width: 600, height: 800)
                .aspectRatio(contentMode: .fill)
                .offset(y: 100)
            SnowView()
                .ignoresSafeArea()
        }
         .background(Color.gray)
         
        
        
    }
    // METHODS:
}

struct SnowView: UIViewRepresentable {
    // protocol methods
    func makeUIView(context: UIViewRepresentableContext<SnowView>) -> SKView {
        //build scene return view
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        // set up Spritekit scene
        let scene = SKScene(size: CGSize(width: 500, height: 800))
        scene.backgroundColor = UIColor.clear
        // check particles
        guard let snow = SKEmitterNode(fileNamed: "MyParticle.sks")
        else { return SKView() }
        guard let blustery = SKEmitterNode(fileNamed: "Blustery.sks")
        else { return SKView() }
        // custom init particles
        snow.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        snow.particleBirthRate = 50
        snow.particlePositionRange = CGVector(dx: 500, dy: 900)
        blustery.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        blustery.particleBirthRate = 200
        blustery.particlePositionRange = CGVector(dx: 500, dy: 900)
        
        scene.addChild(snow)
        scene.addChild(blustery)
        view.presentScene(scene)
        
        return view
    }

    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<SnowView>) {
        // from SwiftUI to SKView
    }
    
    
}


#Preview {
    SnowAndWind()
}
