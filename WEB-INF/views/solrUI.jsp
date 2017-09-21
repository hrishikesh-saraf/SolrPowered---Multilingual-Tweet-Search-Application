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
	<style>
           /* Dropdown Button */
.dropbtn {
    background-color: #374850;
    color: white;
    padding: 12px;
    font-size: 12px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #666;
    min-width: 160px;
    box-shadow: 0px 4px 8px 0px rgba(0,0,0,0.1);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: white;
    padding: 8px 12px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #666}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    
    background-color: #367fa9;

}
</style> 

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <a href="/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>IR</b>P4</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>SolR</b>Powered</span>
    </a>
    
  </header>
 <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
            
        
        <li>
          <a href="/">
            <i class="fa fa-th"></i> <span>Home</span>
            
          </a>
        </li>
        <li>
          <a href="/statistics">
            <i class="fa fa-th"></i> <span>Statistics</span>
            
          </a>
        </li>
        </ul>
        <ul style="color:#fff" style="text:align:center">
 <a>Language Filter</a> 
  <li>English <input style="color:#fff"type="checkbox"name="English"id="en"  onchange="dosearch()"/></li>
  <li>Spanish <input style="color:#fff" type="checkbox"  name="Spanish" id="es"  onchange="dosearch()"/></li>
  <li>French  <input style="color:#fff" type="checkbox" name="French" id="fr"  onchange="dosearch()"/></li>
  <li>German  <input style="color:#fff" type="checkbox" name="German" id="de"  onchange="dosearch()"/></li>
  <li>Italian <input style="color:#fff" type="checkbox" name="Italian" id="it"  onchange="dosearch()"/></li>
  </ul> 
        
        
      
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Search
       </h1>
      <div style="text-align:right" id="google_translate_element"></div>
    </section>

    <section  style="min-height: 1200px; padding: 15px; margin-right: auto; margin-left: auto;padding-left: 15px; padding-right: 15px" >
      <div class="row">
        <!-- Left col -->
        
        <section class="col-lg-7 connectedSortable" >
        <table>
        <tr>
        <td>
        <div class="sidebar-form" style="width:470px" style="align:left">
        <div class="input-group">
    		<input type="text" name="searchQuery" class="form-control" id="searchbox" placeholder="Speak" />
    		<div class="input-group-btn">
    		<img onclick="startDictation()" class="btn btn-secondary" src="//i.imgur.com/cHidSVu.gif" />
  			</div>
  			<div class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
            </div>
             </div>
        
        </div>
        </td>
        <td>

        <div class="dropdown">
        <a class="dropbtn" >Speech Language</a>
        <div class="dropdown-content" >
         <a onclick="startDictation2()" href="#" >Spanish</a>
         <a onclick="startDictation3()" href="#">German</a>
         <a onclick="startDictation4()" href="#">French</a>
         <a onclick="startDictation5()" href="#">Italian</a>
        </div>
        </div>
        </td>
        </tr>
     
       
             
       </table>
       
        <div class="row" id ="results"  style="padding: 15px; margin-right: auto; margin-left: auto;padding-left: 15px; padding-right: 15px" >
        	
        </div>
        </section >

        <section class="col-lg-5 connectedSortable">
          <div id=pieParent class="box box-danger" style="width: 500px; height: 300px; ">
            <div class="box-header with-border">
              <h3 class="box-title">Language Distribution</h3>

              <div class="box-tools pull-right">
              </div>
            </div>
<!--             <div class="box-body" id="pieContainer"> -->
<%--               <canvas id="pieChart" style="height:250px"></canvas> --%>
<!--             </div> -->
            <!-- /.box-body -->
            <div id="piechart_3d" style="width: 400px; height: 300px;"></div>
          </div>
          <div id ="jQparent" class="box box-danger" style="width: 500px; height: 300px; display:none">
            <div class="box-header with-border">
              <h3 class="box-title">Word Cloud</h3>

              <div class="box-tools pull-right">
              </div>
              </div>
          <div id="wordcloud" style="width: 500px; height: 254px;">
            
          </div>
          </div>
        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->
	  
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
<script src="resources/plugins/chartjs/Chart.js"></script>
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
<!-- HTML5 Speech Recognition API -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Search Form -->



<script>

$(document).ready(function(){
	$("#jQparent").hide();
	$("#pieParent").hide();
	$("#search-btn").click(function(){
		var checkedArray=[];
		checkedArray[0]=checkedArray[1]=checkedArray[2]=checkedArray[3]=checkedArray[4]="undefined";
		var search_val = $('#searchbox').val();
		//var checked="";
		if($('#en').is(':checked'))
			checkedArray[0]="en";
		if($('#es').is(':checked'))
			checkedArray[1]="es";
		if($('#fr').is(':checked'))
			checkedArray[2]="fr";
		if($('#de').is(':checked'))
			checkedArray[3]="de";
		if($('#it').is(':checked'))
			checkedArray[4]="it";
			$.ajax({
					type: "POST",
					url : "/ajaxcontroller",
					data : {searchVal:search_val,checked:checkedArray},
					success : function(returndata){
						var wholedata = jQuery.parseJSON(returndata);
						var en_count=wholedata.en_count;
						var es_count=wholedata.es_count;
						var fr_count=wholedata.fr_count;
						var it_count=wholedata.it_count;
						var de_count=wholedata.de_count;
						$("#results").empty();
						$("#results").append('<div style="font-size:14px;color:#999">'+wholedata.numFound+' tweets returned</div><br>');
						$.each(wholedata.tweets, function (index, item) {
							$("#results").append('<div><img src='+item.user_img+'></img><span style="font-size:17px;color:#367fa9">'+item.user_name+'</span><span style="font-size:14px;color:#999"> @'+item.user_screenname+'</span></div>');
							$("#results").append('<div style="font-size:12px;color:#999">'+item.tweet_date+'</div>');
							$("#results").append('<div style="font-size:14px;color:#000000">'+item.tweet_text+'</div><br>');	
						});
						
						 //Google pie chart
						 
						 
						google.charts.load("current", {packages:["corechart"]});
    	                google.charts.setOnLoadCallback(function() {
    	    
    	                $(function() {
    	                	console.log("inside draw chart");
    	                var data = google.visualization.arrayToDataTable([
    	                                                                  ['Language', 'Number of tweets'],
    	                                                                  ['English',     en_count],
    	                                                                  ['Spanish',     es_count],
    	                                                                  ['French',  fr_count],
    	                                                                  ['Italian', it_count],
    	                                                                  ['German',    de_count]
    	                                                                ]);

    	                var options = {
    	                	is3D: true,
    	                  width:500
    	                };

    	                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
    	                chart.draw(data, options);
    	                $("#pieParent").show();
    	                });
    	                });
						 
    	                var word_list = [];
						 var len = wholedata.hashtags.length;
						 for (var i = 0; i < len; i++) {
						     word_list.push({
						         text: wholedata.hashtags[i].text,
						         weight: wholedata.hashtags[i].weight
						     });
						 }
						 $('#wordcloud').remove();
						 $('#jQparent').append('<div id="wordcloud" style="width: 500px; height: 254px;"></div>');
						 $('#wordcloud').jQCloud(word_list);
						 $("#jQparent").show();
					}
			});
	});
});

	$("#searchbox").keyup(function(event){
    	if(event.keyCode == 13){
        $("#search-btn").click();
    }
    	
    	
});
</script>

<script>

  function startDictation() {
 
    if (window.hasOwnProperty('webkitSpeechRecognition')) {
 
      var recognition = new webkitSpeechRecognition();
 
      recognition.continuous = false;
      recognition.interimResults = false;
 
      recognition.lang = "en-US";
      recognition.start();
 
      recognition.onresult = function(e) {
        document.getElementById('searchbox').value
                                 = e.results[0][0].transcript;
        recognition.stop();
        document.getElementById('search-btn').click();
      };
 
      recognition.onerror = function(e) {
        recognition.stop();
      }
 
    }
  }

  function startDictation2() {
 
    if (window.hasOwnProperty('webkitSpeechRecognition')) {
 
      var recognition = new webkitSpeechRecognition();
 
      recognition.continuous = false;
      recognition.interimResults = false;
 
      recognition.lang = "es-ES";
      recognition.start();
 
      recognition.onresult = function(e) {
        document.getElementById('searchbox').value
                                 = e.results[0][0].transcript;
        recognition.stop();
        document.getElementById('search-btn').click();
      };
 
      recognition.onerror = function(e) {
        recognition.stop();
      }
 
    }
  }
  function startDictation3() {
	  
	    if (window.hasOwnProperty('webkitSpeechRecognition')) {
	 
	      var recognition = new webkitSpeechRecognition();
	 
	      recognition.continuous = false;
	      recognition.interimResults = false;
	 
	      recognition.lang = "de-DE";
	      recognition.start();
	 
	      recognition.onresult = function(e) {
	        document.getElementById('searchbox').value
	                                 = e.results[0][0].transcript;
	        recognition.stop();
	        document.getElementById('search-btn').click();
	      };
	 
	      recognition.onerror = function(e) {
	        recognition.stop();
	      }
	 
	    }
	  }
  function startDictation4() {
	  
	    if (window.hasOwnProperty('webkitSpeechRecognition')) {
	 
	      var recognition = new webkitSpeechRecognition();
	 
	      recognition.continuous = false;
	      recognition.interimResults = false;
	 
	      recognition.lang = "fr-FR";
	      recognition.start();
	 
	      recognition.onresult = function(e) {
	        document.getElementById('searchbox').value
	                                 = e.results[0][0].transcript;
	        recognition.stop();
	        document.getElementById('search-btn').click();
	      };
	 
	      recognition.onerror = function(e) {
	        recognition.stop();
	      }
	 
	    }
	  }
  function startDictation5() {
	  
	    if (window.hasOwnProperty('webkitSpeechRecognition')) {
	 
	      var recognition = new webkitSpeechRecognition();
	 
	      recognition.continuous = false;
	      recognition.interimResults = false;
	 
	      recognition.lang = "it-IT";
	      recognition.start();
	 
	      recognition.onresult = function(e) {
	        document.getElementById('searchbox').value
	                                 = e.results[0][0].transcript;
	        recognition.stop();
	        document.getElementById('search-btn').click();
	      };
	 
	      recognition.onerror = function(e) {
	        recognition.stop();
	      }
	 
	    }
	  }
  </script>
	<script>
function dosearch(){
	$("#search-btn").click();
	}
</script>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'de,en,es,fr,it', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true}, 'google_translate_element');
}
</script>

<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</body>
</html>
