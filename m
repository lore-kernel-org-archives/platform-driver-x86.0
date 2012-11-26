From: joeyli <jlee@suse.com>
Subject: Re: Fwd: Acer Aspire 5733 - acer_wmi problems
Date: Tue, 27 Nov 2012 02:28:39 +0800
Message-ID: <1353954519.21227.845.camel@linux-s257.site>
References: <50AFD2B6.6050502@justinzane.com>
	 <50B12F0F.9010300@justinzane.com>
	 <1353825698.21227.745.camel@linux-s257.site>
	 <50B2C063.3030104@justinzane.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:60687 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754553Ab2KZS3s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Nov 2012 13:29:48 -0500
In-Reply-To: <50B2C063.3030104@justinzane.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Justin Chudgar <justin@justinzane.com>
Cc: platform-driver-x86@vger.kernel.org, Leslie Zane <lzane@lesliezane.net>

Hi Justin,=20

OK, looks not just one problem on you machine. Let's clarify one by one=
:
=20
+ For the Fn key you said:=20
   <fn>+<brightness/volume/suspend/etc.> key combos not working=20
  =20
   That a bit strange for at least the volume control (normally on Acer
machine are Fn+up/down) should work because it direct send out useful
scan code.=20

   Please help to capture the scan code by showkey:
	- Add atkbd.softraw=3D0 kernel parameter and reboot system.
	- Switch to console and login with root account, then run:
		# showkey -s
   	 press Fn key and monitor the showkey output.


+ For we want to make sure acer-wmi causes any problem:
   Please add acer-wmi to the blacklist of modprobe
(e.g. /etc/modprobe.d/blacklist), then try to reproduce all issues on
your machine. (Fn key, AC power...)


+ For brightness control:
  Please check does there have /sys/class/backlight/acpi_video0 folder
on your machine. If you found it, please try to change the backlight by=
:
	# echo 3 > /sys/class/backlight/acpi_video0/brightness

  If you didn't see acpi_video0, please try 'acpi_backlight=3Dvendor'
kernel parameter. Then /sys/class/backlight/intel_backlight should show
up on your machine if it used Intel graphics Adapter.


+ For the AC power problem:
	Per your DSDT, the EC _Q37 is mapping to AC unplug and _Q38 is AC plug=
=2E
In _Q37 and _Q38, they notify AC, Battery and Processor acpi devices,
but I didn't see it changed backlight. Did you set S3 suspend when lid
close?


Thanks a lot!
Joey Lee

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 17:05 -0800=EF=BC=8CJu=
stin Chudgar =E6=8F=90=E5=88=B0=EF=BC=9A
> The acpidump tarball isattached.What I meant by unplugged/plugged was=
 this:
> 1 - the laptop is plugged into AC power
> 2 - the laptop is left with the lid closed, unused for longer than
> ~15-30 minutes.
> 3 - the laptop's power adapter is unplugged from the AC outlet for
> ~30-60 seconds.
> 4 - the laptop's power adapter is plugged into another AC outlet
> *Problem*
> - After the above sequence, the laptop screen will not work. This mea=
ns
> that the backlight is off and the screen is blank. The laptop does no=
t
> respond to any user input, via trackpad, normal keyboard keys,
> <fn>+<SPECIAL> keys that I assume are handled by acer_wmi. It does wo=
rk
> perfectly fine when accessed via ssh, though even restarting kdm via =
ssh
> fails to reactivate the screen. The only way to recover the screen is=
 to
> reboot.
> *Other Problems*
> - Multimedia keys do not work.
>=20
> Justin Chudgar  |  Weed, CA 96094  |  530 921 0738 | http://www.justi=
nzane.com/
>=20
> On 11/24/2012 10:41 PM, joeyli wrote:
> > Hi Justin,=20
> >
> > =E6=96=BC =E5=85=AD=EF=BC=8C2012-11-24 =E6=96=BC 12:33 -0800=EF=BC=8C=
Justin Chudgar =E6=8F=90=E5=88=B0=EF=BC=9A
> >>
> >> This is what I am having problems with. Thanks for the quick reply=
=2E
> >>
> >> Justin Chudgar  |  Weed, CA 96094  |  530 921 0738 |
> >> http://www.justinzane.com/
> >>
> >>
> >>
> >> -------- Original Message --------
> >> Subject:        Acer Aspire 5733 - acer_wmi problems
> >> Date:   Fri, 23 Nov 2012 11:47:02 -0800
> >> From:   Justin Chudgar <justin@justinzane.com>
> >> To:     platform-driver-x86@vger.kernel.org
> >>
> >>
> >>
> >> I have an Acer Aspire 5733 that is having issues with:
> >> - <fn>+<brightness/volume/suspend/etc.> key combos not working
> > Please provide acpidump from your Aspire 5733. Run the following co=
mmand
> > by root:
> >  # acpidump > acpidump.dat
> >
> > Please send acpidump.dat to me.
> >
> >> - screen not resuming when unplugging/replugging a system while sy=
stem
> >> continues operating
> > I am not fully understand what means 'unplugging/replugging'?=20
> >
> >> Could someone please help me determine how to triage these and dir=
ect
> >> me
> >> on what info the maintainer needs from me.
> >>
> >> Thank you.=20
> > Thanks a lot!
> > Joey Lee
> >
>=20
