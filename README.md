# Ava: A Multimodal Conversational AI Agent with Chainlit Interface

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains the code for **Ava**, a personal project I developed to explore multimodal conversational AI, focusing on voice and image interaction through a web interface built with **Chainlit**. Inspired by the movie Ex Machina and the concept of AI interaction, Ava demonstrates the integration of various AI models for a richer conversational experience.

## Key Features

Ava can:

* **Understand Voice:** Process audio input using Speech-to-Text (STT).
* **Recognize Images:** Analyze image content using Vision Language Models (VLMs).
* **Respond with Voice Notes:** Generate and send audio responses using Text-to-Speech (TTS).
* **Simulate "Daily Activities":** Provide updates and even share images related to these simulated activities.
* **Interactive Web Interface:** Features a user-friendly chat interface built with **Chainlit** for interacting with the agent.

This project showcases my ability to build AI applications that handle multiple input and output modalities, all accessible through an intuitive web interface.


## Tech Stack

This project leverages a range of powerful technologies:

* **Core AI Models:** Powered by **Groq**'s incredibly fast inference for **Llama 3.3**, **Llama 3.2 Vision**, and **Whisper**.
* **Long-Term Memory:** Implemented using **Qdrant** as a vector database for persistent conversational context.
* **Workflow Orchestration:** Built using **LangGraph** to manage complex agent interactions.
* **Text-to-Speech:** Utilizes **ElevenLabs** for realistic voice generation.
* **Image Generation:** Explores generative models (like FLUX) for creating images.
* **Vision Language Model:** Integrates **llama-3.2-vision** for understanding image content.
* **Web Interface:** Built with **Chainlit** for interactive chat sessions.

## Getting started
 
First configure the api key in the .env file 

Run the command - powershell.exe -command "./run_tasks.bat" 

This commands executes the bat file but make sure to install the docker desktop

## Project Insights

This project allowed me to gain practical experience in:

* Designing and implementing multimodal AI agent workflows using LangGraph.
* Integrating and managing different AI models for various modalities (text, audio, vision).
* Building a robust memory system for conversational agents.
* Developing interactive web interfaces for AI applications using Chainlit.

## License

This project is licensed under the [MIT License](LICENSE) - see the `LICENSE` file for details.