import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarker = (map, marker) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([marker.lng, marker.lat]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/ryanofwoods/cklkxz9fy0ww017rz39sc6zrp'
    });

    // parse the html json dataset to actual markers
    // add them to the map
    const marker = JSON.parse(mapElement.dataset.marker);
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker({ color: "#212121" })
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // info window
      .addTo(map);

    // once all markers are added, fit all markers within map viewport
    fitMapToMarker(map, marker);
  }
};

export { initMapbox };