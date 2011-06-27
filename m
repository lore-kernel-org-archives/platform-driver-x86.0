From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Mon, 27 Jun 2011 02:17:48 -0600
Message-ID: <4E08C94C020000230002EB22@novprvlin0050.provo.novell.com>
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
 <4DFE145B.4060405@flanto.de> <4E01B5C1.1010500@canonical.com>
 <4E050172.7050604@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:59655 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757108Ab1F0IRv (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Mon, 27 Jun 2011 04:17:51 -0400
In-Reply-To: <4E050172.7050604@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-06-24 =E6=96=BC 23:28 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 22.06.2011 11:28, Ike Panhc wrote:
> > Hi Florian,
> >
> > Could you have the same test with ideapad-laptop loaded? I need to =
make
> > sure ideapad-laptop have the correct rfkill information.
> >
>=20
> Hello Ike,
>=20
> no problem:
>=20
> After booting, wifi switch is on:
>=20
> after loading acer-wmi and idepad-laptop "rfkill list" shows
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 3: ideapad_bluetooth: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
> wifi doesn't work this time (this seems to vary, sometimes wifi works=
=20
> directly after loading acer-wmi).
>=20

If only loading acer-wmi, did it have the same problem? Wifi doesn't
work but killswitch is unblock? Sound like SOMETIMES it fail?



Thank's
Joey Lee


> after switching to off:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
> 3: ideapad_bluetooth: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: yes
>=20
> after switching back to on:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 3: ideapad_bluetooth: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 4: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
> wifi runs and is trying to connect...but no connection. I toggled wif=
i=20
> on/off again and it gets enabled/disabled correctly every time but i=20
> don't get a stable wifi connection this time. This might be a differe=
nt=20
> issue with the wifi driver as this one is under development too. I've=
=20
> had this behaviour some times (i have used the ideapad about 20 hours=
=20
> this week).
>=20
>=20
> regards
