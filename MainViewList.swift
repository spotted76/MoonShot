//
//  MainViewList.swift
//  MoonShot
//
//  Created by Peter Fischer on 4/1/22.
//

import SwiftUI

struct MainViewList: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        //                                .padding()
                        
                        HStack {
                            Text(mission.displayName)
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.leading, 15)
                            Spacer()
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                                .padding(.trailing, 15)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct MainViewList_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MainViewList(astronauts: astronauts, missions: missions)
    }
}
