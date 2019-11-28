import GMaps from "gmaps/gmaps.js";
import { autocomplete } from "../plugins/autocomplete";

window.buildMap = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
      // don't try to build a map if there's no div#map to inject in
      const map = new GMaps({ el: "#map", lat: 0, lng: 0 });
      const markers = JSON.parse(mapElement.dataset.markers);
      map.addMarkers(markers);
      if (markers.length === 0) {
          map.setZoom(2);
      } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(15);
          map.fitLatLngBounds(markers);
      } else {
          map.fitLatLngBounds(markers);
      }

      const styles = [
    {
        "featureType": "administrative.country",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "lightness": "40"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "lightness": "20"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "lightness": "10"
            }
        ]
    },
    {
        "featureType": "administrative.locality",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.locality",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "lightness": "25"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#ffbb00"
            },
            {
                "saturation": 43.400000000000006
            },
            {
                "lightness": 37.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#00FF6A"
            },
            {
                "saturation": -1.0989010989011234
            },
            {
                "lightness": 11.200000000000017
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": "30"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#FFC200"
            },
            {
                "saturation": -61.8
            },
            {
                "lightness": 45.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 51.19999999999999
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 52
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#00ffda"
            },
            {
                "saturation": "-50"
            },
            {
                "lightness": "25"
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            },
            {
                "lightness": "30"
            }
        ]
    }
]

map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');
  }
}
const buildMap = window.buildMap

buildMap();

// function calcRoute() {
//     var directionsDisplay = new google.maps.DirectionsRenderer();
//     var directionsService = new google.maps.DirectionsService();
//     const markers = JSON.parse(mapElement.dataset.markers);
//     var start = new google.maps.LatLng(markers[0]);
//     //var end = new google.maps.LatLng(38.334818, -181.884886);
//     var end = new google.maps.LatLng(markers[-1]);
//     var bounds = new google.maps.LatLngBounds();
//     bounds.extend(start);
//     bounds.extend(end);
//     // map.fitBounds(bounds);
//     var request = {
//         origin: start,
//         destination: end,
//         travelMode: google.maps.TravelMode.DRIVING
//     };
//     directionsService.route(request, function(response, status) {
//         if (status == google.maps.DirectionsStatus.OK) {
//             directionsDisplay.setDirections(response);
//             directionsDisplay.setMap(map);
//         } else {
//             alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
//         }
//     });
// }

autocomplete();
// calcRoute();



