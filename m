From: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Subject: dell_smm_hwmon - request to enable on Dell XPS 15 9560 (2017) (works
 with ignore_dmi)
Date: Tue, 28 Feb 2017 21:24:18 +0100
Message-ID: <CAHZJmOz-jZrVSK6hF+LKy3DNRfmoZnXU6YRTbCQt_0sfRB9R=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ot0-f172.google.com ([74.125.82.172]:33467 "EHLO
        mail-ot0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbdB1Uz1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 15:55:27 -0500
Received: by mail-ot0-f172.google.com with SMTP id k4so16288015otc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2017 12:54:06 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: pali.rohar@gmail.com

Hello,

I would like to request that the maintainers of the dell_smm_hwmon
enable it on the Dell XPS 15 9560 (2017).

I have contacted (outside this list - apologies, did not even know it
existed) Pali Roh=C3=A1r to request support based on some google search and
after looking at the driver source code which included him
as.maintainer.

The driver works fine on my machine if I modprobe it with ignore_dmi.

How do I know?

(a) the sensors application correctly reports fan activity:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
(zeus:vasile)-(jobs:0)-(~/prep)
(! 528)-> sensors
coretemp-isa-0000
Adapter: ISA adapter
Physical id 0:  +48.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 0:         +47.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 1:         +48.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 2:         +48.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)
Core 3:         +47.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=
=B0C)

acpitz-virtual-0
Adapter: Virtual device
temp1:        +25.0=C2=B0C  (crit =3D +107.0=C2=B0C)

dell_smm-virtual-0
Adapter: Virtual device
Processor Fan: 2498 RPM
Video Fan:     2506 RPM
CPU:            +48.0=C2=B0C
Ambient:        +47.0=C2=B0C
Ambient:        +43.0=C2=B0C
Other:          +38.0=C2=B0C
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

NB. the application correctly reports zero fan speed when the fans do
not spin (audibly).

(b) the pwmconfig application is able to spin down the fans (although
it seems that the BIOS brings them back up shortly after).

Pali also mentioned that on some machines simply querying the fans
briefly freezes the machine - I do not see this behaviour on my
machine - fan speeds are read instantly with no freeze.

He also mentioned that before support for the 9560 can be enabled in
the driver, I need to submit the output of a couple of commands:

$ cat /sys/class/dmi/id/sys_vendor  =3D=3D> "Dell Inc." [I use double
quotes to show there's no space before/after]

$ cat /sys/class/dmi/id/product_name =3D=3D> "XPS 15 9560" [same reason as
above for the quotes]

Some further information: my BIOS is the most recent for my machine:
v1.1.3, released a few days ago.

If there are any questions or if you need me to do anything to help,
please let me know!

NB. I am not a programmer and do not think I would be any good trying
to compile anything, but if you need me to try something on my PC, no
problem.

Thanks in advance [and apologies if I am posting to the wrong list]

Kind regards

Vasile
