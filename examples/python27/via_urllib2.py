# urllib and urllib2 are Python builtin libraries

import urllib
import urllib2

data = urllib.urlencode({'color': '#ff00ff'})
req = urllib2.Request('https://api.cilamp.se/v1/testsystem', data)
urllib2.urlopen(req).read()
