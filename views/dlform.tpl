<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!--link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"-->

    <title>My Remote</title>

  <style>
.button {
  width: 100%;
  background-color: DodgerBlue;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  box-shadow: 0 9px #999;
  font-size: 20px;
  font-weight: bold;
}

.buttonoffon {
  width: 100%;
  background-color: #0a2351;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  box-shadow: 0 9px #999;
  font-size: 20px;
  font-weight: bold;
}

.button:hover {background-color: RoyalBlue}
.buttonoffon:hover {background-color: RoyalBlue}

.button:active {
  background-color: #3366ff;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.buttonoffon:active {
  background-color: #3366ff;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  box-shadow: 0 9px #999;
}

input[type=submit]:hover {
  background-color: #45a049;
}

input[type=submit]:active {
  background-color: #3366ff;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
  </style>
<link rel="apple-touch-icon" sizes="180x180" href="/static/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/static/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/static/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
  </head>
  <body>

    <h3 id="ret_string">{{ ret_string }} </h3>
    <br>
    <div>
      <form action="https://192.168.1.252/" method="get" target="_blank">
         <input type="submit" value="Family Room Player">
      </form><p>
      <form action="http://192.168.1.249/" method="get" target="_blank">
         <input type="submit" value="Office Music Player">
      </form><p>


    <table width="100%">
     <tr>  
           <td> <button id="/onkyocmd2" class="buttonoffon" name="ON">ON</button> </td>
           <td> <button id="/onkyocmd2" class="button" name="VOLUP"> Volume Up</button> </td>

     </tr>

     <tr>  
           <td> <button id="/onkyocmd2" class="buttonoffon" name="OFF">OFF</button> </td>
           <td> <button id="/onkyocmd2" class="button" name="VOLDOWN">Volume Down</button> </td>
     </tr>
     <tr>  <td colspan=2> <button id="/onkyocmd2" class="button" name="MUTE">Mute</button> </td></tr>
     <tr> <td style="text-align: center; font-size: 20px; font-weight:bold" colspan=2>Sources </td> </tr>

     </tr>

    </table>
     <table width="100%">

     <tr>  <td> <button id="/onkyocmd2" class="button" name="SET_VOLUMIO_SOURCE">Volumio</button> </td>
           <td> <button id="/onkyocmd2" class="button" name="SET_FIRETV_SOURCE">FireTV</button> </td>
           <td> <button id="/onkyocmd2" class="button" name="SET_DVD_SOURCE">DVD</button> </td>

     </tr>
    </table>

    </table>
     <table width="100%">
     <tr> <td style="text-align: center; font-size: 20px; font-weight:bold" colspan=3>Output </td> </tr>
     <tr>  
   <td> <button id="/onkyocmd2" class="button" name="SET_STEREO">Stereo</button> </td>
   <td> <button id="/onkyocmd2" class="button" name="SET_DIRECT">Direct</button> </td>
   <td> <button id="/onkyocmd2" class="button" name="SET_PURE_AUDIO">Pure Audio</button> </td>
     </tr>
    </table>

      </div>
      <div>
       <h3>Async Youtube Video Downloader </h3>
        <form action="/dlurl" method="post">
            URL: <input name="youtube_url" type="text" />
         % for mtype in musictypes:
           <input type="radio" id={{mtype}} name="musictype" value={{mtype}}>
           <label for={{mtype}}">{{mtype}}</label>
         % end

         <input value="Get" type="submit" />
        </form>
        <br>
      <form action="/dlurl_log" method="get" target="_blank">
         <input type="submit" value="Download Log">
      </form>

        <br>
      <form action="/app_log" method="get" target="_blank">
         <input type="submit" value="App Log">
      </form>
        <br>
      <form action="/static/nmap.html" method="get" target="_blank">
         <input type="submit" value="Show Devices Output">
      </form>

      </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

$(document).ready(function() {

  $("button").click(function() {

    $.post(this.id, {the_command : this.name}, function(data,status) { // alert("Data:" + data + " Status " + status);

         document.getElementById("ret_string").innerHTML = data
     })
  })
})

</script>


  </body>
</html>

