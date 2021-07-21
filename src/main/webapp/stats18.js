/**
 * 
 */
 
 anychart.onDocumentReady(function() {

  // set the data
  var data = [
      {x: "Non-Placed", value: 13},
      {x: "Placed Students", value: 72},
      
  ];

  // create the chart
  var chart = anychart.pie();

  // set the chart title
  chart.title("");

  // add the data
  chart.data(data);

  // display the chart in the container
  chart.container('container');
  chart.draw();

});