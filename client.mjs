// try and make TLS connection to socket
import tls from 'tls';
const c = tls.connect('4433', '127.0.0.1');
c.enableTrace();
c.on('error', e => {
    console.log(e);
    process.exit(-1);
})
await new Promise(r => setTimeout(r, 1000));
console.log('Success');
process.exit(0);