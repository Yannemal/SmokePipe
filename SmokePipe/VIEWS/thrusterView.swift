//
//  thrusterView.swift
//  SmokePipe
//  Stephen deStefano SwiftUI SpriteKit Particle Systems iOS tutorial 3 : thruster Steam
//  Created by yannemal on MON 11DEC2023
//

import SwiftUI
import SpriteKit

struct thrusterView: View {
    //DATA:
    @State private var rocketAndThrustOffset: CGFloat = 0
    
    var body: some View {
    //someVIEW:
        
        ZStack {
            // call SKView and rotate to point fire downwards
            Fire()
                .rotationEffect(Angle(degrees: 180.0))
                .offset(y: 110)
                .offset(x: 0, y: -rocketAndThrustOffset)
            // get size actual screen device
                .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height)
            //  .blendMode(.colorDodge)
            Image("Starship")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 200)
            // same offset as the flame
                .offset(x: 0, y: -rocketAndThrustOffset)
                .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height)

        } // endZstack
        .animation(Animation.linear(duration: 8).repeatForever(autoreverses: false), value: rocketAndThrustOffset)
        .onAppear{
            rocketAndThrustOffset = UIScreen.main.bounds.height * 1.4
        }
    }
    // METHODS:
    
}

struct Fire: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        scene.backgroundColor = UIColor.clear
        guard let fire = SKEmitterNode(fileNamed: "Fire.sks")
                else { return SKView() }
        fire.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        // range of 5 points on X .. you could have a wide rocket with 500
        fire.particlePositionRange = CGVector(dx: 5, dy: 0)
        
        scene.addChild(fire)
        
        view.presentScene(scene)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //code
    }
}

#Preview {
    thrusterView()
}
