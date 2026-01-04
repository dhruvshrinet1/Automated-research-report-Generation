# Autonomous Research Report Generator 🤖🔍

A powerful, multi-agent AI system that conducts interviews with expert personas, browses the web for real-time data, and synthesizes comprehensive research reports in PDF/DOCX formats.

![Dashboard Preview](https://via.placeholder.com/800x400?text=Autonomous+Research+Agent+Dashboard)
*(Replace with actual screenshot)*

## 🚀 Features

*   **Multi-Agent Architecture**: Built with **LangGraph**, simulating a team of analysts (e.g., "Tech Skeptic", "Market Futurist") who debate and investigate topics.
*   **Cyclic Workflows**: Utilizing a "Manager" graph for high-level planning and an "Interview" subgraph for deep-dive research loops.
*   **Real-Time Web Search**: Integrated with **Tavily API** to fetch the latest information, ensuring reports aren't limited to the model's training data.
*   **Premium Web UI**: A responsive, dark-mode Interface built with FastAPI and Vanilla CSS (Glassmorphism design).
*   **Human-in-the-Loop**: Optional feedback mechanism to guide analysts during the research process.
*   **Automated Export**: Generates professional PDFs and DOCX files automatically.
*   **Docker Ready**: Fully containerized for easy deployment.

## 🛠️ Tech Stack

*   **Language**: Python 3.11+
*   **Orchestration**: LangGraph, LangChain
*   **Backend**: FastAPI, Uvicorn
*   **Frontend**: HTML5, Jinja2, CSS3 (Variables & Glassmorphism)
*   **Search**: Tavily Search API
*   **LLMs**: OpenAI (GPT-4), Google (Gemini), Groq (Llama 3)
*   **DocumentGen**: ReportLab, Python-Docx

## 🔧 Installation & Setup

### Prerequisites

*   Python 3.11+
*   Git
*   API Keys: OpenAI, Tavily (Required), Google/Groq (Optional)

### Option 1: Docker (Recommended) 🐳

1.  **Clone the repository**
    ```bash
    git clone https://github.com/dhruvshrinet1/Automated-research-report-Generation.git
    cd Automated-research-report-Generation
    ```

2.  **Configure Environment**
    Create a `.env` file from the example:
    ```bash
    cp .env.example .env
    ```
    Open `.env` and add your API keys:
    ```env
    OPENAI_API_KEY=sk-...
    TAVILY_API_KEY=tvly-...
    ```

3.  **Run with Docker Compose**
    ```bash
    docker-compose up --build
    ```

4.  **Access the App**
    Open your browser to `http://localhost:8000`.

### Option 2: Local Installation 🐍

1.  **Clone and Navigate**
    ```bash
    git clone https://github.com/dhruvshrinet1/Automated-research-report-Generation.git
    cd Automated-research-report-Generation
    ```

2.  **Create Virtual Environment**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: venv\Scripts\activate
    ```

3.  **Install Dependencies**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Configure Environment**
    ```bash
    cp .env.example .env
    # Edit .env with your keys
    ```

5.  **Run the Server**
    ```bash
    uvicorn research_analysis.api.main:app --reload --port 8000
    ```

## 📂 Project Structure

```
├── research_analysis/
│   ├── api/                 # FastAPI routes and templates
│   ├── workflows/           # LangGraph agent definitions
│   │   ├── report_generator_workflow.py  # Main parent graph
│   │   └── interview_workflow.py         # Subgraph for interviews
│   ├── utils/               # Config and Model loaders
│   └── config/              # YAML configurations
├── static/                  # CSS and Assets
├── logs/                    # Application logs
├── generated_report/        # Output PDFs/DOCXs
├── Dockerfile
├── docker-compose.yml
└── requirements.txt
```

## 📖 How It Works

1.  **Plan**: The system generates "Analyst Personas" based on your topic.
2.  **Interview**: Each analyst asks questions to an "Expert Agent" (which calls Tavily Search).
3.  **Synthesize**: The insights are collected and structured into sections (Intro, Body, Conclusion).
4.  **Compile**: The final text is formatted into a PDF report.

## 🤝 Contributing

1.  Fork the repo
2.  Create your feature branch (`git checkout -b feature/amazing-feature`)
3.  Commit your changes (`git commit -m 'Add some amazing feature'`)
4.  Push to the branch (`git push origin feature/amazing-feature`)
5.  Open a Pull Request

