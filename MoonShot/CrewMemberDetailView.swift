//
//  CrewMemberDetailView.swift
//  MoonShot
//
//  Created by Peter Fischer on 3/31/22.
//

import SwiftUI

struct RoleBadging : ViewModifier {
    
    let role : String
    
    func body(content: Content) -> some View {
        if role == "Commander" {
            content
                .overlay(
                    Circle()
                        .strokeBorder(.green, lineWidth: 2)
                    )
        }
        else {
            content
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                    )
        }
                    
    }
}

extension View {
    
    func applyRank(rank : String) -> some View {
        modifier(RoleBadging(role: rank))
    }
}


struct CrewMemberDetailView: View {
    
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.25)
                                    .clipShape(Circle())
                                    .applyRank(rank: crewMember.role)
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewMemberDetailView_Previews: PreviewProvider {

    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var crewMembers : [CrewMember] {
        let mission = missions[0]
        return mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else {
                fatalError("Mission \(member.name)")
            }
        }
    }
    
    
    static var previews: some View {
        CrewMemberDetailView(crew: crewMembers)
    }
}
