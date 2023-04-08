$(function(){
    // Start the Ratchet Server
    $.ajax({
        url: '../app.php',
        success: function(response) {
            console.log(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });

    $.ajax({
        url: '../_authentication/getallmessage.php',
        type: 'GET',
        dataType: 'json',
        success: function(result){
            var userid = $('#userid').val();
            var chat = $('#chatbox');

            for (var i = 0; i < result.length; i++) {
                var divToAdd = "";
                if(userid == result[i].userid){
                    divToAdd += `<div class="direct-chat-msg right">
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-name float-right">${result[i].username}</span>
                                        <span class="direct-chat-timestamp float-left">${result[i].datecreated}</span>
                                    </div>
                                    <img class="direct-chat-img" src="../_public/dist/img/user3-128x128.jpg" alt="message user image">
                                    <div class="direct-chat-text">
                                        ${result[i].message}
                                    </div>
                                </div>`;
                } else {
                    divToAdd += `<div class="direct-chat-msg">
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-name float-left">${result[i].username}</span>
                                        <span class="direct-chat-timestamp float-right">${result[i].datecreated}</span>
                                    </div>
                                    <img class="direct-chat-img" src="../_public/dist/img/user3-128x128.jpg" alt="message user image">
                                    <div class="direct-chat-text">
                                        ${result[i].message}
                                    </div>
                                </div>`;
                }

                chat.append(divToAdd);
            }
            
        },
        error: function(xhr, status, error){
            console.log(error);
        }
    })

    // Create a new WebSocket.
    const socket  = new WebSocket('ws://localhost:8080');

    // Check if connection is open
    socket.onopen = function(e){
        console.log('Connection Established');
    }

    socket.onmessage = function(event) {
        var data = JSON.parse(event.data);
        // console.log(event);

        var chat = $('#chatbox');

        var divToAdd = "";

        divToAdd += `<div class="direct-chat-msg">
                        <div class="direct-chat-infos clearfix">
                            <span class="direct-chat-name float-left">${data.username}</span>
                            <span class="direct-chat-timestamp float-right">${data.datecreated}</span>
                        </div>
                        <img class="direct-chat-img" src="../_public/dist/img/user3-128x128.jpg" alt="message user image">
                        <div class="direct-chat-text">
                            ${data.message}
                        </div>
                    </div>`;

        chat.append(divToAdd);
    };

    $('#frmMess').submit(function(e){
        e.preventDefault();
        var formData = new FormData(e.target);
        let btn = $("#send");
        var userid = $('#userid').val();
        var message = $('#message').val();
    
        $.ajax({
            url: $(this).attr("action"),
            method: $(this).attr("method"),
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
                btn.attr({ disabled: true }).html("<span class='spinner-border spinner-border-sm'></span> Sending...");
            },
            success: function (response) {

                    var data = JSON.parse(response);

                    var chat = $('#chatbox');
                    var divToAdd = "";

                    divToAdd += `<div class="direct-chat-msg right">
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-name float-right">${data.username}</span>
                                        <span class="direct-chat-timestamp float-left">${data.datecreated}</span>
                                    </div>
                                    <img class="direct-chat-img" src="../_public/dist/img/user3-128x128.jpg" alt="message user image">
                                    <div class="direct-chat-text">
                                        ${data.message}
                                    </div>
                                </div>`;
            
                    chat.append(divToAdd);

                    btn.attr({ disabled: false }).html("Send");

                    // console.log(data.id);
                    // console.log(data);

                    socket.send(JSON.stringify(data));
                // }
            },
            error: function (error) {
                swalAlert("error", error.responseText, '2');
                btn.attr({ disabled: true }).html("Send");
            }
        });
    });

    // Check if connection is error
    socket.onerror = function(e){
        console.log(e);
    }

    // Check if connection on close
    socket.onclose = function(e){
        alert("Connection is closed please reload!");
    }
});

