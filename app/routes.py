from flask import Blueprint, jsonify


main_bp = Blueprint("main", __name__)


@main_bp.route("/")
def home():
    return "CI/CD Working Automatically 🚀"


@main_bp.route("/health")
def health():
    return jsonify(status="UP")