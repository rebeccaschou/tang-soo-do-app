//
//  DateExtension.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/23/22.
//

import Foundation

extension Date {
    // Following code removes timestamp from date, taken from  https://stackoverflow.com/questions/35392538/remove-time-from-a-date-like-this-2016-02-10-000000
    public var removeTimeStamp : Date? {
       guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
        return nil
       }
       return date
   }
}
