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

    let dollars1 = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
    let dollars2 = [5641.0,2234,8763,4453,4548,6236,7321,3458,2139,399,1311,5612]
    let dollars3 = [6541.0,3456,7843,5678,5877,7323,7111,6456,5143,4562,6311,10412]
    
    let months = ["jan", "fev", "mar", "avr", "mai", "jui", "juil", "aout", "sep", "oct", "nov", "dec"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart() {
        chartsView.noDataText = "You need to provide data for the chart."
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(x: dollars1[i], y: Double(i)))
        }
        
        let set1: LineChartDataSet = LineChartDataSet(values: yVals1, label: "First Set")
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(UIColor.red.withAlphaComponent(0.5))
        set1.setCircleColor(UIColor.red)
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.red
        set1.highlightColor = UIColor.white
        set1.drawCircleHoleEnabled = true
        
        var yVals2 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals2.append(ChartDataEntry(x: dollars2[i], y: Double(i)))
        }
        
        let set2: LineChartDataSet = LineChartDataSet(values: yVals2, label: "Second Set")
        set2.axisDependency = .left // Line will correlate with left axis values
        set2.setColor(UIColor.green.withAlphaComponent(0.5))
        set2.setCircleColor(UIColor.green)
        set2.lineWidth = 2.0
        set2.circleRadius = 6.0
        set2.fillAlpha = 65 / 255.0
        set2.fillColor = UIColor.green
        set2.highlightColor = UIColor.white
        set2.drawCircleHoleEnabled = true
        
        var yVals3 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< months.count {
            yVals3.append(ChartDataEntry(x: dollars3[i], y: Double(i)))
        }
        
        let set3: LineChartDataSet = LineChartDataSet(values: yVals3, label: "Second Set")
        set3.axisDependency = .left // Line will correlate with left axis values
        set3.setColor(UIColor.blue.withAlphaComponent(0.5))
        set3.setCircleColor(UIColor.blue)
        set3.lineWidth = 2.0
        set3.circleRadius = 6.0
        set3.fillAlpha = 65 / 255.0
        set3.fillColor = UIColor.blue
        set3.highlightColor = UIColor.white
        set3.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        dataSets.append(set2)
        dataSets.append(set3)
        
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
