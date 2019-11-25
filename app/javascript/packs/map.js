import GMaps from "gmaps/gmaps.js";
import { autocomplete } from "../plugins/autocomplete";

const mapElement = document.getElementById("map");
if (mapElement) {
    // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: "#map", lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    map.addMarkers(markers);
    if (markers.length === 0) {
        map.setZoom(2);
    } else if (markers.length === 1) {
        map.setCenter(markers[0].lat, markers[0].lng);
        map.setZoom(14);
    } else {
        map.fitLatLngBounds(markers);
    }
}


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
