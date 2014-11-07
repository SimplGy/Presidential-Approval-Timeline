


ivl = setInterval ->
  if window.elPresidente
    clearInterval ivl
    init window.elPresidente
, 500

init = (data) ->
  data = parse(data)
  console.log data[0]

  graphConfig = [
    title: "Approval Rating (0-100)"
    fillAlphas: .2
    valueField: 'approval'
    bullet: 'round'
    bulletSize: 4
    bulletAlpha: 1
#    bulletBorderAlpha: 1
#    bulletBorderColor: 'white'
#    bulletBorderThickness: 1
#      labelText: '[[value]]'
#      lineColor: 'indianred'
    lineColor: 'cornflowerblue'
    lineThickness: 1.5
#    ,
#      valueField: 'unsure'
  ]



  options =
    type: 'serial'
    theme: 'none'
    rotate: true
    dataProvider: data[0...2000]
    categoryField: 'time'
    color: '#333'
    creditsPosition: 'bottom-right'
#    handDrawn: true
#    handDrawScatter: 1
#    handDrawThickness: 0

    # http://docs.amcharts.com/javascriptcharts/CategoryAxis
    valueAxes: [
#      position: top
      axisAlpha: 0
      gridAlpha: 0
      labelsEnabled: false
    ]
    categoryAxis:
      autoGridCount: true
      axisAlpha: 0 # hide the left line
      gridAlpha: 0.03
#      axisThickness: 0.001
#      axisColor: 'white'

      parseDates: true # too sparse when set true
      dateFormats:[
        period:'DD'
        format:'DD'
      ,
        period:'WW'
        format:'YYYY MMM DD'
      ,
        period:'MM'
        format:'YYYY MMM DD'
      ,
        period:'YYYY'
        format:'YYYY MMM DD'
      ]
      boldPeriodBeginning: false
#      equalSpacing: true
      fontSize: 10

#    legend:
#      useGraphSettings: true
#      markerSize: 12
#      valueWidth: 0
#      verticalGap: 0

#    legendValueText: '[[category]] [[value]]'

    # http://docs.amcharts.com/3/javascriptcharts/ChartCursor
#    chartCursor:
#      valueLineEnabled: true # crosshairs
#    zoomable: false

#    valueAxes: [{
#      minorGridAlpha: 0.08
#      minorGridEnabled: true
#      position: top
#      axisAlpha: 0
#    }]
    graphs: graphConfig
#    categoryAxis:
#      gridPosition: 'start'

  chart = AmCharts.makeChart 'AmChart', options
  # chart.addGraph(graph) # http://docs.amcharts.com/3/javascriptcharts/AmSerialChart


# Given some descriptive data, flatten it into
parse = (raw) ->
  parsed = _.flatten raw
  parsed.reverse()
  for d in parsed
    d.time = new Date d.start
  parsed

