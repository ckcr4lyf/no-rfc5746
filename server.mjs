import net from 'net';

// Reference - https://tls12.xargs.org/#server-hello/annotated
const serverHello = Buffer.from([
    0x16,
    0x03, 0x03,
    0x00, 0x2c,
    0x02,
    0x00, 0x00, 0x28,
    0x03, 0x03,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00,
    0xC0, 0x13,
    0x00,
    0x00, 0x00 // NO EXTENSIONS!
]);

const server = new net.Server();

server.listen('4433', '0.0.0.0', () => {
    console.log(`started on :4433`);
})

server.on('connection', (socket) => {
    socket.on('data', chunk => {
        socket.write(serverHello); // For literally any data we respond with the Server Hello. For just a PoC it is fine
    });
    socket.on('end', function() {
        console.log('Closing connection with the client');
    });
    socket.on('error', function(err) {
        console.log(`Error: ${err}`);
    });
})
