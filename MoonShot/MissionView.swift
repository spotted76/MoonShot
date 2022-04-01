//
//  MissionView.swift
//  MoonShot
//
//  Created by Peter Fischer on 3/30/22.
//

import SwiftUI


//struct RoleBadging : ViewModifier {
//    
//    let role : String
//    
//    func body(content: Content) -> some View {
//        if role == "Commander" {
//            content
//                .overlay(
//                    Circle()
//                        .strokeBorder(.green, lineWidth: 2)
//                    )
//        }
//        else {
//            content
//                .overlay(
//                    Circle()
//                        .strokeBorder(.white, lineWidth: 1)
//                    )
//        }
//                    
//    }
//}
//
//extension View {
//    
//    func applyRank(rank : String) -> some View {
//        modifier(RoleBadging(role: rank))
//    }
//}


struct MissionView : View {
    
    let mission : Mission
    let crew: [CrewMember]
    
    var body : some View {
        
        GeometryReader { geometry in
            
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.60)
                        .padding(.top)
                    
                    
                    Text(mission.formattedLaunchDate)
                        .padding()
                        .border(.white, width: 2)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    VStack(alignment: .leading) {
                        
                        HorizontalSpacer()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        HorizontalSpacer()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewMemberDetailView(crew: crew)
                    
                }
                .padding(.bottom)
            }
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else {
                fatalError("Mission \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronats: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronats)
            .preferredColorScheme(.dark)
    }
}
