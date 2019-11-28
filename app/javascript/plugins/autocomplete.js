const onPlaceChanged = autocomplete => {
  var place = autocomplete.getPlace();
  console.log(place);
};

function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var Address = document.getElementById("item_address");

    if (Address) {
      var autocomplete = new google.maps.places.Autocomplete(Address);
      autocomplete.addListener("place_changed", () => {
        var place = autocomplete.getPlace();
        var components = getAddressComponents(place);
        // console.log(components);
        var title = getTitle(place);
        document.getElementById("item_country").value = components.country_code;
        document.getElementById("item_city").value = components.city;
        document.getElementById("item_title").value = title;
      });
      google.maps.event.addDomListener(Address, "keydown", function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

function getTitle(place) {
  var titleEntered = place.name;
  return titleEntered;
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  if (window.console && typeof console.log === "function") {
    // console.log(place);
  }

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type === "street_number") {
        street_number = component.long_name;
      } else if (type === "route") {
        route = component.long_name;
      } else if (type === "postal_code") {
        zip_code = component.long_name;
      } else if (type === "locality") {
        city = component.long_name;
      } else if (type === "postal_town" && city === null) {
        city = component.long_name;
      } else if (type === "country") {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number === null ? route : street_number + " " + route,
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}

export { autocomplete };
