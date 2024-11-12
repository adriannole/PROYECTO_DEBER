from flask import Flask, render_template
import subprocess

app = Flask(__name__)

def run_code(language, command):
    try:
        result = subprocess.check_output(command, text=True, shell=True)
        return result.strip()
    except subprocess.CalledProcessError as e:
        return f"Error: {e.output}, Code: {e.returncode}"

@app.route('/')
def home():
    results = {
        "Python": run_code("Python", "python3 /app/languages/main.py"),
        "JavaScript": run_code("JavaScript", "node /app/languages/main.js"),
        "Java": run_code("Java", "javac /app/languages/Main.java && java -cp /app/languages Main"),
        "Ruby": run_code("Ruby", "ruby /app/languages/main.rb"),
        "Go": run_code("Go", "go run /app/languages/main.go")
    }
    return render_template('index.html', results=results)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
