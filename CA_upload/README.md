# AWM_CA C22493266
# Crime Mapping App

## Application Description

This is an interactive web application for visualizing and analyzing crime incidents through a spatially enabled map.  
Users can:
- View crimes on a Leaflet map as clustered points and heatmap overlays.  
- Filter crimes by category, severity, date range, geographic polygon, or radius.  
- Add new crimes directly through the map UI.  
- Delete crimes using convenient controls.  

This tool enables location-based crime analysis with real-time filtering, designed for urban safety insights.

---

## Features

- Leaflet map with OpenStreetMap tiles, clustered markers, and heatmap visualization.  
- Spatial filtering using bounding box, user-drawn polygons, or radius search.  
- CRUD operations for crimes via RESTful API endpoints.  
- Data input through map interactions (prompts).  
- Responsive design considerations for desktop and mobile.  
- Full Docker containerization for simplified deployment.

---

## Technology Stack

- Backend: Django with GeoDjango (PostGIS spatial extension)  
- Frontend: Leaflet.js with cluster and heatmap plugins  
- Database: PostgreSQL with PostGIS  
- Deployment: Docker & Docker Compose for environment encapsulation and ease of setup  
- Others: Python 3, JavaScript (ES6), HTML5, CSS, Bootstrap for UI components

---

## Setup Instructions

### Local Setup

1. Clone the repository:
git clone https://github.com/jakewalshh/AWM_CA.git
cd AWM_CA

2. Environment Configuration
Before running the project, create or update your .env file at the project root with the necessary environment variables. These typically include:

# Example .env values
- POSTGRES_DB=yourdatabasenamehere
- POSTGRES_USER=yourusernamehere
- POSTGRES_PASSWORD=yourpasswordhere
- DB_HOST=db
- DB_PORT=5432
- DJANGO_SECRET_KEY=dev-change-me
- DJANGO_DEBUG=True
- DJANGO_ALLOWED_HOSTS=*
- PGADMIN_EMAIL=admin@example.com
- PGADMIN_PASSWORD=yourpasswordhere


-Make sure to replace placeholder values with your actual credentials. This file is usually excluded from version control for security.

3. Build and run with Docker:
docker compose up --build

4. Access the app at 'http://localhost:8000/' in your browser

5. To stop the app run:
docker compose down


6. if you need, activate docker python env with:
docker exec -it awm-web bash
---

## API Documentation

### Endpoints:

- `GET /api/crimes/geojson/`  
Returns crimes as GeoJSON with spatial and attribute filters.  

- `GET /api/crimes/heat/`  
Returns crime points for heatmap rendering.  

- `GET /api/crimes/radius/?lat={lat}&lon={lon}&radius={meters}`  
Returns crimes within given radius around Point.  

- `GET /api/crimes/polygon/?polygon=lon1 lat1,lon2 lat2,...`  
Returns crimes inside user-defined polygon.  

- `POST /api/crimes/add/`  
Adds new crime entry. Payload as JSON with `lng`, `lat`, `category`, `severity`, and optional `occurred_at`.

- `DELETE /api/crimes/delete/{id}/`  
Deletes crime by ID.

---

## Known Issues or Limitations

- Data is generated and not real! See commands for Gen Script
- Crime adding uses simple JavaScript prompts, could be improved with modal forms for better UX.  
- No user authentication or permissions implemented.  
- Performance may degrade with extremely large datasets; indexing and pagination could be enhanced.  
- Responsive design basic; some UI controls can be optimized for smaller devices.

---


## Screenshots of it working

- Overview
![OverviewImage](screenshots/Overview.png)

- Polygon Working
![Polygon](screenshots/PolygonDisplay.png)

- Radius Working
![Radius](screenshots/RadiusWorking.png)

- Adding Crimes
![addCrime1](screenshots/AddingCrimept1.png)
![addCrime2](screenshots/AddingCrimept2.png)

- Deleting Crimes
![delCrime](screenshots/CrimeDeleted.png)

- Filter example
![FilterExample](screenshots/SeverityFilter.png)

