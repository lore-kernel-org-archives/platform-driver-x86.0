From: r ll <crquan@gmail.com>
Subject: thinkpad_acpi fan stop working problem (was after resume) (speed
 becomes 65535)
Date: Wed, 2 May 2012 23:00:56 -0700
Message-ID: <CAH5vBdJUpdHbMNC7ro0jvhOPy128Y0hc6ygzsLH=NbZubksWkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:52365 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519Ab2ECGBS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 02:01:18 -0400
Received: by wgbds11 with SMTP id ds11so26653wgb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 May 2012 23:01:17 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Borislav Deianov <borislav@users.sf.net>

To THINKPAD ACPI EXTRAS DRIVER authors and related mailer list,

(got this list from MAINTAINERS and thinkpad_acpi.c)


This problem occasionally happens on my Thinkpad T410 with some recent =
kernels,
I remember this problem since 2.6.35 when I was installing Ubuntu-10
and now I have switched to Arch Linux with self complied latest
3.4-rc5, this issue
is remaining there,

most of time the fan is working well, but usually every night I close t=
he laptop
let the Linux suspend; then resume on next morning, occasionally the la=
ptop
could become very hot, usually above 90=E2=84=83 for long time, if I co=
mpile something
or do some heavy work, it may go up over 128=E2=84=83 then machine
automatically shutdown,

# cat /sys/devices/platform/thinkpad_hwmon/temp1_input
97000
# cat /sys/devices/platform/thinkpad_hwmon/fan1_input
65535

I guess the fan is actually not working at all;
I tried unload & reload the kernel module but it still doesn't work;
I tried manually set a speed level but it's still 65535, the machine
is still hot

# modprobe -r thinkpad_acpi && modprobe thinkpad_acpi fan_control=3D1

# echo 'level full-speed' >/proc/acpi/ibm/fan
# cat /proc/acpi/ibm/fan
status:		enabled
speed:		65535
level:		disengaged
commands:	level <level> (<level> is 0-7, auto, disengaged, full-speed)
commands:	enable, disable
commands:	watchdog <timeout> (<timeout> is 0 (off), 1-120 (seconds))


It seems the only way is to complete power off Linux for a few
seconds, power on again
then the fan could be working, I observed a normal speed should be
between 3000 ~ 5000, and machine temperature is 40~70=E2=84=83, normall=
y working;


Wonder if someone experienced same problem and how can we fix it?



at least to know how can I recover the fan to work, without rebooting



Thanks,
