//
//  GridViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 26/4/2567 BE.
//

/*
 
 MARK: .gridCellAnchor:
 - เมธอดที่ใช้กำหนดจุดยึดของเซลล์ในกริด เช่น `.leading`, `.center`, `.trailing`
 ซึ่งจะกำหนดให้เซลล์ยึดอยู่ที่ด้านซ้ายสุด ตรงกลาง หรือด้านขวาสุดของกริดตามลำดับ

 MARK: .gridCellColumns:
 - เมธอดที่ใช้กำหนดจำนวนคอลัมน์ของเซลล์ในกริด ซึ่งจะมีผลกับการแสดงผลขนาดของเซลล์ในกริด 
 ในกรณีที่มีการกำหนดเงื่อนไขเพิ่มเติม เช่นการกำหนดให้เซลล์เป็นครึ่งของขนาดปกติหรือไม่

 MARK: .gridColumnAlignment:
  -เมธอดที่ใช้กำหนดการจัดวางเซลล์ในกริดในแนวนอน ซึ่งจะมีผลกับการจัดวางเซลล์ตามแนวแถว 
 โดยสามารถกำหนดให้เซลล์ยึดมาที่ด้านซ้ายสุด `.leading`, ตรงกลาง `.center`, หรือด้านขวาสุด `.trailing` ได้

 
 */

import SwiftUI

struct GridViewBootcamp: View {
    var body: some View {
        
        // สร้าง Grid โดยกำหนดการจัดวางแนวตั้งและแนวนอนให้เป็นกึ่งกลาง พร้อมกับระยะห่างในแนวนอนและแนวตั้งเป็น 8 พิกเซล
        Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
            
            // ใช้การวนลูปสร้างแถวของ Grid โดยใช้ดัชนีของแถว (rowIndex) เริ่มต้นจาก 0 ถึง 3
            ForEach(0..<4) { rowIndex in
                
                //  สร้างแถวของ Grid โดยกำหนดการจัดวางแนวนอนเป็นด้านล่าง (alignment: .bottom)
                GridRow(alignment: .bottom) {
                    ForEach(0..<4) { columnIndex in
                        
                        //คำนวณหมายเลขของเซลล์โดยใช้ตำแหน่งของแถวและคอลัมน์
                        let cellNumber = (rowIndex * 4) + (columnIndex + 1)
                        
                        if cellNumber == 7 {
                            EmptyView()
                        } else {
                            
                            //สร้างเซลล์โดยใช้ฟังก์ชัน cell(int:) และส่งหมายเลขของเซลล์เข้าไปเพื่อให้กำหนดค่าแต่ละเซลล์
                            cell(int: cellNumber)
                            
                                // กำหนดจำนวนคอลัมน์ที่เซลล์จะครอบได้โดยใช้เงื่อนไข หากหมายเลขเซลล์เท่ากับ 6 จะมีคอลัมน์ 2 แต่ถ้าไม่เท่าจะมีคอลัมน์ 1
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                            
                                //  กำหนดจุดยึดของเซลล์ให้เป็นด้านขวา (trailing)
                                .gridCellAnchor(.trailing)
                            
                                // กำหนดการจัดวางแนวนอนของเซลล์ในคอลัมน์โดยใช้เงื่อนไขเช่นกัน ตามหมายเลขของเซลล์ที่กำหนด
                                .gridColumnAlignment(
                                    cellNumber == 1 ? .trailing :
                                    cellNumber == 4 ? .leading : .center
                                )
                        }
                    }
                }
            }
        }
        
//        Grid() {
//            GridRow {
//                cell(int: 1)
//                cell(int: 2)
//                cell(int: 3)
//            }
//            
//            Divider()
//                .gridCellUnsizedAxes(.horizontal)
//            
//            GridRow {
//                cell(int: 4)
//                cell(int: 5)
//            }
//        }
    }
    private func cell(int: Int) -> some View {
        Text("\(int)")
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
    }
}

#Preview {
    GridViewBootcamp()
}
