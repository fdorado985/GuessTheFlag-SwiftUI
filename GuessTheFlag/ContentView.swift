//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Juan Francisco Dorado Torres on 02/10/20.
//

import SwiftUI

struct ContentView: View {
  @State var countries = [
    "Estonia", "France", "Germany",
    "Ireland", "Italy", "Nigeria",
    "Poland", "Russia", "Spain",
    "UK", "US"
  ].shuffled()
  @State var correctAnswer = Int.random(in: 0...2)
  @State private var showingScore = false
  @State private var scoreTitle = ""

  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [.blue, .black]),
        startPoint: .top,
        endPoint: .bottom
      )
      .edgesIgnoringSafeArea(.all)

      VStack(spacing: 30.0) {
        VStack {
          Text("Tap the flag of:")
            .foregroundColor(.white)

          Text(countries[correctAnswer])
            .foregroundColor(.white)
        }

        ForEach(0 ..< 3) { number in
          Button(
            action: {
              self.flagTapped(number)
            },
            label: {
              Image(self.countries[number])
                .renderingMode(.original)
            }
          )
        }

        Spacer()
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(
        title: Text(scoreTitle),
        message: Text("Your score is ???"),
        dismissButton: .default(Text("Continue")) {
          self.askQuestion()
        }
      )
    }
  }

  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
    } else {
      scoreTitle = "Wrong"
    }

    showingScore = true
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
