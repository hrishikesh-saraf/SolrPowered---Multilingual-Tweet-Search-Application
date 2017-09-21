<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SolrPowered | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="resources/plugins/iCheck/flat/blue.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" type="text/css" href="resources/jqcloud/jqcloud.css" />   
        

 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<header class="main-header">
    <a href="/" class="logo">
      <span class="logo-mini"><b>IR</b>P4</span>
      <span class="logo-lg"><b>SolR</b>Powered</span>
    </a>
    
  </header>
  <!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
            
        <li>
          <a href="/">
            <i class="fa fa-th"></i> <span>Search</span>
            
          </a>
        </li>
        
        <li>
          <a href="/statistics">
            <i class="fa fa-th"></i> <span>Statistics</span>
            
          </a>
        </li>
        
        
        
        
      </ul>
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" style="text-align:center">
      <h1>
        Statistics
        <small></small>
      </h1>
      
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-7">
        
         <!-- DONUT CHART -->
          <div class="box box-danger"style="width: 500px; height: 300px;">
            <div class="box-header with-border" style="text-align:center">
              <h3 class="box-title">Language Distribution For All Tweets</h3>

              <div class="box-tools pull-right">
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <div class="box-body">
              <canvas id="pieChart" style="width: 450px; height: 200px;"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
         <!-- User Mentions -->
          <div class="box box-danger" style="width: 500px; height: 300px;">
            <div class="box-header with-border" style="text-align:center">
              <h3 class="box-title">Tag Cloud For All Tweets</h3>

              <div class="box-tools pull-right">
              </div>
              </div>
          <div id="wordcloud" style="width: 450px; height: 250px;">
            
          </div>
          </div>
          <!-- /.box -->
        
          

         
        </div>
        <!-- /.col (LEFT) -->
        <div class="col-md-3">
            <div class="box box-danger" style="width: 265px; height: 335px;">
            <div class="box-header with-border" style="text-align:center">
              <h3 class="box-title" >Top User Mentions</h3>

              <div class="box-tools pull-right">
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <div class="box-body" style="text-align:center">
               <ul >
    <li1><a target="_blank" href="http://twitter.com/realDonaldTrump">realDonaldTrump</a></li1>
    <li1><a target="_blank" href="http://twitter.com/YouTube">YouTube</a></li1>
    <li1><a target="_blank" href="http://twitter.com/BernieSanders">BernieSanders</a></li1>
    <li1><a target="_blank" href="http://twitter.com/CNN">CNN</a></li1>
    <li1><a target="_blank" href="http://twitter.com/GeorgeTakei">GeorgeTakei</a></li1>
    <li1><a target="_blank" href="http://twitter.com/c0nvey">c0nvey</a></li1>
    <li1><a target="_blank" href="http://twitter.com/HillaryClinton">HillaryClinton</a></li1>
    <li1><a target="_blank" href="http://twitter.com/DrJillStein">DrJillStein</a></li1>
    <li1><a target="_blank" href="http://twitter.com/mike">mike</a></li1>
    <li1><a target="_blank" href="http://twitter.com/FoxNews">FoxNews</a></li1>
    
    
  </ul >
            </div>
            <!-- /.box-body -->
          </div>
      </div>
          
        </div>
        <!-- /.col (RIGHT) -->
        
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

   
  </div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="resources/plugins/chartjs/Chart.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<!-- Sparkline -->
<script src="resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources/plugins/fastclick/fastclick.js"></script>

<!-- AdminLTE App -->

<script src="resources/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->

<script src="resources/dist/js/demo.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/jqcloud/jqcloud-1.0.4.js"></script>         
<!-- page script -->
<style>
ul {
	  list-style-type: none;
	  margin: 0;
	  padding: 0;
	}

	li1 {
	  font: 200 17px/1.5 Helvetica, Verdana, sans-serif;
	  border-bottom: 1px solid #ccc;
	}

	li1:last-child {
	  border: none;
	}

	li1 a {
	  text-decoration: none;
	  color: blue;
	font: 220 45px/1.5 Helvetica, Verdana, sans-serif;
	  -webkit-transition: font-size 0.3s ease, background-color 0.3s ease;
	  -moz-transition: font-size 0.3s ease, background-color 0.3s ease;
	  -o-transition: font-size 0.3s ease, background-color 0.3s ease;
	  -ms-transition: font-size 0.3s ease, background-color 0.3s ease;
	  transition: font-size 0.3s ease, background-color 0.3s ease;
	  display: block;
	  width: 200px;
	}

	li1 a:hover {
	  font-size: 30px;
	  color:orange;
	  background: #f6f6f6;
	}

</style>
<script>
  $(document).ready(function () {
 
		//-------------
		//- PIE CHART -
		//-------------
		// Get context with jQuery - using jQuery's .get() method.
		var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
		var pieChart = new Chart(pieChartCanvas);
		var PieData = [
		  {
			value: 20448,
			color: "#f56954",
			highlight: "#f56954",
			label: "English"
		  },
		  {
			value: 3979,
			color: "#00a65a",
			highlight: "#00a65a",
			label: "French"
		  },
		  {
			value: 3377,
			color: "#f39c12",
			highlight: "#f39c12",
			label: "Spanish"
		  },
		  {
			value: 1962,
			color: "#00c0ef",
			highlight: "#00c0ef",
			label: "German"
		  },
		  {
			value: 1189,
			color: "#3c8dbc",
			highlight: "#3c8dbc",
			label: "Italian"
		  }
		];
		var pieOptions = {
		  //Boolean - Whether we should show a stroke on each segment
		  segmentShowStroke: true,
		  //String - The colour of each segment stroke
		  segmentStrokeColor: "#fff",
		  //Number - The width of each segment stroke
		  segmentStrokeWidth: 2,
		  //Number - The percentage of the chart that we cut out of the middle
		  percentageInnerCutout: 50, // This is 0 for Pie charts
		  //Number - Amount of animation steps
		  animationSteps: 100,
		  //String - Animation easing effect
		  animationEasing: "easeOutBounce",
		  //Boolean - Whether we animate the rotation of the Doughnut
		  animateRotate: true,
		  //Boolean - Whether we animate scaling the Doughnut from the centre
		  animateScale: false,
		  //Boolean - whether to make the chart responsive to window resizing
		  responsive: true,
		  // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		  maintainAspectRatio: true,
		  //String - A legend template
		  
		  

		};
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		pieChart.Doughnut(PieData, pieOptions);
		
        var word_list = [
   	                  {text: "Trump", weight: 1826},
   	                  {text: "trump", weight: 269},
   	                  {text: "MAGA", weight: 226},
   	                  {text: "Taiwan", weight: 193},
   	                  {text: "elinsurgente", weight: 193},
   	                  {text: "NotMyPresident", weight: 152},
   	                  {text: "Brexit", weight: 149},
   	                  {text: "DonaldTrump", weight: 137},
   	                  {text: "news", weight: 137},
   	                  {text: "Recount2016", weight: 131},
   	                  {text: "President", weight: 117},
   	                  {text: "USA", weight: 117},
   	                  {text: "BigData", weight: 113},
   	                  {text: "DALS", weight: 106},
   	                  {text: "DiaInternacionalDiscapacidad", weight: 104},
   	                  {text: "tcot", weight: 100},
   	                  {text: "notmypresident", weight: 97},
   	                  {text: "China", weight: 94},
   	                  {text: "MAGA3X", weight: 84},
   	                  {text: "2A", weight: 84},
   	                  {text: "NRA", weight: 83},
   	                  {text: "LockHerUp", weight: 82},
   	                  {text: "JuveAtalanta", weight: 77},
   	                  {text: "TRUMP", weight: 76},
   	                  {text: "Obama", weight: 75},
   	                  {text: "Jnews", weight: 75},
   	                  {text: "TrampCronaca", weight: 74},
   	                  {text: "jvtblive", weight: 74},
   	                  {text: "TrumpLeaks", weight: 63},
   	                  {text: "Hollande", weight: 55},
   	                  {text: "DirectPR", weight: 52},
   	                  {text: "News", weight: 49},
   	                  {text: "FelizSabado", weight: 46},
   	                  {text: "CNNEE", weight: 44},
   	                  {text: "MakeAmericaGreatAgain", weight: 43},
   	                  {text: "trumpprotest", weight: 42},
   	                  {text: "Aristegui", weight: 42},
   	                  {text: "NotmyPresident", weight: 41},
   	                  {text: "Video", weight: 41},
   	                  {text: "trump2016", weight: 40}
   	                  
   	                ];

             $("#wordcloud").jQCloud(word_list);
  });
</script>

</body>
</html>