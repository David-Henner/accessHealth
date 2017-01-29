//
//  ChartsViewController.swift
//  Theux
//
//  Created by Guillaume Wehrling on 19/11/2016.
//  Copyright © 2016 Theux. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    @IBOutlet var chartsView: LineChartView!

    
    var bio: Biometrics!
    var dateHour = ["22/01/17 06h00", "22/01/17 14h00", "22/01/17 20h00", "23/01/17 06h00"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart() {
        self.chartsView.noDataText = "You need to provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< dateHour.count {
            yVals1.append(ChartDataEntry(x: Double(i), y: Double(bio.values[i])))
        }
        
        let set1: LineChartDataSet = LineChartDataSet(values: yVals1, label: bio.name)
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(UIColor.red.withAlphaComponent(0.5))
        set1.setCircleColor(UIColor.red)
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.red
        set1.highlightColor = UIColor.white
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)

        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(dataSets: dataSets)
        data.setValueTextColor(UIColor.white)
     

        /*
        self.chartsView.xAxis.valueFormatter = XValsFormatter(xVals: months)
        self.chartsView.xAxis.axisMinimum = Double(0)
        self.chartsView.xAxis.axisMinimum = Double(months.count)*/
        //5 - finally set our data
        self.chartsView.data = data
        
    }



}

class XValsFormatter: NSObject, IAxisValueFormatter {
    
    let xVals: [String]
    init(xVals: [String]) {
        self.xVals = xVals
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        print(value)
       return xVals[Int(value)]
    }
    
}
