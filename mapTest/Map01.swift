//
//  Map01.swift
//  mapTest
//
//  Created by Giovanni Russo on 31/05/22.
//  For Apple Foundation Program

import SwiftUI

import MapKit

enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.84282162142999, longitude: 14.304645339313645)
    
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
}
//    .font(.system(size:60))
let MapLocations = [
    MapLocation(name: "Drinking Fountain", latitude: 40.837208, longitude: 14.306232, fontana: true, point: false, recycle: false, address: "Corso N. Protopisani, 70, 80146 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
    MapLocation(name: "Waste Depot", latitude: 40.89356260547285, longitude: 14.227367128290185, fontana: false, point: false, recycle: true, address: "Via Campano, 80145 Napoli NA", description: "Waste Recycling Depots are a convenient way to throw away the stuff you don't need anymore.", imageName: "recycle"),
    MapLocation(name: "Drinking Fountain", latitude: 40.826329, longitude: 14.205032, fontana: true, point: false, recycle: false, address: "Piazza Italia, 80125 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
    MapLocation(name: "Drinking Fountain", latitude: 40.8321628, longitude: 14.2407789, fontana: true, point: false, recycle: false, address: "Villa Comunale, 80122 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
]

let MapLocationsClass = [
    MaplocClass(name: "Drinking Fountain", latitude: 40.837208, longitude: 14.306232, fontana: true, point: false, recycle: false, address: "Corso N. Protopisani, 70, 80146 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
    MaplocClass(name: "Waste Depot", latitude: 40.89356260547285, longitude: 14.227367128290185, fontana: false, point: false, recycle: true, address: "Via Campano, 80145 Napoli NA", description: "Waste Recycling Depots are a convenient way to throw away the stuff you don't need anymore.", imageName: "recycle"),
    MaplocClass(name: "Drinking Fountain", latitude: 40.826329, longitude: 14.205032, fontana: true, point: false, recycle: false, address: "Piazza Italia, 80125 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
    MaplocClass(name: "Drinking Fountain", latitude: 40.8321628, longitude: 14.2407789, fontana: true, point: false, recycle: false, address: "Villa Comunale, 80122 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "fountain" ),
]

struct Map01: View {
    
    private enum Field: Int, CaseIterable{
        case search
    }
    
    @StateObject private var MapModel = Map01Model() //location service check
    
    @State private var text = "" // search bar
    
    @State private var pincord = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    
    @State var tog = true
    
    @State var isSearching = false // search bar tap check
    
    @State private var selectedPlace: MaplocClass? // used for annotations sheet
    
    @State var latitude01 = 40.837208
    
    @State var longitude01 = 14.306232
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $MapModel.region2, showsUserLocation: true,
                annotationItems: searchResults,
                annotationContent: { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    
                    
                    VStack {
                        
                        if location.fontana {
                            
                            Image(systemName: "drop.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedPlace = location
                                }
                            
                                .sheet(item: $selectedPlace) { location in
                                    VStack{
                                        
                                        HStack {
                                            Text(location.name)
                                                .font(.system(size:30))
                                                .padding()
                                            .foregroundColor(.green)
                                        }
                                        Spacer()
                                        
                                        Image(location.imageName)
                                            .resizable()
                                            .frame(width: 290, height: 290)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                                .shadow(color: .green, radius: 10)
                                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.white, lineWidth: 5))
                                                .foregroundColor(.yellow)
                                               
                                        Spacer()
                                        Text("Address: ")+Text(location.address)
            Spacer()
                                            Group {
                                              
                                                Text(location.description)
                                              
                                            } //group end
                                            .frame(width: 270)
                                            .padding()
                                            
                                            .foregroundColor(.white)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.green, lineWidth: 3))
                                                 
                                            Spacer()
                                            Spacer()
                                        
                                            
                                    }
                                }
                            
                        } else if location.recycle{
                            
                            Image(systemName: "leaf.circle.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedPlace = location
                                }
                            
                                .sheet(item: $selectedPlace) { location in
                                    VStack{
                                        
                                        HStack {
                                            Text(location.name)
                                                .font(.system(size:30))
                                                .padding()
                                            .foregroundColor(.green)
                                        }
                                        Spacer()
                                        
                                            Image(location.imageName)
                                            .resizable()
                                            .frame(width: 290, height: 290)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                                .shadow(color: .green, radius: 10)
                                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.white, lineWidth: 5))
                                                .foregroundColor(.yellow)
                                               
                                        Spacer()
                                        Text("Address: ")+Text(location.address)
            Spacer()
                                            Group {
                                              
                                                Text(location.description)
                                              
                                            } //group end
                                            .frame(width: 270)
                                            .padding()
                                            
                                            .foregroundColor(.white)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.green, lineWidth: 3))
                                                 
                                            Spacer()
                                            Spacer()
                                        
                                            
                                    }// end VStack
                                }
                            
                        } else {
                            
                            Image(systemName: "mappin.circle")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedPlace = location
                                }
                            
                                .sheet(item: $selectedPlace) { location in
                                    VStack{
                                        
                                        HStack {
                                            Text(location.name)
                                                .font(.system(size:30))
                                                .padding()
                                            .foregroundColor(.green)
                                        }
                                        Spacer()
                                        
                                            Image(location.imageName)
                                            .resizable()
                                            .frame(width: 290, height: 290)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                                .shadow(color: .green, radius: 10)
                                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.white, lineWidth: 5))
                                                .foregroundColor(.yellow)
                                               
                                        Spacer()
                                        Text("Address: ")+Text(location.address)
            Spacer()
                                            Group {
                                              
                                                Text(location.description)
                                              
                                            } //group end
                                            .frame(width: 270)
                                            .padding()
                                            
                                            .foregroundColor(.white)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.green, lineWidth: 3))
                                                 
                                            Spacer()
                                            Spacer()
                                        
                                            
                                    }
                                }
                        }
                        
                        
                        Text(location.name)
                            .frame(width: 70, height: 50)
                            
                            
                    }
                }
            })
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            .onAppear{
                MapModel.checkLocation()
            }// check on appear if location service is active
            .alert(isPresented: $MapModel.pd, content: {
                
                Alert(title: Text("Permission denied"), message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Go to Settings"), action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    
                }))
            }) //end Alert popup for locations settings
            
            
            
            //            .padding()
            VStack(alignment: .center){
                
                
                HStack{
                    TextField(" What are you looking for?", text: $text) //search bar
                        .padding(.leading, 24.0)
                        .padding(.horizontal, 24.0)
                    
                }
                
                .padding()
                .background()
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    if !isSearching{
                        isSearching.toggle()}})
                .onSubmit{
                    punta()
                    MapModel.region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude01, longitude: longitude01), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                }
                .submitLabel(.search)
                .overlay(
                    HStack{
                        
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching && text != ""{
                            Button(action: { text = ""}, label: {Image(systemName: "xmark.circle")})
                            
                        }// show delete search text button
                        
                    }.padding(.horizontal, 32) )
                
                
                
                if text != "" && !searchResults.isEmpty {
                    ScrollView{
                        
                        VStack(spacing: 1){
                            ForEach(searchResults){location in
                                
                                Text(location.name)
                                
                                    .fontWeight(.bold)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 50, alignment: .leading)
                                    .onTapGesture {
                                        
                                        MapModel.region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                                        text = ""
                                        
                                    }
                                Text(location.address)
                                    .font(.system(size: 12, weight: .light))
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 50, alignment: .leading)
                                
                                Divider()
                                
                            }
                        }.padding()
                    }.background(Color.white)
                        .opacity(30)
                        .cornerRadius(6)
                    //                        .padding(.bottom, 500.0)
                    
                }
                
                
                
                
                Spacer()
            }//end VStack
            .padding()
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {focusLocation()}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding()
                        
                    })
                }
            }
            
        } //end ZStack
        
    }
    
    var prova: [MapLocation]{
        return MapLocations.filter { $0.fontana == true }
    } //select only fountains
    
    
    
    var searchResults: [MaplocClass] {
        if text.isEmpty {
            return MapLocationsClass
        } else {
            return MapLocationsClass.filter { $0.name.contains(text) }
        }
    }//search a point
    
    func punta(){
        if let idx = searchResults.firstIndex(where: { $0.name.contains(text)}) {
            longitude01 = searchResults[idx].longitude
            latitude01 = searchResults[idx].latitude
        }
    }// center map on the annotation
    
    func focusLocation(){
        MapModel.region2 = MKCoordinateRegion(center: CLLocationManager().location?.coordinate ?? MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
    }// center map on the user location if location service is running
    
}



struct Map01_Previews: PreviewProvider {
    static var previews: some View {
        Map01()
    }
}



final class Map01Model: NSObject, ObservableObject,
                        CLLocationManagerDelegate{
    
    @Published var region2 = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan
    )// Map coordinate
    
    @Published var pd = false
    
    
    
    var locationManager: CLLocationManager?
    
    func checkLocation(){ // check if location service is active
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager=CLLocationManager()
            
            locationManager?.delegate = self //set the delegate
            
            //checkLocationAuthorization() if y dont use the delegate will check only 1 time
            
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            //used ? beacouse y dont know if location service is active
            
            //desiredaccuracy set the precision of the location
            
        }else {
            print("alert turn on the service")
        }
    }
    
    private func checkLocationAuthorization() { //only this metod can call it
        
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined: // case auth is not determined do
            locationManager.requestWhenInUseAuthorization() //request auth
            
        case .restricted: //case auth is restricted
            pd.toggle()
            
        case .denied:
            pd.toggle()
            
        case .authorizedAlways, .authorizedWhenInUse:
            region2 = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //delegate metod
        checkLocationAuthorization()
    }
}
