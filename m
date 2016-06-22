From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 16:24:07 +0200
Message-ID: <20160622142407.GH29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
 <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
 <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
 <20160622075602.GA29844@pali>
 <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
 <20160622141239.GG29844@pali>
 <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35193 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbcFVOYd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 10:24:33 -0400
Content-Disposition: inline
In-Reply-To: <d24c871ec38e4fe2a21b25c16e0ec862@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: gabriele.mzt@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 22 June 2016 14:21:25 Mario_Limonciello@Dell.com wrote:
> > > For Linux I don=E2=80=99t think this is necessary and a NOOP is a=
ppropriate.
> > >
> > > There is also a second place that some older laptops had a batter=
y "hotkey"
> > > that would also emit 0xE00E.  This was also picked up by quickset=
 and would
> > > show battery information.
> > >
> > > This shouldn't be blocked by kernel, I'd expect if someone wants =
to bind
> > this
> > > to another application from userspace they should be able to.
> >=20
> > Great! Can I send patch after which 0xe00e will be send to input la=
yer as
> > event KEY_BATTERY?
> >=20
>=20
> Well that's why I was mentioning this in two places.  If it's receive=
d from keyboard
> recoding it as KEY_BATTERY sounds appropriate to me.  If it's receive=
d from WMI,
> it really shouldn't be set as anything for Linux to do.
>=20
> I don't think any apps will benefit from the notification to re-read =
battery
> Information today.

I mean for dell-wmi.c code.
Why it should not be set to anything on Linux?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
