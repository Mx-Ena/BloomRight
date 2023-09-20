import SwiftUI
struct PlantBoxView: View {
    let plantImage: String
    let plantName: String
    let initialTime: Int
    @State private var timeRemaining: Int
    @State private var isTimerFinished = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    init(plantImage: String, plantName: String, initialTime: Int) {
        self.plantImage = plantImage
        self.plantName = plantName
        self.initialTime = initialTime
        self._timeRemaining = State(initialValue: initialTime)
    }
    var body: some View {
        VStack {
            Image(plantImage)
                .resizable()
                .frame(width: 100, height: 100)
            Text(plantName)
            Text(timeString(time: timeRemaining))
                .foregroundColor(Color(red: 255/255, green: 119/255, blue: 194/255))
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                }
            Button(action: {
                print("Button tapped")
                self.timeRemaining = self.initialTime // reset timer
            }) {
                Text("Water")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .opacity(timeRemaining == 0 ? 1 : 0)
        }
        .background(Color(red: 162/255, green: 212/255, blue: 140/255).edgesIgnoringSafeArea(.all))
    }
    func timeString(time: Int) -> String {
        let hours = time / 3600
        let minutes = time / 60 % 60
        let seconds = time % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
