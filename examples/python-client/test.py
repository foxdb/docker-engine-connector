#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import httplib
import ssl

ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)
ssl_context.check_hostname = False

connection = httplib.HTTPSConnection(
    "localhost:2376", cert_file='../../client-cert/docker-daemon-client.pem', context=ssl_context)
connection.request("GET", "/info")
response = connection.getresponse()
print response.status, response.reason
data = response.read()
print data
