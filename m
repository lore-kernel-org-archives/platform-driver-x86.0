From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: acer-wmi auto-loaded on a Lenovo Thinkpad X1 Carbon 4th gen
Date: Thu, 14 Jul 2016 23:39:31 +0200
Message-ID: <87vb07lx0s.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:35993 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751859AbcGNVkm convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jul 2016 17:40:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

I recently got a new laptop.  And now I'm trying to figure out what all
the stuff they put into it actually is :)
=2E
One thing that doesn't seem quite right is that the acer-wmi driver is
loaded and claims that this laptop has an "Acer BMA150 accelerometer".

It is true that there is a device there matching

  #define AMW0_GUID1            "67C3371D-95A3-4C37-BB61-DD47B491DAAB"

as can be seen:

 bjorn@miraculix:~$ ls -l /sys/devices/virtual/wmi/67C3371D-95A3-4C37-B=
B61-DD47B491DAAB
 total 0
 -r--r--r-- 1 root root 4096 Jul 14 23:10 modalias
 drwxr-xr-x 2 root root    0 Jul 14 23:10 power
 lrwxrwxrwx 1 root root    0 Jul 14 23:10 subsystem -> ../../../../clas=
s/wmi
 -rw-r--r-- 1 root root 4096 Jul 14 23:10 uevent


But I sort of doubt there is an Acer specific device here.  Maybe this
is a generic accelerometer interface?  Or is there something else going
on?

The input device created by the driver just just returns -EPERM when I
try to open it, so I don't think this actually works as-is:

 root@miraculix:/tmp# cat /dev/input/event8
 cat: /dev/input/event8: Operation not permitted


And it does seem a little weird that a Thinkpad should need an Acer
specific platform driver anyway....  thinkpad_acpi is of course handlin=
g
all(?) the Thinkpad specifics as expected.


Bj=C3=B8rn
