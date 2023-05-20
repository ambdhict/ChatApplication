<?php

    use Ratchet\Server\IoServer;
    use Ratchet\Http\HttpServer;
    use Ratchet\WebSocket\WsServer;
    // old
    // use MyApp\Socket;
    // new when deployed to server
    use MyApp\Socket\socket.php;

    require dirname( __FILE__ ) . '/vendor/autoload.php';

    $server = IoServer::factory(
        new HttpServer(
            new WsServer(
                new Socket()
            )
        ),
        8080
    );

    $server->run();
