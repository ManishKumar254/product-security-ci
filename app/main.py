from flask import Flask

app = Flask(__name__)

# Root endpoint
@app.get("/")
def hello():
    return {"status": "ok", "app": "demo"}

# Health-check endpoint
@app.get("/health")
def health():
    return {"status": "healthy", "uptime": "running"}

# Version endpoint  huihuihui
@app.get("/version")
def version():
    return {"app": "demo", "version": "1.0.0"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
