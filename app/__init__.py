from flask import Flask

from config import Config
from .routes import main_bp


def create_app(test_config=None):
    app = Flask(__name__)
    app.config.from_object(Config)

    if test_config:
        app.config.update(test_config)

    app.register_blueprint(main_bp)
    return app


app = create_app()