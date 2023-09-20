import SwiftUI

struct BloomRightView: View {
    var columns: [GridItem] {
        return Array(repeating: .init(.fixed(200)), count: 2)
    }
    var body: some View {
        ZStack {
            Color(red: 191/255, green: 240/255, blue: 168/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 400, height: 70)
                    .background(Color(red: 51/255, green: 90/255, blue: 24/255)
                    )
                    .overlay(
                        Text("BLOOM IT RIGHT")
                            .font(Font.custom("Monoton", size: 32))
                            .foregroundColor(.green)
                            .frame(width: 300, height: 50, alignment: .center)
                        )}
                    .padding(.top, 50)

                LazyVGrid(columns: columns, spacing: 20) {
                    PlantBoxView(plantImage: "bonsai", plantName: "BONSAI", initialTime: 5) // When soil is dry? Try // 5 Days 7200
                    PlantBoxView(plantImage: "monstera_deliciosa", plantName: "MONSTERA DELICIOSA", initialTime: 12960) // 9 Days
                    PlantBoxView(plantImage: "aloe_juvenna", plantName: "ALOE JUVENNA", initialTime: 2) // 7 Days 10080
                    PlantBoxView(plantImage: "aloe_vera", plantName: "ALOE VERA", initialTime: 30240) // 21 Days
                    PlantBoxView(plantImage: "phaseolus_vulgaris", plantName: "PHASEOLUS VULGARIS", initialTime: 3600) // 3 Days
                    PlantBoxView(plantImage: "fitonnia", plantName: "FITONNIA", initialTime: 4320) // 3 Days
                }

                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 351, height: 20)
                    .background(Color(red: 0.26, green: 0.42, blue: 0.12
                    )
                    .overlay(
                        Text("BLOOM ANOTHER DAY")
                            .foregroundColor(.brown)
                            .frame(width: 300, height: 20, alignment: .center)
                    )
                    .padding(.bottom, 99)
            )
            .frame(width: 428, height: 926)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 51/255, green: 90/255, blue: 24/255), lineWidth: 15))
            .edgesIgnoringSafeArea(.all)
        }
    }
    struct BloomRightView_Previews: PreviewProvider {
        static var previews: some View {
            BloomRightView()
        }
    }
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
