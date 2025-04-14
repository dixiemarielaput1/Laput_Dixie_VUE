const app = Vue.createApp({
    created() {
        this.fetchWeatherReports();
    },
    data() {
        return {
            reportsData: [],
            error: "",
            loadingReports: true,
            loading: false,
            map: null,
            markers: {},
            selectedReport: null 
        };
    },
    methods: {
        fetchWeatherReports() {
            fetch('http://localhost/extreme-weather-backend/public/reports')
                .then(response => response.json())
                .then(data => {
                    this.reportsData = data;
                    this.loadingReports = false;
                    this.initMap();
                })
                .catch(error => {
                    console.error('Fetch error:', error);
                    this.error = "Failed to load weather reports.";
                    this.loadingReports = false;
                });
        },
        initMap() {
            this.map = L.map('map', {
                zoomSnap: 1,
                attributionControl: false
            }).setView([45.4215, -75.6998], 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap contributors',
                tileSize: 256,
                detectRetina: true,
                noWrap: true
            }).addTo(this.map);

            this.reportsData.forEach(report => {
                if (report.latitude && report.longitude) {
                    const marker = L.marker([report.latitude, report.longitude]).addTo(this.map);
                    this.markers[report.id] = marker;

                    const imageUrl = `images/${report.weather_image}`;
                    const popupContent = `
                        <strong>${report.location}</strong><br>
                        ${report.description}<br>
                        <img src="${imageUrl}" width="100" alt="weather image" /><br>
                        <button @click="showReportDetails(${report.id})" class="mt-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Details</button>
                    `;
                    marker.bindPopup(popupContent);
                }
            });
        },
        getWeatherReport(id) {
            this.loading = true;
            fetch(`http://localhost/extreme-weather-backend/public/reports/${id}`)
                .then(response => response.json())
                .then(data => {
                    this.loading = false;
                    if (data) {
                        this.selectedReport = data;
                        const imageUrl = `images/${data.weather_image}`;
                        const popupContent = `
                            <strong>${data.location}</strong><br>
                            Region: ${data.region || 'N/A'}<br>
                            Reported Date: ${data.reported_date || 'N/A'}<br>
                        
                            Temperature: ${data.temperature !== null ? `${data.temperature} °C` : 'N/A'}<br>
                            Humidity: ${data.humidity !== null ? `${data.humidity} %` : 'N/A'}<br>
                            Wind Speed: ${data.wind_speed !== null ? `${data.wind_speed} km/h` : 'N/A'}<br>
                            Condition: ${data.condition_type || 'N/A'}<br>
                           
                        `;
                        if (this.markers[id]) {
                            this.markers[id].setPopupContent(popupContent).openPopup();
                            this.map.setView([data.latitude, data.longitude], 8);
                        }
                    } else {
                        this.error = "No data found for the selected report.";
                    }
                })
                .catch(error => {
                    console.error('Error fetching weather report details:', error);
                    this.loading = false;
                    this.error = "Failed to load weather report details.";
                });
        },
        showReportDetails(id) {
            this.getWeatherReport(id);
        }
    }
}).mount("#app");
