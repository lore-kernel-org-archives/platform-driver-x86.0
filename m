From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 17 Jun 2011 04:58:45 -0600
Message-ID: <4DFBC005020000230002E618@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
 <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
 <4DF08626.3050802@canonical.com>
 <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
 <4DF9D3AC.1050502@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:47512 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751566Ab1FQK6x (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Fri, 17 Jun 2011 06:58:53 -0400
In-Reply-To: <4DF9D3AC.1050502@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: heyho@flanto.de, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-06-16 =E6=96=BC 17:58 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/15/2011 05:32 PM, Joey Lee wrote:
> > =E6=96=BC =E5=9B=9B=EF=BC=8C2011-06-09 =E6=96=BC 16:36 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> >=20
> > But Florian said the Fn+F5 doesn't work to him, as you said, the _Q=
2B
> > works when GWSS is not zero:
> >=20
> >         Method (_Q2B, 0, NotSerialized)         /* wifi key? */
> >         { =20
> >             Store (0x2B, P80H)
> >             If (LEqual (GWSS, 0x00)) {}         /* on issue machine=
, GWSS is 0 */
> >             Else
> >             { =20
> >                 If (WLPS)                       /* if have wireless=
 */
> >                 { =20
> >                     Store (WRST, WLEN)          /* write wireless R=
=46 state to EC */
> >                 }
> >=20
>=20
> I see your point. IMHO this is ok. When the radio switch is off, it s=
hall
> be no different on every soft block modes.

> > =E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 15:02 +0200=EF=BC=8C=
=46lorian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A=20
> >> On 05/31/2011 11:42 AM, Joey Lee wrote:
> >>> Just checked your DSDT, it declared the AMW0 methods, I agreed Ik=
e's
> >>> suggestion that will be better you direct test acer-wmi on your m=
achine.
> >>>
> >>> Please modprobe acer-wmi driver, then try to turn on/off bluetoot=
h or
> >>> wireless device by rfkill.
> >>
> >> Hello Joey,
> >>
> >> here are some findings with acer_wmi. I execute the following step=
s from=20
> >> top to bottom, and only after the last step my wifi works. After e=
ach=20
> >> step you find the output of "rfkill list":
> >>
> >> after booting (no ideapad_laptop, no acer_wmi):
> >> 0: hci0: Bluetooth
> >> 	Soft blocked: no
> >> 	Hard blocked: no
> >> 1: phy0: Wireless LAN
> >> 	Soft blocked: no
> >> 	Hard blocked: yes
> >>
> >=20
> > When system boot, wireless is hard blocked by default.
> >=20
>=20
> Read the reply mail from Florian. This is a problem because hard bloc=
ked
> shall be no when the radio switch is on. Since phy0 is registered by =
wifi
> driver, I think this is not generic design.
>=20

There have some problems not just check the EC register then set
killswitch to hard blocked:

 + Per Florian's report, looks like the hardware key cann't unblock for
wireless and need acer-wmi driver unblock by evaluate AMW0 method. Does
that mean acer-wmi driver need evaluate AMW0 every time when user press
hardware key? This logic is so specially, and only S205 need do that.

 + The hardware key is not just control wireless, it also control
bluetooth. That will be better we also find out which EC register
mapping to bluetooth.

 + In current acer-wmi driver, it only maintain soft block for wireless
killswitch. IdeaPad S205 will be the only one machine that maintain har=
d
block but no soft block. There have no other acer machine like this.=20

Simply said, I don't want to put this specially case to acer-wmi (I
believe need use quirk). Does it possible support it in ideapad-laptop?

May I just check if there have VPC2004 device in dsdt, then acer-wmi
will not loading, leave ideapad-laptop take care?


Thank's a lot!
Joey Lee
