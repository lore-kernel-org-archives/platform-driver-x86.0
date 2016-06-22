From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 16:31:12 +0200
Message-ID: <20160622143112.GI29844@pali>
References: <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
 <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
 <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
 <20160622075602.GA29844@pali>
 <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
 <20160622141239.GG29844@pali>
 <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
 <20160622142407.GH29844@pali>
 <68dd5c56440d4fc9a1c09c69a548476a@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68dd5c56440d4fc9a1c09c69a548476a@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario_Limonciello@Dell.com
Cc: gabriele.mzt@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 22 June 2016 14:28:37 Mario_Limonciello@Dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Wednesday, June 22, 2016 9:24 AM
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
> > On Wednesday 22 June 2016 14:21:25 Mario_Limonciello@Dell.com wrote=
:
> > > > > For Linux I don=E2=80=99t think this is necessary and a NOOP =
is appropriate.
> > > > >
> > > > > There is also a second place that some older laptops had a ba=
ttery
> > "hotkey"
> > > > > that would also emit 0xE00E.  This was also picked up by quic=
kset and
> > would
> > > > > show battery information.
> > > > >
> > > > > This shouldn't be blocked by kernel, I'd expect if someone wa=
nts to
> > bind
> > > > this
> > > > > to another application from userspace they should be able to.
> > > >
> > > > Great! Can I send patch after which 0xe00e will be send to inpu=
t layer as
> > > > event KEY_BATTERY?
> > > >
> > >
> > > Well that's why I was mentioning this in two places.  If it's rec=
eived from
> > keyboard
> > > recoding it as KEY_BATTERY sounds appropriate to me.  If it's rec=
eived from
> > WMI,
> > > it really shouldn't be set as anything for Linux to do.
> > >
> > > I don't think any apps will benefit from the notification to re-r=
ead battery
> > > Information today.
> >=20
> > I mean for dell-wmi.c code.
> > Why it should not be set to anything on Linux?
> >=20
>=20
> On Windows Quickset is a separate application from built-in Windows b=
attery=20
> applet.  It shows similar types of information as gnome-power-manager=
 does,=20
> but because it's not part of the OS, it doesn't get notifications lik=
e this so=20
> special BIOS hooks are in place for it to know when to re-read batter=
y
> information.
>=20
> On Linux, there are already infrastructure for battery removal and ad=
ding=20
> notifications from ACPI.  Sending this up to user space won't be usef=
ul.

Errr. I mean WMI event 0xe00e which you wrote is emitted when user pres=
s
battery key. And I think this event should be sent by dell-wmi.c as
KEY_BATTERY.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
