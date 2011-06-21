From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 21 Jun 2011 04:16:36 -0600
Message-ID: <4E00FC24020000230002E843@novprvlin0050.provo.novell.com>
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
 <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com>
 <4DFF27EC.9080804@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:34221 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751200Ab1FUKQq (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Tue, 21 Jun 2011 06:16:46 -0400
In-Reply-To: <4DFF27EC.9080804@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=B8=80=EF=BC=8C2011-06-20 =E6=96=BC 12:58 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/20/2011 12:10 PM, Joey Lee wrote:
> > But,
> > here have a question:
> >
> > The phy0 killswitch didn't set to hard blocked, did wireless LAN st=
ill
> > can be used at this moment? even hardware switch is off?
>=20
> Hello Joey,
>=20
> i tested again:
>=20
> First with acer-wmi inserted (as always boot-state of wifi button is =
on):
>=20
> switching to off "rfkill list" is:
>=20
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
> 6: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
>=20
> (phy0-hard blocked goes to "yes" after 1 or 2 seconds, maybe yesterda=
y i=20
> didn't wait long enough). Wifi doesn't work in this state, i checked.
>=20
> Switching to on "rfkill list" is:
>=20
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 6: acer-wireless: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 7: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
> Wifi now works!
>=20

Looks good!

We need 100% make sure acer-wireless's block state mapping to REAL
wireless RF state.

> After removing acer-wmi (so i loaded it only for initialisation),=20
> switching to off "rfkill list" is:
>=20
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
>=20
> Back to on:
>=20
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 5: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
>=20
> wifi works in state "on"- so acer-wmi is really needed only for=20
> initialisation.

=46or a normal user, he will not un-probe acer-wmi driver after system.
Could you please help to confirm? I mean please switch your hardware
wifi switch a couple of cycles with acer-wmi loaded.=20

Just want to 100% make sure acer-wmi will not crash after switch
wireless state by hardware a lot of times.

> ideapad-laptop is _not_ loaded, the wifi switch works correctly nonet=
heless.
>=20

It's the same, if you wan to use ideapad-laptop at the same time. Pleas=
e
load ideapad-laptop and acer-wmi then switch wireless button many times=
,
make sure there have not thing crash.=20

> > I thought the real situation back to BT on, Wireless on, right?
>=20
> yes, after switching to on everything is back to state after=20
> initialisation (wifi works).

Currently, looks like we don't need evaluate AMW0 method every time we
press hardware wireless switch. It's similar with other AMW0 machines
just change to maintain hard-block.

Please help to confirm acer-wmi strong enough works with hardware
switch, then we can support it in acer-wmi or ideapad-laptop.


Thank's a lot!
Joey Lee
