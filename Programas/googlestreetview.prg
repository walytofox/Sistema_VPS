* Program: GOOGLESTREETVIEW.PRG
* Author: Cesar VFPIMAGING - www.vfpimaging.blogspot.com
* Description:
* Gets GoogleMaps full address, from the destination variable filled with the most complete info
* Creates a HTML / AJAX
* Thanks to Jordan Clist, code adapted from the one he osted in his blog:
* http://www.jaycodesign.co.nz/js/using-google-maps-to-show-a-streetview-of-a-house-based-on-an-address/
* Thanks to Mike Gagnon for his article published at http://atoutfox.org/articles.asp?ACTION=FCONSULTER&ID=0000000807
* "Calculer la distance entre 2 adresses, et montrer l'itineraire complet"

LPARAMETERS tcDestination

LOCAL loXML AS "MSXML2.ServerXMLHTTP.4.0"
LOCAL lcFullURL, lcResponse, lcRouteParameters
tcDestination          = EVL(tcDestination, "")

lcRouteParameters = "origin=" + STRTRAN(UPPER(ALLTRIM(tcDestination)), " ", "%20") + ;
    "&destination=" + STRTRAN(UPPER(ALLTRIM(tcDestination)), " ", "%20")

* Documentation at http://code.google.com/apis/maps/documentation/directions/)
* Build up the full URL with the required parameters
lcFullURL = "http://maps.googleapis.com/maps/api/directions/xml?" + lcRouteParameters + ;
    "&units=metrics&sensor=false"


* Test with all XML Versions
* Can also apply the info from http://support.microsoft.com/kb/278674/en-us
* to determine what version of MSXML is installed in the machine
TRY 
	loXML = CREATEOBJECT("MSXML2.ServerXMLHTTP.4.0") && Could use version 3.0, 4.0, 5.0, 6.0
CATCH
	TRY 
		loXML = CREATEOBJECT("MSXML2.ServerXMLHTTP.3.0") && Could use version 3.0, 4.0, 5.0, 6.0
	CATCH 
		TRY
			loXML = CREATEOBJECT("MSXML2.ServerXMLHTTP.5.0") && Could use version 3.0, 4.0, 5.0, 6.0
		CATCH
			TRY 
				loXML = CREATEOBJECT("MSXML2.ServerXMLHTTP.6.0") && Could use version 3.0, 4.0, 5.0, 6.0
			CATCH 
			ENDTRY 
		ENDTRY 
	ENDTRY 
ENDTRY 


loXML.OPEN("POST", lcFullURL, .F.)
loXML.SetRequestHeader("Content-Type", "application/xml")
loXML.SEND("")
lcResponse = loXML.ResponseText

LOCAL lcAddress, lcHTML
lcAddress = STREXTRACT(lcResponse, "<end_address>", "</end_address>")

TEXT TO lcHTML NOSHOW TEXTMERGE
<!DOCTYPE html>
<html>
<head>
<style>
	body {
		font-family: helvetica;
	}
	.map_container {
		width: 800px;
		height:800px;
	}
	#map_canvas_cont, #pano_cont {
		float: left;
		width: 750px;
		height: 400px;
		margin: 20px;
	}

	#pano, #map_canvas {
		width: 100%;
		height: 100%;
	}

</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=us"></script>
</head>
<body>

		<div class="map_container">

		<div id="pano_cont">
				<div id="pano"></div>
			</div>

	<div id="map_canvas_cont">
				<div id="map_canvas"></div>
			</div>
		</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script>

		var panorama;
		var addLatLng;
		var showPanoData;
		var panorama;

		function load_map_and_street_view_from_address(address) {
		   // Check if GPS has been locally cached.
			var geocoder = new google.maps.Geocoder();
			console.log("new geocoder");
			geocoder.geocode( { 'address': address}, function(results, status) {
			    if (status == google.maps.GeocoderStatus.OK) {

					var gps = results[0].geometry.location;
					create_map_and_streetview(gps.lat(), gps.lng(), 'map_canvas', 'pano');
			    }
			});
		}


  	function showPanoData(panoData, status) {
	      if (status != google.maps.StreetViewStatus.OK) {
			$('#pano').html('No StreetView Picture Available').attr('style', 'text-align:center;font-weight:bold').show();
	        return;
	      }
	      var angle = computeAngle(addLatLng, panoData.location.latLng);

	      var panoOptions = {
		    position: addLatLng,
		    addressControl: false,
		    linksControl: false,
		    panControl: false,
		    zoomControlOptions: {
			style: google.maps.ZoomControlStyle.SMALL
		    },
		    pov: {
			heading: angle,
			pitch: 10,
			zoom: 1
		    },
		    enableCloseButton: false,
		    visible:true
		};

		panorama.setOptions(panoOptions);
	}


	function  create_map_and_streetview(lat, lng, map_id, street_view_id) {

		panorama = new google.maps.StreetViewPanorama(document.getElementById("pano"));
		addLatLng = new google.maps.LatLng(lat,lng);
		var service = new google.maps.StreetViewService();
		service.getPanoramaByLocation(addLatLng, 50, showPanoData);

	    var myOptions = {
			zoom: 16,
			center: addLatLng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			backgroundColor: 'transparent',
			streetViewControl: false,
			keyboardShortcuts: false
	    }
	    console.log("Create map marker")
	    var map = new google.maps.Map(document.getElementById(map_id), myOptions);
		var marker = new google.maps.Marker({
				map:map,
				animation: google.maps.Animation.DROP,
				position: addLatLng
		});
		console.log("Create map marker 2")
  	}



	function computeAngle(endLatLng, startLatLng) {
      var DEGREE_PER_RADIAN = 57.2957795;
      var RADIAN_PER_DEGREE = 0.017453;

      var dlat = endLatLng.lat() - startLatLng.lat();
      var dlng = endLatLng.lng() - startLatLng.lng();
      // We multiply dlng with cos(endLat), since the two points are very closeby,
      // so we assume their cos values are approximately equal.
      var yaw = Math.atan2(dlng * Math.cos(endLatLng.lat() * RADIAN_PER_DEGREE), dlat)
             * DEGREE_PER_RADIAN;
      return wrapAngle(yaw);
   }

   function wrapAngle(angle) {
		if (angle >= 360) {
		    angle -= 360;
		} else if (angle < 0) {
		    angle += 360;
		}
		return angle;
    }
		console.log("before $");
		$(document).ready(function() {
			console.log("doc ready");
			load_map_and_street_view_from_address("<<lcAddress>>");

			$('#change_street').click(function(){
				$('form').submit();
			});

		});
	</script>
</body>
</html>
ENDTEXT

* Save the HTML to a local file on the disk
LOCAL lcFile
lcFile = ADDBS(GETENV("TEMP")) + SYS(2015) + ".htm"
STRTOFILE(lcHTML, lcFile)

* Show the StreetView
RUN /N6 chrome.EXE &lcFile.
