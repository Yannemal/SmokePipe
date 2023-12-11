//
//  EarthOrbitView.swift
//  SmokePipe
//
//  Created by yann guyt on 11/12/2023.
//

import SwiftUI

struct EarthOrbitView: View {
    //DATA:
    
    var body: some View {
        //someVIEW:
        
        ZStack{
            // call rocket view
            thrusterView()
        } //end ZStack
        .background(Image("earth orbit").ignoresSafeArea())
        .offset(y: 95)
        
        
    }
    //METHODS:
    
}

#Preview {
    EarthOrbitView()
}
