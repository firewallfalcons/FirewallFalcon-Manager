A high-performance C++ TCP proxy.




Usage:


  ./FirewallFalconProxy [OPTION...] positional parameters

  -b, --backend arg  Backend server address (host:port)

  
  -s, --status arg   HTTP status code to respond with (101 or 200)(default: 101)
  
  -h, --help         Print usage

```
./FirewallFalconProxy -b 127.0.0.1:22 -s 200 80 8080 8888
```

