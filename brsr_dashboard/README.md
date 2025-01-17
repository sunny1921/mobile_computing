# BRSR Dashboard

A dashboard application for displaying and managing BRSR (Business Responsibility and Sustainability Reporting) data using Firebase.

## Prerequisites

Before you begin, ensure you have the following installed on your computer:
- [Node.js](https://nodejs.org/) (version 14 or higher)
- [Git](https://git-scm.com/downloads)
- A code editor (like Visual Studio Code)

## Detailed Setup Instructions

1. **Clone the Repository**
   - Open your terminal/command prompt
   - Navigate to where you want to store the project
   - Run these commands:
   ```bash
   git clone <your-repository-url>
   cd brsr_dashboard
   ```

2. **Install Dependencies**
   - In the project directory, run:
   ```bash
   npm install
   ```
   - This may take a few minutes to complete

3. **Environment Setup**
   - Look for the file named `.env.example` in the project
   - Create a new file named `.env.local` by copying `.env.example`:
   ```bash
   # On Windows:
   copy .env.example .env.local
   # On Mac/Linux:
   cp .env.example .env.local
   ```
   - Open `.env.local` in your code editor
   - Update the Firebase configuration values (see Firebase Setup below)

4. **Firebase Setup**
   a. Create a Firebase Project:
      - Go to [Firebase Console](https://console.firebase.google.com)
      - Click "Add Project" and follow the setup wizard
      - Give your project a name and click "Continue"
      
   b. Get Firebase Configuration:
      - In Firebase Console, click on the gear icon ⚙️ (Project Settings)
      - Scroll down to "Your apps" section
      - Click the web icon (</>)
      - Register your app with a nickname
      - Copy the provided configuration values to your `.env.local` file

5. **Run the Application**
   - Start the development server:
   ```bash
   npm run dev
   ```
   - Open your browser and go to: `http://localhost:3000`
   - You should see the BRSR Dashboard homepage

## Troubleshooting Common Issues

1. **"npm not found" error**
   - Make sure Node.js is properly installed
   - Open a new terminal window after installing Node.js

2. **"Port 3000 already in use" error**
   - Either close the application using port 3000
   - Or start the server on a different port:
   ```bash
   npm run dev -- -p 3001
   ```

3. **Firebase connection issues**
   - Double-check your Firebase configuration in `.env.local`
   - Ensure your Firebase project is properly set up
   - Check if you have enabled necessary Firebase services

## Important Notes
- Never commit sensitive information like API keys or private keys
- Keep your `.env.local` and Firebase Admin SDK private key secure
- Make sure to add appropriate security rules in your Firebase console

## Tech Stack
- Next.js
- Firebase
- TypeScript 