From: r ll <crquan@gmail.com>
Subject: Re: thinkpad_acpi fan stop working problem (was after resume) (speed
 becomes 65535)
Date: Sun, 6 May 2012 22:02:01 -0700
Message-ID: <CAH5vBdK9xSb6iz9PuzNgZov2KSFZOkzaDA9PyPgFGLHOne4_hw@mail.gmail.com>
References: <CAH5vBdJUpdHbMNC7ro0jvhOPy128Y0hc6ygzsLH=NbZubksWkQ@mail.gmail.com>
 <20120507020626.GA28214@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:56946 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307Ab2EGFCX convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 May 2012 01:02:23 -0400
Received: by wibhq2 with SMTP id hq2so198440wib.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 May 2012 22:02:21 -0700 (PDT)
In-Reply-To: <20120507020626.GA28214@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Borislav Deianov <borislav@users.sf.net>

On Sun, May 6, 2012 at 7:06 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Wed, 02 May 2012, r ll wrote:
>> most of time the fan is working well, but usually every night I clos=
e the laptop
>> let the Linux suspend; then resume on next morning, occasionally the=
 laptop
>> could become very hot, usually above 90=E2=84=83 for long time, if I=
 compile something
>> or do some heavy work, it may go up over 128=E2=84=83 then machine
>> automatically shutdown,
>>
>> # cat /sys/devices/platform/thinkpad_hwmon/temp1_input
>> 97000
>> # cat /sys/devices/platform/thinkpad_hwmon/fan1_input
>> 65535
>
> "-1" (reported as 65535) *is* the standard ThinkPad EC lingo for "not
> available". =C2=A0Getting this in the tachometer is really weird, but
> actually useful :p =C2=A0It is also the first time I've ever heard of=
 this.
>
> Change your kernel to disable thinkpad-acpi fan control, i.e. make
> *sure* thinkpad_acpi is always loaded with fan_control=3D0, even at t=
he
> first time it is loaded. =C2=A0You might need to mess with /etc/modpr=
obe.d,
> and maybe even update your initramfs.

Once boot, I see it's "N", is it not enough to make sure?
I always compile in the hdd drivers and filesystem code for root, so
not using an initramfs;
this thinkpad_acpi module is just loaded automatically by some init scr=
ipt,
and my /etc/modprobe.d is empty, I'm using modprobe by kmod 7-2;

$ cat /sys/module/thinkpad_acpi/parameters/fan_control
N
$ cat /sys/devices/platform/thinkpad_hwmon/fan1_input
3578
$ pacman -Q |grep kmod
kmod 7-2



>
> Run it like that for a while, so that you can access whether the prob=
lem
> went away or not. =C2=A0Let's find out whether it is thinkpad-acpi or
> something else that is getting the EC pissed off :-)
>
>> I tried unload & reload the kernel module but it still doesn't work;
>> I tried manually set a speed level but it's still 65535, the machine
>> is still hot
>
> So, whatever it is, it makes the EC ignore fan control commands.
>
> Are you using the "fan" ACPI module?

Do you mean this CONFIG_ACPI_FAN ? I found it's Y, but I can try disabl=
e it;
but do you think it's conflict with thinkpad_acpi fan ?

$ grep -i fan /boot/config
CONFIG_ACPI_FAN=3Dy


>
> --
> =C2=A0"One disk to rule them all, One disk to find them. One disk to =
bring
> =C2=A0them all and in the darkness grind them. In the Land of Redmond
> =C2=A0where the shadows lie." -- The Silicon Valley Tarot
> =C2=A0Henrique Holschuh



--=20
Cheng Renquan (=E7=A8=8B=E4=BB=BB=E5=85=A8)
