//
//  HomeView.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/10/23.
//

import SwiftUI

struct CoursesView: View {

    @EnvironmentObject var  coursesViewModel: CoursesViewModel
    var body: some View {
        VStack {
            Text("Number of videos \(coursesViewModel.videos.count)")
            if coursesViewModel.videos.count > 0 {
                Text("Title is \(coursesViewModel.videos[0].title )")
                Text("Thumbnail is \(coursesViewModel.videos[0].thumbnail)")
            }
            }
            .task {
                do{
                    print("Initializing courses view model")
                    try await coursesViewModel.initializeVideos()
                }catch{

                }
        }
    }
}

#Preview {
    CoursesView()
}
