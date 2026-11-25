import SwiftUI
import UIKit

struct ContentView: View {
    @State private var taps = 0

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "iphone.gen3")
                .font(.system(size: 64))
                .foregroundStyle(.tint)

            Text("Unsigned .ipa works")
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text("\(UIDevice.current.systemName) \(UIDevice.current.systemVersion) · \(UIDevice.current.model)")
                .font(.footnote)
                .foregroundStyle(.secondary)

            Button("Tap me: \(taps)") {
                taps += 1
            }
            .buttonStyle(.borderedProminent)

            Text("Собрано на GitHub Actions macOS runner, подписано на устройстве.")
                .font(.caption)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .padding(24)
    }
}

#Preview {
    ContentView()
}
