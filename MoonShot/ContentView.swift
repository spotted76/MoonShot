//
//  ContentView.swift
//  MoonShot
//
//  Created by Peter Fischer on 3/28/22.
//

import SwiftUI



struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    @State private var showingList = false
    
    var body: some View {
        
        NavigationView {
            Group {
                if showingList == false {
                    MainViewTable(astronauts: astronauts, missions: missions)
                }
                else {
                    MainViewList(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    Button(showingList == false ? "List View" : "Table View") {
                        withAnimation {
                            showingList.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
