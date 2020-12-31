//
//  AboutView.swift
//  swiftUI-hw1
//
//  Created by mariam alfoudari on 27/12/2020.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("KUWAIT CITY")
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                    
                Text("Mostly cloudy")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)

                VStack(spacing: 0){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical)
                        .frame(width: 174.0, height: 125.0)
                    
                    Text("25°")
                        .font(.system(size: 50, weight: .medium))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                      
    
                }
                
                HStack(alignment: .center, spacing: 14.0){
                    WeatherTimeView(timeOfWeek: "Now",
                                    imageName: "cloud.sun.fill",
                                    temperature: 25)
                    WeatherTimeView(timeOfWeek: "12AM",
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 20)
                    WeatherTimeView(timeOfWeek: "1PM",
                                    imageName: "cloud.heavyrain.fill",
                                    temperature: 17)
                    WeatherTimeView(timeOfWeek: "2PM",
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 15)
                    WeatherTimeView(timeOfWeek: "3PM",
                                    imageName: "cloud.sun.bolt.fill",
                                    temperature: 13)
                    WeatherTimeView(timeOfWeek: "4PM",
                                    imageName: "sunset.fill",
                                    temperature: 10)
                    WeatherTimeView(timeOfWeek: "5PM",
                                    imageName: "cloud.moon.rain.fill",
                                    temperature: 3)
                }
                .padding(4.0)
            VStack(){
                    WeatherDayView(DayOfWeek: "Sunday",
                                   imageName: "cloud.rain.fill",
                                   temperature: 17)
                    WeatherDayView(DayOfWeek: "Monday",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 6)
                    WeatherDayView(DayOfWeek: "Tuesday" ,
                                   imageName: "sun.max.fill",
                                   temperature: 10 )
                    WeatherDayView(DayOfWeek: "Wednesday",
                                   imageName: "snow",
                                   temperature: 16)
                    WeatherDayView(DayOfWeek: "Thursday",
                                   imageName: "smoke.fill",
                                   temperature: 20)
                }
                
            }
            
        }
    }
}
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

struct WeatherTimeView: View {
    var timeOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(timeOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {
    var DayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 80){
        HStack{
            Text(DayOfWeek)
                .font(.system(size: 20))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 40)
            Spacer()
            Text("\(temperature)°")
                .font(.system(size: 27, weight: .medium))
                .foregroundColor(.white)
        
        }
        .padding()
    }
        
}
}
