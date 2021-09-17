<html>
    <body>
        USER LOGIN !
        <br>
        <br>
        <div id="time">

        </div>

        <br>
        <br>
        <div>
            <marquee>Made With love by Aman Chouhan</marquee>
        </div>
        <script type="text/javascript">
        function updateTime(){
            document.getElementById("time").innerText = new Date().toString();
        }

        setInterval(updateTime,1000);
        </script>


    </body>
</html>