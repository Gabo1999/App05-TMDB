//
//  RateView.swift
//  App05-TMDB
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

struct RateView: View {
    
    var rating: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.55)
                .foregroundColor(Color.black)
                .frame(width: 70, height: 70)
            Circle()
                .trim(from: 0.0, to : CGFloat(min(rating / 100 , 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(ScoreColor(rating: rating))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 70, height: 70)
                .animation(.linear)
            Text(String(format: "%.0f %%", min(rating, 100.0)))
                .font(.body)
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func ScoreColor(rating: Double) -> Color {
        if rating >= 80 {
            return Color.green
        } else {
            if rating >= 60 {
                return Color.yellow
            } else {
                return Color.red
            }
        }
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(rating: 90.0)
    }
}
