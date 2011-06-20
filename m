From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Mon, 20 Jun 2011 04:10:23 -0600
Message-ID: <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
 <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
 <4DF08626.3050802@canonical.com>
 <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
 <4DF87EA2.3050204@flanto.de>
 <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com>
 <4DFB6CDE.4020003@flanto.de>
 <4DFC8014020000230002E662@novprvlin0050.provo.novell.com>
 <4DFE145B.4060405@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:51583 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751633Ab1FTKKf (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Mon, 20 Jun 2011 06:10:35 -0400
In-Reply-To: <4DFE145B.4060405@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E6=97=A5=EF=BC=8C2011-06-19 =E6=96=BC 17:23 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/18/2011 02:38 AM, Joey Lee wrote:
> >
> > Could you please help to test this patch? This is just a test patch=
, and
> > I didn't evaluation AWM0 in update rfkill state polling because I d=
idn't
> > think evaluate AWM0 per second is a good idea.
> >
> > Please probe acer-wmi driver then report rfkill state. That's see w=
hat
> > the situation, then we add AWM0 part in next patch.
>=20
> Hello Joey,
>=20
> just tested your patch. It works, after inserting the patched module =
i=20
> can use wifi!
>=20

It's a good news, looks the REAL situation is not complex like us
thought.=20

> After booting with hardware switch =3D on i inserted patched acer-wmi=
=2E=20
> This is "rfkill list" state after inserting:
>=20
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
>=20
initial: BT on, Wireless on

Yes, acer-wmi enabled wireless by evaluate AMW0 method when initial.

> After switching to off:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
>=20
BT off, Wireless off?

Good, acer-wireless updated state to hard blocked, it's right!

But,
here have a question:

The phy0 killswitch didn't set to hard blocked, did wireless LAN still
can be used at this moment? even hardware switch is off?

> Switching back to on:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 3: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20

I thought the real situation back to BT on, Wireless on, right?


Thank's a lot!
Joey Lee
