import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css"; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "plugins/flatpickr";
import { initAutocomplete } from "plugins/init_autocomplete";
import { initMapbox } from "../plugins/init_mapbox";
import { home } from "../home/home";
import { initSweetalert } from "../plugins/init_sweetalert";
import { dropdownSubmit } from "../plugins/dropsubmit";


dropdownSubmit();
initAutocomplete();
initMapbox();
