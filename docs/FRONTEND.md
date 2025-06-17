# Frontend Module Overview

This document provides a high-level overview of the frontend component in the multi-agents project. The frontend module is maintained as a separate repository and integrated as a submodule.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Key Features](#key-features)
- [Core Components](#core-components)
- [Integration](#integration)
- [Repository Information](#repository-information)

## Overview <a id="overview"></a>

The frontend module delivers a responsive React-based web application that provides an intuitive interface for health assistance, vaccination appointment management, and conversational AI interactions.

## Architecture <a id="architecture"></a>

The frontend implements a modern React architecture with TypeScript:

```
┌─────────────────────────────────────────────────────────────┐
│                    React Frontend                           │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Dashboard     │  │   Chat          │  │ Appointments │ │
│  │   Component     │  │   Component     │  │  Component   │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                   State Management                          │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   API Client    │  │   Auth Service  │  │   Utils      │ │
│  │   (Axios)       │  │                 │  │              │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                     UI Framework (Tailwind)                 │
└─────────────────────────────────────────────────────────────┘
```

## Technology Stack <a id="technology-stack"></a>

- **Framework**: React 18+ with TypeScript
- **Routing**: TanStack Router for type-safe routing
- **Styling**: Tailwind CSS with HeroUI components
- **State Management**: Custom hooks + TanStack Query
- **Build Tool**: Vite for fast development and building
- **Testing**: Vitest with React Testing Library
- **Internationalization**: Paraglide for multi-language support
- **HTTP Client**: Axios for API communication

## Key Features <a id="key-features"></a>

- **Component-Based Architecture**: Reusable, testable components
- **Type Safety**: Full TypeScript implementation
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Real-time Chat**: Streaming chat interface for conversational AI
- **Accessibility**: WCAG 2.1 AA compliance
- **Internationalization**: Multi-language support with runtime switching
- **Performance**: Code splitting and lazy loading optimizations

## Core Components <a id="core-components"></a>

### User Interface <a id="user-interface"></a>

| Component Category | Features                                 | Description                             |
| ------------------ | ---------------------------------------- | --------------------------------------- |
| **Chat Interface** | Real-time messaging, streaming responses | Interactive conversational AI interface |
| **Dashboard**      | User profile, appointment overview       | Central hub for user information        |
| **Appointments**   | Schedule, reschedule, cancel             | Vaccination appointment management      |
| **Workflow Graph** | Visual process flow                      | Interactive workflow visualization      |
| **Events**         | Activity tracking                        | User action and system event logging    |

### Key Capabilities <a id="key-capabilities"></a>

- **Conversational AI**: Real-time chat with streaming responses from agent services
- **Appointment Management**: Complete booking lifecycle management
- **Multi-language Support**: Dynamic language switching with persistent preferences
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Accessibility**: Screen reader support and keyboard navigation
- **Real-time Updates**: Live updates for appointment status and chat responses

## Integration <a id="integration"></a>

The frontend integrates with multiple backend services and external APIs:

- **API Services**: RESTful API consumption for data management
- **Agent Services**: WebSocket connections for real-time chat
- **Authentication**: OAuth2 token-based authentication
- **Google Maps**: Location services for clinic discovery
- **Azure Services**: Integration with cloud-based AI services
- **Browser APIs**: Speech recognition and geolocation services

## Repository Information <a id="repository-information"></a>

The frontend module is maintained as a separate repository and integrated into this project as a Git submodule. For detailed development information, component documentation, and contribution guidelines, please refer to the [Frontend Documentation](https://github.com/0Upjh80d/agents-frontend/blob/main/README.md).

> [!NOTE]
> This overview provides the essential information for understanding the frontend module's role in the multi-agents system. For detailed development guides, setup instructions, and comprehensive documentation, please refer to the frontend submodule repository.
