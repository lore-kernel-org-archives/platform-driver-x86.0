From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: thinkpad_acpi fan stop working problem (was after resume)
 (speed becomes 65535)
Date: Sun, 6 May 2012 23:06:26 -0300
Message-ID: <20120507020626.GA28214@khazad-dum.debian.net>
References: <CAH5vBdJUpdHbMNC7ro0jvhOPy128Y0hc6ygzsLH=NbZubksWkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58400 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754984Ab2EGCGb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 May 2012 22:06:31 -0400
Content-Disposition: inline
In-Reply-To: <CAH5vBdJUpdHbMNC7ro0jvhOPy128Y0hc6ygzsLH=NbZubksWkQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: r ll <crquan@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Borislav Deianov <borislav@users.sf.net>

On Wed, 02 May 2012, r ll wrote:
> most of time the fan is working well, but usually every night I close=
 the laptop
> let the Linux suspend; then resume on next morning, occasionally the =
laptop
> could become very hot, usually above 90=E2=84=83 for long time, if I =
compile something
> or do some heavy work, it may go up over 128=E2=84=83 then machine
> automatically shutdown,
>=20
> # cat /sys/devices/platform/thinkpad_hwmon/temp1_input
> 97000
> # cat /sys/devices/platform/thinkpad_hwmon/fan1_input
> 65535

"-1" (reported as 65535) *is* the standard ThinkPad EC lingo for "not
available".  Getting this in the tachometer is really weird, but
actually useful :p  It is also the first time I've ever heard of this.

Change your kernel to disable thinkpad-acpi fan control, i.e. make
*sure* thinkpad_acpi is always loaded with fan_control=3D0, even at the
first time it is loaded.  You might need to mess with /etc/modprobe.d,
and maybe even update your initramfs.

Run it like that for a while, so that you can access whether the proble=
m
went away or not.  Let's find out whether it is thinkpad-acpi or
something else that is getting the EC pissed off :-)

> I tried unload & reload the kernel module but it still doesn't work;
> I tried manually set a speed level but it's still 65535, the machine
> is still hot

So, whatever it is, it makes the EC ignore fan control commands.

Are you using the "fan" ACPI module?

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
