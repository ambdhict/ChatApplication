<?php

use React\EventLoop\Loop;

// autoload for local project development or project installed as dependency for reactphp/reactphp
(@include __DIR__ . '/../../vendor/autoload.php') || require __DIR__ . '/../../../../autoload.php';

Loop::futureTick(function () {
    echo 'b';
});
Loop::futureTick(function () {
    echo 'c';
});
echo 'a';
