# API Module Overview

This document provides a high-level overview of the API component in the multi-agents project. The API module is maintained as a separate repository and integrated as a submodule.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Key Features](#key-features)
- [API Endpoints](#api-endpoints)
- [Integration](#integration)
- [Repository Information](#repository-information)

## Overview <a id="overview"></a>

The API module delivers a robust FastAPI-based backend service that handles health data, vaccination appointments, user authentication, and business logic for the multi-agents vaccination booking system.

## Architecture <a id="architecture"></a>

The API implements a modern FastAPI architecture with the following layers:

```
┌─────────────────────────────────────────────────────────────┐
│                    FastAPI Backend                          │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Auth Routes   │  │   Booking       │  │ Translation  │ │
│  │                 │  │   Routes        │  │   Routes     │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
├─────────────────────────────────────────────────────────────┤
│                   Business Logic Layer                      │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Data Access   │  │   Azure AI      │  │   Validation │ │
│  │   Layer (ORM)   │  │   Services      │  │   & Schemas  │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
├─────────────────────────────────────────────────────────────┤
│              SQLite/PostgreSQL Database                     │
│                   + Cosmos DB (Audit)                       │
└─────────────────────────────────────────────────────────────┘
```

## Technology Stack <a id="technology-stack"></a>

- **Framework**: FastAPI 0.115+ with async support
- **Database**: SQLite (development) / PostgreSQL (production)
- **Audit Database**: Azure Cosmos DB with MongoDB API
- **Validation**: Pydantic v2 for type safety
- **Authentication**: OAuth2 with JWT tokens
- **AI Services**: Azure OpenAI, Azure Speech Services
- **Testing**: pytest with async support
- **Documentation**: OpenAPI/Swagger auto-generation

## Key Features <a id="key-features"></a>

- **RESTful API Design**: Clear, consistent endpoint patterns
- **Type Safety**: Full Pydantic models for request/response validation
- **Security First**: Comprehensive authentication with FHIR-compliant audit logging
- **Async Performance**: High-concurrency request handling
- **Azure Integration**: Native integration with Azure AI services
- **Multilingual Support**: Translation and language detection capabilities
- **Speech Processing**: Speech-to-text transcription services

## API Endpoints <a id="api-endpoints"></a>

### Core Services <a id="core-services"></a>

| Category            | Endpoints           | Description                          |
| ------------------- | ------------------- | ------------------------------------ |
| **Health & Status** | `/`, `/health`      | Service health monitoring            |
| **Authentication**  | `/signup`, `/login` | User registration and authentication |
| **Bookings**        | `/bookings/*`       | Vaccination appointment management   |
| **Records**         | `/records/*`        | Vaccination history tracking         |
| **Users**           | `/users/*`          | User profile management              |
| **Clinics**         | `/clinics/*`        | Clinic location services             |
| **Vaccines**        | `/vaccines/*`       | Vaccine recommendations              |
| **Translation**     | `/translate/*`      | Language services                    |
| **Transcription**   | `/transcription`    | Speech-to-text conversion            |

### Key Capabilities <a id="key-capabilities"></a>

- **Booking Management**: Schedule, reschedule, and cancel vaccination appointments
- **Clinic Discovery**: Find nearest clinics by location or postal code
- **Vaccine Recommendations**: AI-powered vaccine suggestions based on user profile
- **Multilingual Support**: Real-time translation and language detection
- **Speech Processing**: Convert voice input to text for accessibility
- **Audit Compliance**: FHIR-compliant audit logging for healthcare regulations

## Integration <a id="integration"></a>

The API integrates with multiple Azure services and external systems:

- **Azure OpenAI**: Language processing and translation
- **Azure Speech Services**: Speech-to-text transcription
- **Azure Key Vault**: Secure credential management
- **Azure Cosmos DB**: Audit trail storage
- **Frontend Applications**: RESTful API consumption
- **Agent Services**: Backend support for conversational AI

## Repository Information <a id="repository-information"></a>

The API module is maintained as a separate repository and integrated into this project as a Git submodule. For detailed development information, API documentation, and contribution guidelines, please refer to the [API Endpoints Documentation](https://github.com/0Upjh80d/agents-api/blob/main/docs/REVIEWERS_STEP_BY_STEP.md).

 <!-- link it to the github instead -->

> [!NOTE]
> This overview provides the essential information for understanding the API module's role in the multi-agents system. For detailed development guides, setup instructions, and comprehensive documentation, please refer to the API submodule repository.
