from flask import Flask, jsonify, send_from_directory, request
import os

app = Flask(__name__)

REGISTRY_PATH = os.path.abspath("registry")


@app.route("/")
def index():
    return jsonify({
        "service": "Trivy Lab Registry",
        "status": "running",
        "warning": "demo registry without production hardening"
    })


@app.route("/debug")
def debug():
    return jsonify({
        "debug": True,
        "fake_token_present": True,
        "fake_token": "demo_token_no_real_123456",
        "note": "Este valor es falso y solo sirve para detección académica"
    })


@app.route("/download/<ecosystem>/<filename>")
def download(ecosystem, filename):
    folder = os.path.join(REGISTRY_PATH, ecosystem)
    return send_from_directory(folder, filename, as_attachment=True)


@app.route("/search")
def search():
    q = request.args.get("q", "")
    return jsonify({
        "query": q,
        "message": f"Resultado de búsqueda para: {q}"
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)