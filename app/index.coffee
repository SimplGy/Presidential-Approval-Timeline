
# ChartJS Learnings:
# Labels and data are paried--label count should match data count

data =
  labels: [ ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' ]
  datasets: [
      label: "Approval"
      fillColor: "rgba(220,220,220,0.2)"
      strokeColor: "rgba(220,220,220,1)"
      pointColor: "rgba(220,220,220,1)"
      pointStrokeColor: "#fff"
      pointHighlightFill: "#fff"
      pointHighlightStroke: "rgba(220,220,220,1)"
      data: [65, 59, 80, 81, 56, 55, 40, 10, 20, 20, 20 ]
#    ,
#      label: "Disapproval"
#      fillColor: "rgba(151,187,205,0.2)"
#      strokeColor: "rgba(151,187,205,1)"
#      pointColor: "rgba(151,187,205,1)"
#      pointStrokeColor: "#fff"
#      pointHighlightFill: "#fff"
#      pointHighlightStroke: "rgba(151,187,205,1)"
#      data: [28, 48, 40, 19, 86, 27, 90]
  ]


options =
  pointDot: false
  scaleShowGridLines: false
  animation: false
  scaleLabel: ' '
  scaleBeginAtZero: true # why won't this work?
  scaleLineColor: 'transparent'


ctx = document.getElementsByTagName('canvas')[0].getContext '2d'
lineGraph = new Chart(ctx).Line data, options

