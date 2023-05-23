# no-rfc5746

Just a simple TLS server which does not support secure renegotiation (https://www.rfc-editor.org/rfc/rfc5746).

This is useful to test TLS clients which need to be able to connect to such servers, as newer TLS libraries (such as OpenSSLv3) may return an error by default.
