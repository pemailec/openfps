print "////////////////////////////////////////"
print "OPENFPS UPDATE CHECKER"
print "////////////////////////////////////////"

print "Connecting..."
import socket
import os
import urllib
import time

url = urllib.URLopener()
resp = url.open('https://openfps.googlecode.com/svn/trunk/openfps/')
print "Server https://openfps.googlecode.com/svn/trunk/openfps/"

print "////////////////////////////////////////"
print "FileList:"

html = resp.read(114)

end = html.find("</title>")
start = html.find("<title>")+7
      
time.sleep(0.5)


print html[start:end].strip()

for dirname, dirnames, filenames in os.walk('.'):
    for subdirname in dirnames:
        print os.path.join(dirname, subdirname)
    for filename in filenames:
        print os.path.join(dirname, filename)
print "////////////////////////////////////////"
print " ... Checkout test complete."
raw_input("enter key to exit...")
