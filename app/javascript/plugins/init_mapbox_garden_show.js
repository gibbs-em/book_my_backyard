import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  // console.log(mapElement.dataset);
  return new mapboxgl.Map({
    container: 'map-garden',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkerToMap = (map, marker) => {
  const popup = new mapboxgl.Popup({ closeOnClick: false }).setHTML(marker.info_window); // add this
  // console.log(popup);
  
  // create a HTML element for each feature
  const addStyle = document.createElement('div');
  addStyle.className = 'marker';

  new mapboxgl.Marker(addStyle)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup) // add this
    .addTo(map);
};

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker.lng, marker.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapboxGardenShow = () => {
  const mapElement = document.getElementById('map-garden');
  if (mapElement) {
    const map = buildMap(mapElement);
    // console.log(mapElement.dataset.marker);
    const marker = JSON.parse(mapElement.dataset.marker);
    // console.log(marker);
    addMarkerToMap(map, marker);
    fitMapToMarker(map, marker);
  }
};

export { initMapboxGardenShow };

