From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Wed, 01 Feb 2017 19:56:59 +0530
Message-ID: <1485959219.8977.1.camel@debian.org>
References: <20170130105749.17338-1-rrs@debian.org>
         <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
         <1485863265.11199.3.camel@debian.org>
         <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34794 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbdBAO1E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 09:27:04 -0500
Received: by mail-pf0-f193.google.com with SMTP id y143so31938768pfb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2017 06:27:03 -0800 (PST)
In-Reply-To: <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Wed, 2017-02-01 at 13:25 +0200, Andy Shevchenko wrote:
> We have Yoga 900 here and I just played with it.
> So, can you do the following:
> 1. Boot system to a text mode (no X).
> 2. Be sure that ideapad_lenovo module is loaded
> 3. By looking into output of
> % ls -l /sys/class/input
> find VPC2004 related *event* number (/.../eventX/...)
> 4. Run
> % od -x /dev/input/eventX
> 5. Ensure that you get events (hex dump) when you bend the cover.
> 
> We can continue after you try the above.
> 

Fantastic. In that case, I hope you can help enable SW_TABLET_MODE for ideapad
driver too.

Here's what you asked for:

root@learner:/sys/class/input# ls * -l
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event0 -> ../../devices/platform/i8042/serio0/input/input0/event0
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event1 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C0C:00/input/input3/event1
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event10 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input12/event10
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event11 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input13/event11
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event12 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input14/event12
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event13 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input15/event13
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event14 -> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/input/input16/event14
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event15 -> ../../devices/pci0000:00/0000:00:14.0/usb2/2-5/2-5:1.0/0003:04F3:0303.0001/input/input17/event15
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event2 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C0D:00/input/input4/event2
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event3 -> ../../devices/LNXSYSTM:00/LNXPWRBN:00/input/input5/event3
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event4 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7/event4
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event5 -> ../../devices/platform/i8042/serio1/input/input6/event5
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event6 -> ../../devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input8/event6
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event7 -> ../../devices/platform/pcspkr/input/input9/event7
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event8 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input10/event8
lrwxrwxrwx 1 root root 0 Feb  1 19:33 event9 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input11/event9
lrwxrwxrwx 1 root root 0 Feb  1 19:32 input0 -> ../../devices/platform/i8042/serio0/input/input0
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input10 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input10
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input11 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input11
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input12 -> ../../devices/pci0000:00/0000:00:1b.0/sound/card1/input12
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input13 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input13
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input14 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input14
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input15 -> ../../devices/pci0000:00/0000:00:03.0/sound/card0/input15
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input16 -> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/input/input16
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input17 -> ../../devices/pci0000:00/0000:00:14.0/usb2/2-5/2-5:1.0/0003:04F3:0303.0001/input/input17
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input3 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C0C:00/input/input3
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input4 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C0D:00/input/input4
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input5 -> ../../devices/LNXSYSTM:00/LNXPWRBN:00/input/input5
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input6 -> ../../devices/platform/i8042/serio1/input/input6
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input7 -> ../../devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input8 -> ../../devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input8
lrwxrwxrwx 1 root root 0 Feb  1 19:33 input9 -> ../../devices/platform/pcspkr/input/input9
lrwxrwxrwx 1 root root 0 Feb  1 19:33 mice -> ../../devices/virtual/input/mice
lrwxrwxrwx 1 root root 0 Feb  1 19:33 mouse0 -> ../../devices/platform/i8042/serio1/input/input6/mouse0
lrwxrwxrwx 1 root root 0 Feb  1 19:33 mouse1 -> ../../devices/pci0000:00/0000:00:14.0/usb2/2-5/2-5:1.0/0003:04F3:0303.0001/input/input17/mouse1


root@learner:/sys/class/input# od -x /dev/input/event6
?0000000 ee33 5891 0000 0000 2bd9 0005 0000 0000
^@0000020 0004 0004 0042 0000 ee33 5891 0000 0000
0000040 2bd9 0005 0000 0000 0001 00c1 0001 0000
0000060 ee33 5891 0000 0000 2bd9 0005 0000 0000
0000100 0000 0000 0000 0000 ee33 5891 0000 0000
0000120 2c09 0005 0000 0000 0001 00c1 0000 0000
0000140 ee33 5891 0000 0000 2c09 0005 0000 0000
0000160 0000 0000 0000 0000 ee37 5891 0000 0000
0000200 3d7e 000f 0000 0000 0004 0004 0043 0000
0000220 ee37 5891 0000 0000 3d7e 000f 0000 0000
0000240 0001 00c0 0001 0000 ee37 5891 0000 0000
0000260 3d7e 000f 0000 0000 0000 0000 0000 0000
0000300 ee37 5891 0000 0000 3dae 000f 0000 0000
0000320 0001 00c0 0000 0000 ee37 5891 0000 0000
0000340 3dae 000f 0000 0000 0000 0000 0000 0000



> > Sorry about that. I am no kernel developer, just wanting to fix my hardware.
> > 
> > I looked into the doc. The documentation mentions the sysfs path:
> > '/sys/devices/platform/ideapad/fan_mode', which is what we would also want
> > to
> > use.
> > 
> > But the driver only shows the interface through:
> > '/sys/devices/platform/devices/VPC2004:00/'
> > 
> > Is this an expected behavior ?
> 
> Driver is old, perhaps it's not fixed part, perhaps it's by design.
> 
> > Please find attached revised patch along with write support and ABI
> > Documentation changes.
> 
> Next time please avoid attachments here.

Okay. I'll figure out how to do that. By the way, does the patch make sense for
inclusion ? To have an interface for touchpad mode ?

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAliR8DMACgkQpjpYo/Lh
dWkhlQ/+LAY58rMdSVlJNFFnK0/CyUuSn5vBu8JQF2xN6tSAQuTyFq3i0HfrR0/d
h44rf1RNpTpljwxvvnKtDiwiInF+u7vtCU+CbMxbqMdruf0cAX1k6O27Cup78yLu
9Ht2tuZyID5zTb0mXUFGjSo2sEwRCZXhHPpiiyQlksTlY+CcqJTUWQgENvyF0bkX
2r2pBQAZo69eiZjpuqp0D6DZV6CNVjuh1EWN2f/DC+05KfvIp8es3wfr35/K9BfH
pyi2geOZ4yzOiUPPferW/TXNIWKrm2GRiWzpa8GnEHfLWMMWeRT/xYq3KviXzRbq
Hr5wDDkDnLZtc0J7pEX+8M1ycpyLKOiJ65ZQl/erRtU/u8Ji7Xjrhtn3hRIQO9fh
SiizDRPlJ3nlcnKPlTGe4M2/3yZ+idEup+ttFR6DdELeOA9IYiGJMu9OMaHonmuo
r2jZ0sn+2KuwPge/A9jI3pyAhjKypJ0p+0/+u1y6bglrjaGoh4llcOqBW3gMi69N
dR5GiPCXwHxXb16rFM3Hwy7MgEBxgXtn72Q3ThOUotuh8Z6ramYOldtMGFO/Deco
b147oQtpGmXVmPamqrDdf4z+HqBwRgj9SJ0mtwmi3U7mcpv5LWZcOSImkp8uKx52
bCKGLaakiSYUhP3KZ07d+DyhF4tfCPBSV2Jn3CCwtb1ZKhO0sTk=
=IETm
-----END PGP SIGNATURE-----
