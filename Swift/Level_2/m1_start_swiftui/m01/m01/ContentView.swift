//
//  ContentView.swift
//  m01
//
//  Created by Al Pacino on 13.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var opacity = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, World")
            Text("ilya")
                .padding()
        }
        .opacity(opacity)
        .onAppear() {
            let baseAnimation = Animation.easeInOut(duration: 3)
            withAnimation(baseAnimation) {
                opacity = 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
