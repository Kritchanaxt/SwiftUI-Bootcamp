//
//  ModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//

//  MARK: "Model"
/*
 
MARK: เป็นส่วนที่เกี่ยวข้องกับข้อมูลและประมวลผลในแอปพลิเคชันโดยทั่วไปแล้วมันจะถูกแยกออกจาก View และ Logic ของแอปพลิเคชัน เพื่อให้โค้ดมีโครงสร้างและรักษาความสะอาด

 Model สามารถเป็นอะไรก็ได้ที่ต้องการการจัดเก็บหรือการประมวลผลข้อมูล เช่น:
 1. Structs และ Classes: สร้างโครงสร้างข้อมูลที่กำหนดเองเพื่อเก็บข้อมูลและประมวลผลข้อมูลในแอปพลิเคชัน เช่น โมเดลของผู้ใช้หรือสินค้า

 2. Enums: ใช้สำหรับการระบุชนิดของข้อมูลหรือสถานะที่จำเป็นสำหรับแอปพลิเคชัน เช่น สถานะของการเชื่อมต่อ Wi-Fi (เช่น connected, disconnected)

 3. Observable Objects: ใช้เพื่อเผยแพร่การเปลี่ยนแปลงของข้อมูลไปยัง View ที่เกี่ยวข้อง เพื่อให้แสดงผลอัพเดตตามเวลา ซึ่งสามารถใช้ได้โดยการใช้ `@Published` attribute

 4. Core Data Entities: ถ้าต้องการจัดเก็บข้อมูลในฐานข้อมูล สามารถใช้ Core Data Entities เพื่อกำหนดโครงสร้างข้อมูลและความสัมพันธ์
 
*/


//MARK: UUID().uuidString
/*
 
MARK: ใช้สำหรับสร้าง UUID (Universally Unique Identifier) โดยที่มีรูปแบบเป็น string ที่ไม่ซ้ำกันทั่วโลก แต่ก็ยังคงเป็น string ที่สามารถอ่านได้ง่าย เช่น "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"

 UUID จะถูกใช้ในหลายที่ เช่น:
 1. การระบุแบบไม่ซ้ำกันของวัตถุหรือข้อมูลในฐานข้อมูล
 2. การสร้าง session ID ในเว็บแอปพลิเคชัน
 3. การจำแนกคีย์หรือไดเรกทอรีในฐานข้อมูล
 
*/

// Identifiable: เป็น protocol ซึ่งใช้เพื่อระบุว่า instance ของประเภทนั้นสามารถระบุตนเองได้ โดยมี property id ที่ใช้เป็นการระบุตัวตนของ instance นั้น ๆ


import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {
    
    @State var users: [UserModel] = [
//        "Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "itsemily1995", followerCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", followerCount: 355, isVerified: true),
        UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.gray)
                            .font(.largeTitle)
                            .frame(width: 35, height: 35)
//                            .overlay(
//                                Circle()
//                                    .fill(Color.green)
//                                    .frame(width: 10, height: 10)
//                                    .shadow(color: .black, radius: 20, x: 0, y: 1),
//                                alignment: .bottomTrailing
//                            )
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
//                            Text("ID:\(user.id)")
//                                .foregroundColor(.gray)
//                                .font(.caption2)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelBootcamp()
}
