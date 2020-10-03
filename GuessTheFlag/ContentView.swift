//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Juan Francisco Dorado Torres on 02/10/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.red
        .edgesIgnoringSafeArea(.all)
      
      Text("Your content")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
