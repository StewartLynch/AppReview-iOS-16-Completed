//
// Created for AppReview-iOS 16
// by Stewart Lynch on 2022-10-13
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("App Info")
                    .font(.largeTitle)
                    .padding()
                GroupBox{
                    Text(
    """
    Created by Stewart Lynch
    CreaTech Solutions
    """)
                    .multilineTextAlignment(.center)
                }
                if AppReviewRequest.showReviewButton,
                   let url = AppReviewRequest.appURL(id: "1407910298") {
                    Link(destination: url) {
                        Text("Write Review")
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Text("")
                }
            }
            .toolbarBackground(
                Color.accentColor,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
