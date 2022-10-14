//
// Created for AppReview-iOS 16
// by Stewart Lynch on 2022-10-13
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
import SwiftUI
import StoreKit

struct MainView: View {
    @State private var getInfo = false
    @Environment(\.requestReview) var requestReview
    var body: some View {
        NavigationStack {
               Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            .padding()
            .navigationTitle("App Review")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        getInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $getInfo, onDismiss: {
                if AppReviewRequest.requestReview {
                    Task {
                        try await Task.sleep(
                            until: .now + .seconds(1),
                            tolerance: .seconds(0.5),
                            clock: .suspending)
                        requestReview()
                    }
                }
            }) {
                AppInfoView()
                    .presentationDetents([.fraction(0.4)])
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
