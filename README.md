# DARK NOIZE

Destroy logs on your router without admin privileges. 

Have a happy, clean home with a mess in logs of your ISP and the storage of your gateway!

# INTRO

Sometimes you don't have access to the administration panel of your router, but you really need to
destroy everything that is stored in the log files on the harddrive of this device. 

Including timestamps of the requests, URLs, IP address that you actually have requested or somebody before you maybe initially requested.

How to destroy all this data?

Overwrite it with the new one.

DarkNoize generates a lot of "noize traffic" that will be later on processed by your internet gateway a.k.a. router.

For instance the box that was installed by somebody else inside your rented flat or room in some random hotel.

You can run DarkNoize in parallel with your main activity. 

In this way you will try to eliminate the need of SOCKS or Proxy or VPN server usage. Why?

The real internet traffic traces will be buried inside multiple trash records that the program generates.

Later on the logrotator inside of the router will do the rest of the job.

Old log records and traces will be replaced by the new trash records that were generated by DarkNoize. 

It means that all info about your internet surfing will be destroy on the device that you are currently using as in
Internet Gateway a.k.a. router or the box somewhere in the corner of your rented flat with the criminal-minded sex-addicted fagot and junkie that used to be the previous renter of the crippy living space that you are occupy right now.

# Can I Be Sniffed?

Yes. But you will fuck the brain of the sniffer completely. 

# Is It Ilegal?

No. Absolutely Legal 100%

# How To Use It Properly?

Just run the noize generator in advance, for instance before having lunch or going to bed and then keep the terminal window with it opened while doing your main activities like internet surfing or web-development or servers management using SSH.

# Can It Be Combined With VPN? HTTP/S PROXIES? SOCKS4/5?

No. You cant combine it with this technologies of restrictions bypassing. It must be stopped because you are just starting to overload the dedicated channel.

But you are free to combine it with TOR.

If you cannot use TOR in your Country for some reason, there are some chances to bypass these restrictions with the help of HTTP/S or SOCKS4/5 proxy.

Take a look at this solution if you want to deploy your own SOCKS5 server.

I strictly recommend you to use DarkNoize in parallel with your TOR browser and darknet traversing.

# REQUIREMENTS

Ruby 3.2.2

# INSTALL  

```
$ ./installer.sh
```

Then you have to logout or reopen your terminal window

# RUN

```
$ darknoize
```

# EOF


