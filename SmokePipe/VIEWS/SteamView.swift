//
//  SteamView.swift
//  SmokePipe
//  Stephen deStefano SwiftUI SpriteKit Particle Systems iOS tutorial 2 : Coffee Steam
//  Created by yannemal on MON 11DEC2023
//

import SwiftUI
import SpriteKit

struct SteamView: View {
    //DATA:
    @State private var pictureAorB : Bool = false
    var body: some View {
        //someVIEW
        
        ZStack {
            Image(pictureAorB ? "drinkingcoffee" : "drinkingcoffeeB")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            
            // add Steam effect
            CoffeeSteam()
                .offset(x: pictureAorB ? 40 : -10, y: pictureAorB ? 90 : 30)
                .scaleEffect(x: pictureAorB ? 1 : 3, y: pictureAorB ? 1: 2)
                .opacity(0.5)
                .blendMode(.colorDodge)
        }
        .onTapGesture {
            pictureAorB.toggle()
        }
        .background(Image("drinkingcoffee").blur(radius: 9.0).offset(x: 390).scaleEffect(0.4))
      
    }
    //METHODS:
    
        
}

// SPRITEKIT: 
struct CoffeeSteam: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 600, height: 800))
        scene.backgroundColor = UIColor.clear
        guard let steam = SKEmitterNode(fileNamed: "Steam.sks")
                else { return SKView() }
        // put steam in the centre of the scene:
        steam.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        // these new params will overwrite the .sks default we set.
        steam.particleBlendMode = .alpha
//        steam.particleScale = 0.01 // initial size
//        steam.particleScaleRange = 0.05  // variation in init size
        scene.addChild(steam)
        view.presentScene(scene)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //code
    }
}

#Preview {
    SteamView()
}
