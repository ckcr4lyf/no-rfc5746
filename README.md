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

<details>

<summary> Example with oenssl s_client (OpenSSL 3.0.8 7 Feb 2023) </summary>

```
$ openssl s_client -connect 127.0.0.1:4433
CONNECTED(00000003)
40271E309C7F0000:error:0A000152:SSL routines:final_renegotiate:unsafe legacy renegotiation disabled:ssl/statem/extensions.c:893:
---
no peer certificate available
---
No client certificate CA names sent
---
SSL handshake has read 49 bytes and written 304 bytes
Verification: OK
---
New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.2
    Cipher    : 0000
    Session-ID:
    Session-ID-ctx:
    Master-Key:
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    Start Time: 1684839458
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
---
```

</details>