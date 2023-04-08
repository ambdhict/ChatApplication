<?php
    session_start();

    // require('../app.php');
	
	function logged_in_acct() {
		return isset($_SESSION['id']);
	}

	function confirm_logged_in_acct() 
	{
		if (!logged_in_acct()){ 
            header('location:../index.php');
        }
	}

    include('../_authentication/login.php');
    $sessionId=$_SESSION["id"];
    confirm_logged_in_acct();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Chat System | Dashboard</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../_public/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../_public/dist/css/adminlte.min.css">
    </head>
    <body class="hold-transition layout-top-nav">
        <div class="wrapper">
            <div class="content-wrapper">
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4"></div>
                            <div class="col-lg-4">
                                <!-- DIRECT CHAT -->
                                <div class="card direct-chat direct-chat-primary mt-5">
                                    <div class="card-header">
                                        <h3 class="card-title"><?php echo $_SESSION['name'];  ?></h3>

                                        <div class="card-tools">
                                            <span title="3 New Messages" class="badge badge-primary">3</span>
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" title="Contacts" data-widget="chat-pane-toggle">
                                                <i class="fas fa-comments"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div> <!-- /.card-header -->
                                    <div class="card-body">
                                        <!-- Conversations are loaded here -->
                                        <div class="direct-chat-messages" id="chatbox" style="height:500px">

                                        </div><!--/.direct-chat-messages-->
                                    </div> <!-- /.card-body -->
                                    <div class="card-footer">
                                        <form action="../_authentication/sendmessage.php" method="post" id="frmMess">
                                            <div class="input-group">
                                                <input type="hidden" name="userid" id="userid" class="form-control" value="<?php echo $sessionId; ?>" required>
                                                <input type="text" name="message" id="message" placeholder="Type Message Here ..." class="form-control" required>
                                                <span class="input-group-append">
                                                    <button type="submit" id="send" name="submit" class="btn btn-primary">Send</button>
                                                </span>
                                            </div>
                                        </form>
                                    </div> <!-- /.card-footer-->
                                </div> <!--/.direct-chat -->
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../_public/plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="../_public/plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
        $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="../_public/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../_public/dist/js/adminlte.js"></script>
        <script src="../_public/js/dashboard.js"></script>
    </body>
</html>





