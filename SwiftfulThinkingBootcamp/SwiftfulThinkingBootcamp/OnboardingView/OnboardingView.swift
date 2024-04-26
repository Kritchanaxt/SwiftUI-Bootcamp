//
//  OnboardingView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 23/4/2567 BE.
//

// AnyTransition: เป็นชนิดข้อมูลที่ใช้เพื่อกำหนด transition ของ animation ที่จะใช้เปลี่ยนแปลงระหว่างการแสดงหรือซ่อน view โดยสามารถกำหนด transition ได้ตามต้องการ ซึ่งสามารถใช้งานได้กับ modifier ต่าง ๆ

// extension: คือส่วนที่จะขยายฟังก์ชัน

// text: $name คือ จะทำให้ค่าของ TextField มีค่าเท่ากับค่าของตัวแปร name ที่ถูก binding ซึ่งเมื่อผู้ใช้เปลี่ยนแปลงค่าใน TextField ค่าของตัวแปร name ก็จะถูกอัปเดตโดยอัตโนมัติ และทำให้การแสดงผลเปลี่ยนแปลงตามไปด้วย

// value: $age คือ binding ระหว่าง Slider และตัวแปร age ซึ่งจะทำให้ค่าที่เลือกบน Slider มีค่าเท่ากับค่าของตัวแปร age ซึ่งเมื่อผู้ใช้เลื่อน Slider เพื่อเลือกค่าอายุ ค่าของตัวแปร age ก็จะถูกอัปเดตโดยอัตโนมัติ

// step: 1 คือขนาดของขั้นตอนที่ Slider จะเคลื่อนไป ในที่นี้คือ 1 ปี ซึ่งแปลว่าผู้ใช้สามารถเลือกอายุที่เป็นจำนวนเต็มตั้งแต่ 18 ถึง 100 ปีได้ทีละ 1 ปี

// selection: $gender คือ binding ระหว่าง Picker และตัวแปร gender ซึ่งจะเก็บค่าที่ผู้ใช้เลือก

// label: Text(gender.count > 1 ? gender : "Select a gender") คือ label ที่จะแสดงด้านบนของ Picker โดยถ้าค่าในตัวแปร gender มีความยาวมากกว่า 1 จะแสดงค่าเพศที่เลือกไว้ แต่ถ้ายังไม่มีการเลือกเพศ จะแสดงข้อความ "Select a gender" เป็นข้อความตัวเลือกใน Picker

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    @State var onboardingState: Int = 0 // เก็บค่า state สำหรับการควบคุมสถานะของการเลื่อนหน้า onboarding
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing), // เลื่อนเข้ามาจากด้านขวา
        removal: .move(edge: .leading)) // เลื่อนออกไปทางซ้าย

    
    // onboarding inputs
    @State var name: String = "" // เก็บชื่อของผู้ใช้
    @State var age: Double = 50 // เก็บอายุของผู้ใช้
    @State var gender: String = "" // เก็บเพศของผู้ใช้
    
    // for the alert
    @State var alertTitle: String = "" // เก็บข้อความสำหรับแสดงในหัวเรื่องของ Alert
    @State var showAlert: Bool = false // เก็บสถานะการแสดงหรือซ่อน Alert
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle)) // แสดง Alert ด้วยหัวเรื่องเป็น alertTitle
        })
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}

// MARK: COMPONENTS

extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
            onboardingState == 3 ? "FINISH" :
            "NEXT"
        )
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil) // ปิด animation เมื่อเปลี่ยนสถานะ
            .onTapGesture {
                handleNextButtonPressed() // ส่งการจัดการเมื่อปุ่มถูกแตะ
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer() // สำหรับเว้นช่องว่างด้านบน
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay( // เพิ่มเส้นขีดที่ด้านล่างของข้อความ
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center) // จัดวางข้อความเป็นแนวกึ่งกลาง
        .padding(30)  // เพิ่ม padding ทั้งสี่ด้าน
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name) // เพื่อรับข้อมูลชื่อของผู้ใช้โดยใช้ binding กับตัวแปร name
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30) 
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18...100, step: 1)  // Slider สำหรับเลือกค่าอายุ
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
            Picker(selection: $gender,
                   label:
                    Text(gender.count > 1 ? gender : "Select a gender")
//                    .font(.headline)
//                    .foregroundColor(.purple)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//                    .cornerRadius(10)
                   ,
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            })
            .pickerStyle(MenuPickerStyle())
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            
            Text(gender.count > 1 ? gender : "Select a gender")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)

            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
}

// MARK: FUNCTIONS

extension OnboardingView {
    
    
    func handleNextButtonPressed() {
        
        // CHECK INPUTS
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 😩")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! 😳")
                return
            }
        default:
            break
        }
        
        
        // GO TO NEXT SECTION
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1  // เพิ่มค่า onboardingState โดยใช้ animation effect แบบ spring
            }
        }
    }
    
    func signIn() {
        currentUserName = name // กำหนดค่า currentUserName เป็นค่าที่ผู้ใช้ป้อนใน TextField ชื่อ
        currentUserAge = Int(age) // กำหนดค่า currentUserAge เป็นค่าที่ผู้ใช้เลือกใน Slider อายุ
        currentUserGender = gender // กำหนดค่า currentUserGender เป็นค่าที่ผู้ใช้เลือกใน Picker เพศ
        withAnimation(.spring()) {
            currentUserSignedIn = true // กำหนดค่า currentUserSignedIn เป็น true เพื่อบอกว่าผู้ใช้ลงชื่อเข้าใช้แล้ว
        }
    }

    
    func showAlert(title: String) {
        alertTitle = title // กำหนดข้อความของ Alert
        showAlert.toggle() // เปิดการแสดง Alert
    }
    
    
}
