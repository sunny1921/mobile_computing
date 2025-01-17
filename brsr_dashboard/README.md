# BRSR Dashboard

A dashboard application for displaying and managing BRSR (Business Responsibility and Sustainability Reporting) data using Firebase.

## Setup Instructions

1. Clone the repository
```bash
git clone <your-repository-url>
cd brsr_dashboard
```

2. Install dependencies
```bash
npm install
```

3. Environment Setup
- Copy `.env.example` to `.env.local`
```bash
cp .env.example .env.local
```
- Update the `.env.local` file with your Firebase configuration values

4. Firebase Setup
- Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
- Generate a new Firebase Admin SDK private key and save it securely
- Update the Firebase configuration in your `.env.local` file

5. Run the development server
```bash
npm run dev
```

## Important Notes
- Never commit sensitive information like API keys or private keys
- Keep your `.env.local` and Firebase Admin SDK private key secure
- Make sure to add appropriate security rules in your Firebase console

## Tech Stack
- Next.js
- Firebase
- TypeScript 