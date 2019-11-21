import "bootstrap";

// app/javascript/packs/application.js
import "mapbox-gl/dist/mapbox-gl.css"; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initAutocomplete } from "plugins/init_autocomplete";
import { initMapbox } from "../plugins/init_mapbox";

initAutocomplete();
initMapbox();

import { home } from "../home/home";

import { initSweetalert } from "../plugins/init_sweetalert";

// initSweetalert('#sweet-alert-demo', {
//   title: "Nice!",
//   text: "Item successfully created",
//   icon: "success"
// }, (value) => {
//   if (value) {
//     const link = document.querySelector('#submit-link');
//     link.click();
//   }
// });
