From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 16:38:17 +0200
Message-ID: <20160622143817.GJ29844@pali>
References: <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
 <20160622075602.GA29844@pali>
 <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
 <20160622141239.GG29844@pali>
 <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
 <20160622142407.GH29844@pali>
 <68dd5c56440d4fc9a1c09c69a548476a@ausx13mpc124.AMER.DELL.COM>
 <20160622143112.GI29844@pali>
 <6fdb239b17254606861aab4723b26599@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34460 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbcFVOtz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 10:49:55 -0400
Content-Disposition: inline
In-Reply-To: <6fdb239b17254606861aab4723b26599@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: gabriele.mzt@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 22 June 2016 14:34:01 Mario_Limonciello@Dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Wednesday, June 22, 2016 9:31 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: gabriele.mzt@gmail.com; mjg59@srcf.ucam.org; dvhart@infradead.o=
rg;
> > kernel@kempniu.pl; luto@kernel.org; alex.hung@canonical.com; platfo=
rm-
> > driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI =
event
> > codes
> >=20
> > On Wednesday 22 June 2016 14:28:37 Mario_Limonciello@Dell.com wrote=
:
> > > > -----Original Message-----
> > > > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > > > Sent: Wednesday, June 22, 2016 9:24 AM
> > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > Cc: gabriele.mzt@gmail.com; mjg59@srcf.ucam.org;
> > dvhart@infradead.org;
> > > > kernel@kempniu.pl; luto@kernel.org; alex.hung@canonical.com;
> > platform-
> > > > driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH 3/4] dell-wmi: Add information about other =
WMI
> > event
> > > > codes
> > > >
> > > > On Wednesday 22 June 2016 14:21:25 Mario_Limonciello@Dell.com
> > wrote:
> > > > > > > For Linux I don=E2=80=99t think this is necessary and a N=
OOP is appropriate.
> > > > > > >
> > > > > > > There is also a second place that some older laptops had =
a battery
> > > > "hotkey"
> > > > > > > that would also emit 0xE00E.  This was also picked up by =
quickset
> > and
> > > > would
> > > > > > > show battery information.
> > > > > > >
> > > > > > > This shouldn't be blocked by kernel, I'd expect if someon=
e wants to
> > > > bind
> > > > > > this
> > > > > > > to another application from userspace they should be able=
 to.
> > > > > >
> > > > > > Great! Can I send patch after which 0xe00e will be send to =
input layer
> > as
> > > > > > event KEY_BATTERY?
> > > > > >
> > > > >
> > > > > Well that's why I was mentioning this in two places.  If it's=
 received from
> > > > keyboard
> > > > > recoding it as KEY_BATTERY sounds appropriate to me.  If it's=
 received
> > from
> > > > WMI,
> > > > > it really shouldn't be set as anything for Linux to do.
> > > > >
> > > > > I don't think any apps will benefit from the notification to =
re-read
> > battery
> > > > > Information today.
> > > >
> > > > I mean for dell-wmi.c code.
> > > > Why it should not be set to anything on Linux?
> > > >
> > >
> > > On Windows Quickset is a separate application from built-in Windo=
ws
> > battery
> > > applet.  It shows similar types of information as gnome-power-man=
ager
> > does,
> > > but because it's not part of the OS, it doesn't get notifications=
 like this so
> > > special BIOS hooks are in place for it to know when to re-read ba=
ttery
> > > information.
> > >
> > > On Linux, there are already infrastructure for battery removal an=
d adding
> > > notifications from ACPI.  Sending this up to user space won't be =
useful.
> >=20
> > Errr. I mean WMI event 0xe00e which you wrote is emitted when user =
press
> > battery key. And I think this event should be sent by dell-wmi.c as
> > KEY_BATTERY.
> >=20
>=20
> No, I mean 0xe00e scancode is emitted when user presses the battery k=
ey on
> older laptops.  I'm only mentioning it because it happens to have the=
 same
> scancode as is received for WMI for another purpose and I wanted to m=
ake sure
> it was clear what both are for. =20
> This button press isn't emitted via WMI, it's over standard serio.
>=20
> The event received over WMI for battery refresh that shares the same =
code shouldn't
> be emitted as KEY_BATTERY to the OS is all I was trying to say.

Ah right, sorry I was confused. WMI e00e is that battery insert/delete
event which we should ignore in dell-wmi.

So I will prepare patch which disable e00e event in dell-wmi.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
