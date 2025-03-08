<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAtMFpeoFD3bcyox4CTP4NXzatp5MCSpHw&libraries=places'></script>

     <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css"/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>

         <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
   
    <script src="../bower_components/jquery/src/jquery.maskMoney.js"></script>
		<!-- just necessary for syntax highlight -->
		<link href='http://alexgorbatchev.com/pub/sh/current/styles/shCore.css' rel='stylesheet' type='text/css' />
		<link href='http://alexgorbatchev.com/pub/sh/current/styles/shThemeDefault.css' rel='stylesheet' type='text/css' />
		<script src='http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js' type='text/javascript'></script>
		<script src='http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js' type='text/javascript'></script>
		<script src='http://alexgorbatchev.com/pub/sh/current/scripts/shBrushXml.js' type='text/javascript'></script>

    <link href="../../css/sweetalert.css" rel="stylesheet" />
    <script src="../../js/sweetalert.min.js" type="text/javascript"></script>





    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

    <title></title>

    <style type="text/css">
        #geomap{
    width: 100%;
    height: 400px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="form-group input-group">
    <input type="text" id="search_location" class="form-control" placeholder="Buscar Localidad">
    <div class="input-group-btn">
        <button class="btn btn-default get_map" type="submit">
            Locate
        </button>
    </div>
</div>
    </form>
    <!-- display google map -->
<div id="geomap"></div>

<!-- display selected location information -->
<h4>Detalles de localizacion:</h4>
    <div class="row">
        <div class="col-sm-4">
            Dirección: <input type="text" id="Direccion" runat="server" class="form-control search_addr" disabled="disabled"  size="45"/>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-4">
            Latitud: <input type="text" id="Latitud" runat="server" class="form-control search_latitude" disabled="disabled" size="30"/>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-4">
            Longitud: <input type="text" id="Longitud" runat="server" class="form-control search_longitude"  disabled="disabled" size="30"/>
        </div>
    </div>


    <script>
var geocoder;
var map;
var marker;

/*
 * Google Map with marker
 */
function initialize() {
    var initialLat = $('.search_latitude').val();
    var initialLong = $('.search_longitude').val();
    initialLat = initialLat?initialLat : 16.752153;
    initialLong = initialLong?initialLong : -93.125025;

    var latlng = new google.maps.LatLng(initialLat, initialLong);
    var options = {
        zoom: 16,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("geomap"), options);

    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: latlng
    });

    google.maps.event.addListener(marker, "dragend", function () {
        var point = marker.getPosition();
        map.panTo(point);
        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            }
        });
    });

}

$(document).ready(function () {
    //load google map
    initialize();
    
    /*
     * autocomplete location search
     */
    var PostCodeid = '#search_location';
    $(function () {
        $(PostCodeid).autocomplete({
            source: function (request, response) {
                geocoder.geocode({
                    'address': request.term
                }, function (results, status) {
                    response($.map(results, function (item) {
                        return {
                            label: item.formatted_address,
                            value: item.formatted_address,
                            lat: item.geometry.location.lat(),
                            lon: item.geometry.location.lng()
                        };
                    }));
                });
            },
            select: function (event, ui) {
                $('.search_addr').val(ui.item.value);
                $('.search_latitude').val(ui.item.lat);
                $('.search_longitude').val(ui.item.lon);
                var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
                marker.setPosition(latlng);
                initialize();
            }
        });
    });
    
    /*
     * Point location on google map
     */
    $('.get_map').click(function (e) {
        var address = $(PostCodeid).val();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        e.preventDefault();
    });

    //Add listener to marker for reverse geocoding
    google.maps.event.addListener(marker, 'drag', function () {
        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    $('.search_addr').val(results[0].formatted_address);
                    $('.search_latitude').val(marker.getPosition().lat());
                    $('.search_longitude').val(marker.getPosition().lng());
                }
            }
        });
    });
});
</script>



    <!-- ./wrapper -->

<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- PACE -->
<script src="../../bower_components/PACE/pace.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
         <script>
          setTimeout(function () {
              $('#processing-modal1').modal('hide')
          }, 1000);
      </script>
         <script>
          setTimeout(function () {
              $('#processing-modal2').modal('hide')
          }, 1000);
      </script>
<!-- page script -->
        <script>
        $(function () {
            $('#sidebar-form').on('submit', function (e) {
                e.preventDefault();
            });

            $('.sidebar-menu li.active').data('lte.pushmenu.active', true);

            $('#search-input').on('keyup', function () {
                var term = $('#search-input').val().trim();

                if (term.length === 0) {
                    $('.sidebar-menu li').each(function () {
                        $(this).show(0);
                        $(this).removeClass('active');
                        if ($(this).data('lte.pushmenu.active')) {
                            $(this).addClass('active');
                        }
                    });
                    return;
                }

                $('.sidebar-menu li').each(function () {
                    if ($(this).text().toLowerCase().indexOf(term.toLowerCase()) === -1) {
                        $(this).hide(0);
                        $(this).removeClass('pushmenu-search-found', false);

                        if ($(this).is('.treeview')) {
                            $(this).removeClass('active');
                        }
                    } else {
                        $(this).show(0);
                        $(this).addClass('pushmenu-search-found');

                        if ($(this).is('.treeview')) {
                            $(this).addClass('active');
                        }

                        var parent = $(this).parents('li').first();
                        if (parent.is('.treeview')) {
                            parent.show(0);
                        }
                    }

                    if ($(this).is('.header')) {
                        $(this).show();
                    }
                });

                $('.sidebar-menu li.pushmenu-search-found.treeview').each(function () {
                    $(this).find('.pushmenu-search-found').show(0);
                });
            });
        });
    </script>


          <script>
          window.onload = function () {
              if (typeof history.pushState === "function") {
                  history.pushState("jibberish", null, null);
                  window.onpopstate = function () {
                      history.pushState('newjibberish', null, null);
                      // Handle the back (or forward) buttons here
                      // Will NOT handle refresh, use onbeforeunload for this.
                  };
              }
              else {
                  var ignoreHashChange = true;
                  window.onhashchange = function () {
                      if (!ignoreHashChange) {
                          ignoreHashChange = true;
                          window.location.hash = Math.random();
                          // Detect and redirect change here
                          // Works in older FF and IE9
                          // * it does mess with your hash symbol (anchor?) pound sign
                          // delimiter on the end of the URL
                      }
                      else {
                          ignoreHashChange = false;
                      }
                  };
              }
          }
      </script>



</body>
</html>
