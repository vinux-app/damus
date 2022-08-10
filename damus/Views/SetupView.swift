//
//  SetupView.swift
//  damus
//
//  Created by William Casarin on 2022-05-18.
//

import SwiftUI

func hex_col(r: UInt8, g: UInt8, b: UInt8) -> Color {
    return Color(.sRGB,
                 red: Double(r) / Double(0xff),
                 green: Double(g) / Double(0xff),
                 blue: Double(b) / Double(0xff),
                 opacity: 1.0)
}

let damus_grad_c1 = hex_col(r: 0x1c, g: 0x55, b: 0xff)
let damus_grad_c2 = hex_col(r: 0x7f, g: 0x35, b: 0xab)
let damus_grad_c3 = hex_col(r: 0xff, g: 0x0b, b: 0xd6)
let damus_grad = [damus_grad_c1, damus_grad_c2, damus_grad_c3]

enum SetupState {
    case home
    case create_account
    case login
}

struct DamusGradient: View {
    var body: some View {
        LinearGradient(colors: damus_grad, startPoint: .bottomLeading, endPoint: .topTrailing)
            .edgesIgnoringSafeArea([.top,.bottom])
    }
}

struct SetupView: View {
    @State var state: SetupState? = .home
    @State var info = AppInfo()

    
    var body: some View {
        NavigationView {
            ZStack {
                DamusGradient()
                
                VStack(alignment: .center) {
                    NavigationLink(destination: CreateAccountView(), tag: .create_account, selection: $state ) {
                        EmptyView()
                    }
                    NavigationLink(destination: LoginView(), tag: .login, selection: $state ) {
                        EmptyView()
                    }
                    HStack(alignment: .center){
                        Image("logo-nobg")
                            .resizable()
                            .frame(width: 128.0, height: 128.0, alignment: .center)
                            .padding([.top], 20.0)
                        Text("Damus")
                            .font(Font.custom("Nunito", size: 50.0))
                            .kerning(-2)
                            .foregroundColor(.white)
                        HStack(alignment: .bottom){
                            Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)
                        } // End HStack
                    } // End HStack

                    Spacer()
                    CarouselView()
                        HStack(alignment: .bottom){
                            Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)
                        } // End HStack
                    // Spacer()

                        HStack(alignment: .bottom){
                            Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)
                        } // End HStack

                    DamusWhiteButton("Create Account") {
                        self.state = .create_account
                    }
                        HStack(alignment: .bottom){
                            Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)
                        } // End HStack

                    Button("Login") {
                        self.state = .login
                    }
                    .padding([.top, .bottom], 20)
                    .foregroundColor(.white)
                    // Spacer()

            } // End ZStack
            .padding(.top, -80)
                HStack(alignment: .bottom){
                        Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)

                    } // End HStack

        HStack(alignment: .bottom){
                    Spacer()
            VStack(){
                    // Spacer()
                        Text(String(info!.version)+String(".")+String(info!.build))
                            //Text(verbatim:info!.gitCommitSHA)
                .background(Color.clear)
        }

        } // End HStack
                .background(Color.clear)


        } // End NavigationView
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
        }
        // HStack(alignment: .bottom){
        //             Spacer()
        //     VStack(){
        //             // Spacer()
        //                 Text(String(info!.version)+String(".")+String(info!.build))
        //                     //Text(verbatim:info!.gitCommitSHA)
        //         .background(Color.clear)
        // }
        //             } // End HStack
        //         .background(Color.clear)

    } //End some View
} // End SetupView

func DamusWhiteButton(_ title: String, action: @escaping () -> ()) -> some View {
    return Button(action: action) {
        Text(title)
            .frame(width: 300, height: 50)
            .font(.body.bold())
            .contentShape(Rectangle())
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 4.0)
                    .stroke(Color.white, lineWidth: 2.0)
                    .background(Color.white.opacity(0.15))
            )
    }
                    
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetupView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            SetupView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        }
    }
}

