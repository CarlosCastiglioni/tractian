# Asset Tree View Application

## Overview

The Asset Tree View Application is a Flutter-based project designed to visualize a company's asset hierarchy through a dynamic tree structure. The application allows users to view and manage assets, components, and locations, providing essential insights for asset management and maintenance.

## Demo

Watch the demo video below:

https://github.com/user-attachments/assets/5c831b9d-6f16-491d-a7c4-b9db03f24171

### Points to improve
- **Components:** Break components into smaller parts to make testing easier;
- **Tests:** Finalize test implementation;
- **Themes :** Work on themes for the rest of the widgets to standardize the project;
- **Assets Controller :** Work with assets/locations division in controller instead of organizing in the lists for better performance.

## Features

### Home Page
- **Navigation Menu:** Allows users to navigate between different companies and access their assets.

### Asset Page
- **Tree Visualization:** Displays a dynamic tree structure representing assets, components, and locations.
- **Filters:**
  - **Text Search:** Search for specific components, assets, or locations within the hierarchy.
  - **Energy Sensors:** Filter to show only energy sensors.
  - **Critical Sensor Status:** Highlight assets with critical sensor statuses.

### Technical Data
- **Locations Collection:** Represents locations and sub-locations with attributes including `id`, `name`, and optional `parentId`.
- **Assets Collection:** Includes assets, sub-assets, and components with attributes such as `id`, `name`, `locationId`, `parentId`, and optional `sensorType`.

### Example Data Representation
- **Location:** PRODUCTION AREA - RAW MATERIAL
  - **Sub-Location:** CHARCOAL STORAGE SECTOR
    - **Asset:** CONVEYOR BELT ASSEMBLY
      - **Sub-Asset:** MOTOR TC01 COAL UNLOADING AF02
        - **Component:** MOTOR RT COAL AF01 (Vibration Sensor)
- **Component:** Fan - External (Vibration Sensor)

## API Endpoints

The application interacts with a demo API to fetch data:
- **GET /companies** - Returns all companies.
- **GET /companies/:companyId/locations** - Returns all locations of the specified company.
- **GET /companies/:companyId/assets** - Returns all assets of the specified company.

API Base URL: `https://fake-api.tractian.com`

## Installation

1. **Clone the Repository:**
   git clone <repository-url>
2. **Navigate to the Project Directory:**
   cd <project-directory>
3. **Install Dependencies:**
   flutter pub get
4. **Run the Application:**
   flutter run
