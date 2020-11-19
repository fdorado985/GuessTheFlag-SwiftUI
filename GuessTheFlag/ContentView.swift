//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Juan Francisco Dorado Torres on 02/10/20.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = [
    "Estonia", "France", "Germany",
    "Ireland", "Italy", "Nigeria",
    "Poland", "Russia", "Spain",
    "UK", "US"
  ].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var scoreMessage = ""
  @State private var score = 0

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
            .font(.largeTitle)
            .fontWeight(.black)
        }

        ForEach(0 ..< 3) { number in
          Button(
            action: {
              self.flagTapped(number)
            },
            label: {
              FlagImage(flagName: self.countries[number])
            }
          )
        }

        Spacer()

        HStack(spacing: 8.0) {
          Text("Score:")
            .foregroundColor(.white)
            .font(.footnote)
          Text("\(score)")
            .foregroundColor(.white)
            .font(.footnote)
            .fontWeight(.bold)
        }
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(
        title: Text(scoreTitle),
        message: Text(scoreMessage),
        dismissButton: .default(Text("Continue")) {
          self.askQuestion()
        }
      )
    }
  }

  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct 🎉"
      scoreMessage = "You have won 1 point!"
      score += 1
    } else {
      scoreTitle = "Wrong 😢"
      scoreMessage = "That's the flag of \(countries[number])"
      if score > 0 {
        score -= 1
      }
    }

    showingScore = true
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct FlagImage: View {
  let flagName: String

  var body: some View {
    Image(flagName)
      .renderingMode(.original)
      .clipShape(Capsule())
      .overlay(
        Capsule()
          .stroke(
            Color.black,
            lineWidth: 1
          )
      )
      .shadow(color: .black, radius: 2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
