// try and make TLS connection to socket
import tls from 'tls';
tls.connect('4433', '127.0.0.1');
console.log('Success');
process.exit(0);