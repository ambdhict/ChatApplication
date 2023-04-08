<?php
    namespace MyApp;

    use Ratchet\MessageComponentInterface;
    use Ratchet\ConnectionInterface;

    class Socket implements MessageComponentInterface {
        protected $clients;

        public function __construct()
        {
            $this->clients = new \SplObjectStorage;
        }
    
        public function onOpen(ConnectionInterface $conn) {
            // Store the new connection in $this->clients
            $this->clients->attach($conn);
    
            echo "New connection! ({$conn->resourceId})\n";
        }
    
        public function onMessage(ConnectionInterface $from, $msg) {

            $data = json_decode($msg, true);
    
            foreach ($this->clients as $client ) {
    
                // if ( $from->resourceId == $client->resourceId ) {
                //     continue;
                // }

                if($from !== $client){
                    $client->send(json_encode($data));
                }
            }
        }
    
        public function onClose(ConnectionInterface $conn) {
            // The connection is closed, remove it, as we can no longer send it messages
            $this->clients->detach($conn);
    
            echo "Connection {$conn->resourceId} has disconnected\n";
        }
    
        public function onError(ConnectionInterface $conn, \Exception $e) {
            echo "An error has occurred: {$e->getMessage()}\n";
    
            $conn->close();
        }
    }

?>