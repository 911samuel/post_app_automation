# Post App Testing

## Project Description
Post App Testing is a Flutter application designed to fetch and display posts from a news API. The app features a clean UI with light and dark themes, post cards displaying images and details, and a structured architecture separating domain, data, UI, and utility layers.

## Table of Contents
- [Technologies Used](#technologies-used)
- [Requirements](#requirements)
- [Installation Instructions](#installation-instructions)
- [Usage Instructions](#usage-instructions)
- [Documentation](#documentation)
- [Visuals](#visuals)
- [Support Information](#support-information)
- [Project Roadmap](#project-roadmap)
- [Project Status](#project-status)
- [Contribution Guidelines](#contribution-guidelines)
- [Acknowledgments](#acknowledgments)
- [License Information](#license-information)

## Technologies Used
- Flutter
- Dart
- Provider
- HTTP package
- flutter_dotenv

## Requirements
- Flutter SDK (version compatible with the project)
- Dart SDK
- Internet connection for API requests

## Installation Instructions
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd post_app_testing
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

## Usage Instructions
- Launch the app on an emulator or physical device.
- Browse the list of posts fetched from the news API.
- Toggle between light and dark themes using the theme toggle button.
- Tap on posts to view details (if implemented).

## Documentation
- The project follows a clean architecture with separate layers for domain, data, UI, and utilities.
- The `lib/domain/model` contains domain models.
- The `lib/data` folder contains repositories, services, and data models.
- The `lib/ui` folder contains views and view models.
- The `lib/utils` folder contains utility classes for commands and result handling.

## Visuals
### Light Theme
![Light Theme](assets/images/light.png)

### Dark Theme
![Dark Theme](assets/images/dark.png)

### Post Card
![Post Card](assets/images/card.png)

## Support Information
For support, please open an issue on the GitHub repository or contact the maintainer via email.

## Project Roadmap
- Add detailed post view screen.
- Implement offline caching.
- Add user authentication.
- Improve error handling and loading states.

## Project Status
Active/In development.

## Contribution Guidelines
- Fork the repository.
- Create a new branch for your feature or bugfix.
- Submit a pull request with a clear description of your changes.

## Acknowledgments
Thanks to all contributors and the Flutter community for their support.

## License Information
This project is licensed under the MIT License. See the LICENSE file for details.
