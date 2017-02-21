# requests is not builtin in Python.
# Install it by doing 'pip install requests'

import requests

requests.post('https://api.cilamp.se/v1/testsystem', {'color': '#00ff00'})
