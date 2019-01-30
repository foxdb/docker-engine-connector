import * as rp from 'request-promise'
import * as fs from 'fs'

const https = require('https')

// need to reset the agent each time so that SSL session caching is not a problem

const requestOptions = () => ({
  headers: {
    'Content-Type': 'application/json',
    'Cache-Control': 'no-cache'
  },
  json: true,
  timeout: 6000,
  rejectUnauthorized: false, // needed if using a self-signed certificate
  pool: new https.Agent(),
  cert: fs.readFileSync('../client-cert/docker-daemon-client.pem'),
  key: fs.readFileSync('../client-cert/docker-daemon-client.key')
})

const makeAuthenticatedCall = () => {
  // certs provided correctly, call will go through
  rp({
    ...requestOptions(),
    method: 'GET',
    uri: 'https://localhost:2376/info'
  }).then(function(result) {
    console.log(result)
  })
}

const makeUnauthenticatedCall = () => {
  // no certificate = will error
  rp({
    method: 'GET',
    uri: 'https://localhost:2376/info'
  }).then(function(result) {
    console.log(result)
  })
}

makeAuthenticatedCall()
