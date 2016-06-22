From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 16:12:39 +0200
Message-ID: <20160622141239.GG29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
 <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
 <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
 <20160622075602.GA29844@pali>
 <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36825 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbcFVOMy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 10:12:54 -0400
Content-Disposition: inline
In-Reply-To: <41f11bb2917349919e0b4eb21fab9a46@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: gabriele.mzt@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 22 June 2016 13:40:57 Mario_Limonciello@Dell.com wrote:
> > > You aren't seeing this on the DSDT of your Latitude right?
> >=20
> > Yes, I do not see it on Latitude.
>=20
> Thanks, the usage of this scan code is specific to consumer BIOSes.
>=20
> >=20
> > > Gabriele,
> > >
> > > Your machine is from the year before XPS switched over to running=
 the
> > > Dell business client (eg Latitude, Precision, Optiplex) BIOS.
> > >
> > > The EC in that machine does have support for "Battery Health" via=
 that
> > > scancode.  On Windows it's used for relaying battery information =
to an
> > > application called Quick Set.
> >=20
> > Do you have some details when it is send to OS? And how to read tha=
t that
> > "battery health"?
>=20
> When a battery is removed or inserted this event is supposed to be re=
ceived
> by quickset over WMI and then Quickset will re-read battery informati=
on.

So event is sent only if battery is removed or inserted?

> For Linux I don=E2=80=99t think this is necessary and a NOOP is appro=
priate.
>=20
> There is also a second place that some older laptops had a battery "h=
otkey"
> that would also emit 0xE00E.  This was also picked up by quickset and=
 would
> show battery information.
>=20
> This shouldn't be blocked by kernel, I'd expect if someone wants to b=
ind this
> to another application from userspace they should be able to.

Great! Can I send patch after which 0xe00e will be send to input layer =
as
event KEY_BATTERY?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
