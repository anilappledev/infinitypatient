//
//  BookAppointmentController.swift
//  TelemedPatient
//
//  Created by dr.mac on 24/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import EventKit

class BookAppointmentController: UIViewController,CalendarViewDataSource,CalendarViewDelegate {
  
    @IBOutlet weak var calenderVw: CalendarView!
    
    @IBOutlet weak var HourView: UIView!
    
    @IBOutlet weak var btnHour: UIButton!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var btnBookApp: UIButton!


    @IBOutlet weak var timeTableView: UITableView!
    @IBOutlet weak var viewInfoHeightCon: NSLayoutConstraint!
    
    @IBOutlet weak var lbeMoreInfo: UILabel!
    @IBOutlet weak var lbeDoctorName: UILabel!
    @IBOutlet weak var lbeDoctorSp: UILabel!
    @IBOutlet weak var lbeRew: UILabel!
   
    @IBOutlet weak var lbeLang: UILabel!
    @IBOutlet weak var lbeInfo: UILabel!
    
    @IBOutlet weak var lbeLangData: UILabel!
    @IBOutlet weak var lbeReviewData: UILabel!
    
    
    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    
    var isSelectCell = Bool()
    var selectIndex = Int()
    var isMoreInfo = Bool()
    var dateSelectArray  = [String] ()

    var isClenderSelect = Bool()


    override func viewDidLoad() {
        super.viewDidLoad()
         isMoreInfo = true
         isClenderSelect = true
         lbeMoreInfo.text = "Hide Info"
         addCalender()
        
        if isMoreInfo {
           calenderVw.isHidden = false
           viewInfoHeightCon.constant = 500.0
           HourView.isHidden = true
           btnHour.backgroundColor =  UIColor.clear
           btnDate.backgroundColor =  AppColor.AppPinkRGB
        }
    }
    
    func addCalender(){
        
        dateSelectArray = ["16-11-2019","19-11-2019","9-11-2019","20-11-2019","21-11-2019","24-11-2019","26-11-2019","28-11-2019","29-11-2019"]
        
        CalendarView.Style.cellShape                = .round
        CalendarView.Style.cellColorDefault         = UIColor.clear
        //calenderVw.backgroundColor = UIColor.clear
        //       CalendarView.Style.cellColorToday           = UIColor(red:1.00, green:0.84, blue:0.64, alpha:1.00)
        //       CalendarView.Style.cellSelectedBorderColor  = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        //       CalendarView.Style.cellEventColor           = UIColor(red:1.00, green:0.63, blue:0.24, alpha:1.00)
        CalendarView.Style.headerTextColor  = UIColor(red: 111.00/225.00, green: 191/225.00, blue: 253/225.00, alpha: 1.0)
        CalendarView.Style.cellTextColorDefault     = UIColor.white
        CalendarView.Style.cellTextColorToday       = UIColor.white
        CalendarView.Style.cellTextColorWeekend       = UIColor.white
        CalendarView.Style.cellSelectedColor = AppColor.AppPinkRGB
        //        CalendarView.Style.cellColorToday =  UIColor.red
        CalendarView.Style.cellSelectedBorderColor  = UIColor.clear
        CalendarView.Style.cellBorderColor   = UIColor.white
        CalendarView.Style.cellBorderWidth = 1

        CalendarView.Style.firstWeekday             = .monday
        
        
        CalendarView.Style.locale                   = Locale(identifier: "en_US")
        
        CalendarView.Style.timeZone                 = TimeZone(abbreviation: "UTC")!
        
        calenderVw.dataSource = self
        calenderVw.delegate = self
        
        calenderVw.direction = .horizontal
        
        
        calenderVw.multipleSelectionEnable = false
        calenderVw.marksWeekends = true
        
        calenderVw.headerView.nextButton.addTarget(self, action: #selector(BookAppointmentController.nextMonth), for: .touchUpInside)
        calenderVw.headerView.prevButton.addTarget(self, action: #selector(BookAppointmentController.previousMonth), for: .touchUpInside)
        
        self.calenderVw.bookedSlotDate = dateSelectArray
        self.calenderVw.collectionView.reloadData()


    }
    @objc func nextMonth(sender: UIButton)
    {
        self.calenderVw.goToNextMonth()
    }
    
    @objc func previousMonth(sender: UIButton)
    {
        self.calenderVw.goToPreviousMonth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let today = Date()
        
        var tomorrowComponents = DateComponents()
        tomorrowComponents.day = 0
        
        
        let tomorrow = self.calenderVw.calendar.date(byAdding: tomorrowComponents, to: today)!
        self.calenderVw.selectDate(tomorrow)
        
        #if KDCALENDAR_EVENT_MANAGER_ENABLED
        self.calendarView.loadEvents() { error in
            if error != nil {
                let message = "The karmadust calender could not load system events. It is possibly a problem with permissions"
                let alert = UIAlertController(title: "Events Loading Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        #endif
        
        
        self.calenderVw.setDisplayDate(today)
        
        //        self.datePicker.locale = CalendarView.Style.locale
        //        self.datePicker.timeZone = CalendarView.Style.timeZone
        //        self.datePicker.setDate(today, animated: false)
    }
    
    // MARK : KDCalendarDataSource
    
    func startDate() -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = -2
        
        let today = Date()
        
        let threeMonthsAgo = self.calenderVw.calendar.date(byAdding: dateComponents, to: today)!
        
        return threeMonthsAgo
    }
    
    func endDate() -> Date {
        
        var dateComponents = DateComponents()
        
        dateComponents.year = 2
        let today = Date()
        
        let twoYearsFromNow = self.calenderVw.calendar.date(byAdding: dateComponents, to: today)!
        
        return twoYearsFromNow
        
    }
    
    // MARK : KDCalendarDelegate
    
    func calendar(_ calendar: CalendarView, didSelectDate date : Date, withEvents events: [CalendarEvent]) {
        
        print("Did Select: \(date) with \(events.count) events")
        for event in events {
            print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
        }
        
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date : Date) {
        
        //        self.datePicker.setDate(date, animated: true)
    }
    
    
    func calendar(_ calendar: CalendarView, didLongPressDate date : Date, withEvents events: [CalendarEvent]?) {
        
//        if let events = events {
//            for event in events {
//                print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
//            }
//        }
//
//        let alert = UIAlertController(title: "Create New Event", message: "Message", preferredStyle: .alert)
//
//            alert.addTextField { (textField: UITextField) in
//            textField.placeholder = "Event Title"
//        }
//
//        let addEventAction = UIAlertAction(title: "Create", style: .default, handler: { (action) -> Void in
//            let title = alert.textFields?.first?.text
//            //            self.calenderVw.addEvent(title!, date: date)
//        })
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//
//        alert.addAction(addEventAction)
//        alert.addAction(cancelAction)
//
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    func calendar(_ calendar : CalendarView, canSelectDate date : Date) -> Bool{
        let weekday = Calendar.current.component(.weekday, from: date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let dateStr = formatter.string(from: date)
        if dateSelectArray.contains(dateStr){
            return true
        }
        return false
    }
    
     @IBAction func DateShow(_ sender: Any) {
        HourView.isHidden = true
        btnDate.backgroundColor = AppColor.AppPinkRGB
        
        btnDate.layer.borderWidth = 0

        btnHour.backgroundColor = UIColor.clear
        btnHour.layer.borderWidth = 1
        btnHour.layer.borderColor = UIColor.white.cgColor
        
        isClenderSelect = true
        isSelectCell = false
        

     }
    
    @IBAction func HourShow(_ sender: Any) {
        
        HourView.isHidden = false
        self.view.bringSubviewToFront(HourView)
        btnHour.backgroundColor =  AppColor.AppPinkRGB
        btnHour.layer.borderWidth = 0

        btnDate.backgroundColor = UIColor.clear
        btnDate.layer.borderWidth = 1
        btnDate.layer.borderColor = UIColor.white.cgColor
        
        isClenderSelect = false
        isSelectCell = false
        timeTableView.reloadData()


    }
    
     @IBAction func MoreInfo(_ sender: Any) {
        
        if isMoreInfo {
            viewInfoHeightCon.constant = 280.0
            isMoreInfo = false
            calenderVw.isHidden = true
            HourView.isHidden = true
            btnHour.isHidden = true
            btnDate.isHidden = true
            lbeMoreInfo.text = "More Info"

        }
        else{
            viewInfoHeightCon.constant = 500.0
            isMoreInfo = true
            calenderVw.isHidden = false
            if isClenderSelect{
                HourView.isHidden = true

            }
            else{
                HourView.isHidden = false

            }
            btnHour.isHidden = false
            btnDate.isHidden = false
            lbeMoreInfo.text = "Hide Info"

        }
    }
    
    
    
    @IBAction func Booking(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConfirmBookingController") as! ConfirmBookingController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    @IBAction func Close(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}


//MARK: - TableViewDataSource Delegate
extension BookAppointmentController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 4
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            guard let timeSlotCell = tableView.dequeueReusableCell(withIdentifier: "TimeSlotCell", for: indexPath) as? TimeSlotCell else {
                return TimeSlotCell()
            }
            timeSlotCell.selectionStyle = .none
        
            if isSelectCell {
            
                if selectIndex == indexPath.row{
                   timeSlotCell.timeView.backgroundColor = AppColor.AppPinkRGB
                   timeSlotCell.timeView.layer.borderWidth = 0
                }
                else{
                    timeSlotCell.timeView.backgroundColor = UIColor.clear
                    timeSlotCell.timeView.layer.borderWidth = 1
                    timeSlotCell.timeView.layer.borderColor = UIColor.white.cgColor
                }
            }
            else{
                timeSlotCell.timeView.backgroundColor = UIColor.clear
                timeSlotCell.timeView.layer.borderWidth = 1
                timeSlotCell.timeView.layer.borderColor = UIColor.white.cgColor
        }
            return timeSlotCell
        
        
    }
    
    
}
//MARK: - TableViewDelegate Delegate
extension BookAppointmentController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        isSelectCell = true
        selectIndex = indexPath.row
        timeTableView.reloadData()
       
    }
}
