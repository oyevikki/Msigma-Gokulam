//
//  ContentView.swift
//  Msigma Gokulam
//
//  Created by Vikash on 09/11/23.
//

import SwiftUI

struct HomePageView: View {
    var featuredCoursesList: [Int] = [1,2,3,4,5,6]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TopView()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.91, green: 0.96, blue: 1.0), .clear]), startPoint: .top, endPoint: .bottom))
                    ResumeView()
                        .padding(.top, 10)
                    ExploreCoursesView()
                        .padding(.top, 10)
                    
                    LazyVGrid(columns: [GridItem(spacing: 16), GridItem(spacing: 16)], spacing: 16) {
                        ForEach(featuredCoursesList, id: \.self) { branch in
                            FeaturedView()
                                .padding()
                        }
                    }

                }
                
            }
            .ignoresSafeArea()
        }
    }
}

struct TopView: View {
    
    var body: some View {
        VStack(alignment: .center,spacing: 50){
            HStack{
                VStack(alignment: .leading){
                    Text("Hey Shwet!")
                        .font(.system(size: 16, weight: .bold))
                      .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    Spacer()
                    Text("Let’s learn something new today")
                      .font(Font.custom("Inter", size: 12))
                      .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                }
                .padding(.leading, 25)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image("search")
                    .foregroundColor(.clear)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .cornerRadius(20)
                })
                .padding(.trailing, 16)
                
                Button(action: {
                    
                }, label: {
                    Image("bell")
                    .foregroundColor(.clear)
                    .frame(width: 40, height: 40)
                    .background(.white)

                    .cornerRadius(20)
                })
                .padding(.trailing, 25)
            }
            Image("QueriesImage")
                .shadow(radius: 2)
        }
        .padding(.top, 64)
        
    }
}

struct ResumeView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Resume from where you left")
              .font(
                Font.custom("Inter", size: 14)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
            
            HStack{
                VStack(alignment: .leading){
                    Text("Z Transform using EQN I")
                        .font(.system(size: 14, weight: .bold))
                      .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                    Text("Digital Signal Processing")
                      .font(Font.custom("Inter", size: 12))
                      .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                      .padding(.top, 4)
                    
                    Text("9mins left")
                      .font(
                        Font.custom("Inter", size: 12)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0.92, green: 0.59, blue: 0.15))
                      .padding(.top, 4)
                }
                Spacer()
                Image("TeacherImage")
            }
            .padding(.leading, 16)
            .background(.white)
            .foregroundColor(.clear)
            .cornerRadius(10)
            .shadow(color: Color(red: 0.2, green: 0.27, blue: 0.34).opacity(0.1), radius: 10, x: 0, y: 4)
            
        }
        .padding(.horizontal, 25)
        
    }
}

struct ExploreCoursesView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            HStack {
                Text("Explore courses")
                    .font(.system(size: 14, weight: .medium))
                  .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
                Spacer()
                Text("see all")
                  .font(Font.custom("Inter", size: 14))
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
            }
            .padding(.horizontal, 25)
            VStack {
                HStack(spacing: 10){
                    CardView(courseName: "B.tech", courseImage: "engineering-icon", percentOff: 0)
                    CardView(courseName: "UPSE", courseImage: "upsc", percentOff: 5)
                }
                HStack(spacing: 10){
                    CardView(courseName: "ISRO", courseImage: "isro-icon", percentOff: 20)
                    CardView(courseName: "GATE", courseImage: "bsc", percentOff: 15)
                }
            }
            .frame(width: screenWidth * 0.95)
        }
    }
}

struct CardView: View {
    var courseName: String
    var courseImage: String
    var percentOff: Int
    @State var showBrachesScreen: Bool = false
    var body: some View {
        Button(action: {
            showBrachesScreen = true
        }, label: {
            ZStack {
                if percentOff > 0 {
                    VStack {
                        Text("\(percentOff)% OFF")
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundColor(Color(red: 0.92, green: 0.59, blue: 0.15))
                    }
                    .frame(width: 70,height: 30)
                    .background(Color(red: 1, green: 0.94, blue: 0.85))
                    .cornerRadius(10)
                    .padding(.leading, 110)
                    .padding(.bottom, 75)
                }
                VStack(alignment: .leading) {
                HStack {
                    Image("\(courseImage)")
                    Text("\(courseName)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(red: 0.04, green: 0.33, blue: 0.5))
                    Spacer()
                }
                .padding(.leading, 16)
                HStack{
                    Image("personImage")
                    Text("2.4K Enrolled")
                        .font(Font.custom("Inter", size: 10))
                        .foregroundColor(Color(red: 0.15, green: 0.53, blue: 0.75))
                }
                .padding(.leading, 16)
            }
                NavigationLink(destination: BranchesView(), isActive: $showBrachesScreen) {
                    EmptyView()
                }
        }
            .foregroundColor(.clear)
            .frame(height: 95)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 0.2, green: 0.27, blue: 0.34).opacity(0.1), radius: 10, x: 0, y: 4)
            
        })
        
    }
    
}

struct FeaturedView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            Image("teacherImage2")
            Text("B.TECH • ECE")
              .font(Font.custom("Inter", size: 10))
              .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
              .frame(width: 86.47773, height: 12.50769, alignment: .topLeading)
            
            Text("Digital Signal Processing")
              .font(
                Font.custom("Inter", size: 14)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
            
            Text("By Hari Krishna")
              .font(Font.custom("Inter", size: 10))
              .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
            
            Text("₹749 ₹1299")
              .font(
                Font.custom("Inter", size: 12)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.18, green: 0.18, blue: 0.18))
        }
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
