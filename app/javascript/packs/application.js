import Rails from "@rails/ujs";
import "bootstrap";
// import "mapbox-gl/dist/mapbox-gl.css"; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "plugins/flatpickr";
import 'select2/dist/css/select2.css';

// import { initMapbox } from "../plugins/init_mapbox";
import { home } from "../home/home";
import { initSweetalert } from "../plugins/init_sweetalert";
import { dropdownSubmit } from "../plugins/dropsubmit";
import { initSelect2 } from '../plugins/init_select2';
import { initSortable } from '../plugins/init_sortable';
import { hideItem } from "../components/toggle_items";

Rails.start();

window.$ = window.jQuery = require('jquery');

initSortable();
dropdownSubmit();
// initAutocomplete();
// initMapbox();

const select2Item = document.querySelector('.select2');
if (select2Item) initSelect2();

hideItem();



