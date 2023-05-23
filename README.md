# no-rfc5746

Just a simple TLS server which does not support secure renegotiation (https://www.rfc-editor.org/rfc/rfc5746).

This is useful to test TLS clients which need to be able to connect to such servers, as newer TLS libraries (such as OpenSSLv3) may return an error by default.


## Usage

Just run the server via `node server.mjs` , and then try to connect to it via a TLS client.

By default, this would fail on OpenSSL >3 , and it is OK on OpenSSL 1.1.1

<details>

<summary> Example with cURL (openSSL 3.0.8) </summary>

```
$ curl -v https://127.0.0.1:4433
*   Trying 127.0.0.1:4433...
* Connected to 127.0.0.1 (127.0.0.1) port 4433 (#0)
* ALPN: offers h2,http/1.1
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/certs/ca-certificates.crt
*  CApath: none
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (OUT), TLS alert, handshake failure (552):
* OpenSSL/3.0.8: error:0A000152:SSL routines::unsafe legacy renegotiation disabled
* Closing connection 0
curl: (35) OpenSSL/3.0.8: error:0A000152:SSL routines::unsafe legacy renegotiation disabled
```

</details>