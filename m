From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Wed, 15 Jun 2011 03:32:42 -0600
Message-ID: <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
 <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
 <4DF08626.3050802@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:52345 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754209Ab1FOJcq (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Wed, 15 Jun 2011 05:32:46 -0400
In-Reply-To: <4DF08626.3050802@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: heyho@flanto.de, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-06-09 =E6=96=BC 16:36 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/07/2011 09:48 PM, Joey Lee wrote:
> > =E6=96=BC =E4=BA=94=EF=BC=8C2011-06-03 =E6=96=BC 14:49 +0200=EF=BC=8C=
=46lorian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> >> fn+f5 doesn't do anything no matter what state the wifi switch is.
> >> Personally i wouldn't mind if only the wifi switch is supported, i=
 mean,
> >> you don't need a key combination if you have a real switch for wif=
i
> >> (de)activation.
> >>
> >=20
> > I thought need to check with Ike for more detail why the Fn+F5 key =
not
> > work on S205.
>=20

But Florian said the Fn+F5 doesn't work to him, as you said, the _Q2B
works when GWSS is not zero:

        Method (_Q2B, 0, NotSerialized)         /* wifi key? */
        { =20
            Store (0x2B, P80H)
            If (LEqual (GWSS, 0x00)) {}         /* on issue machine, GW=
SS is 0 */
            Else
            { =20
                If (WLPS)                       /* if have wireless */
                { =20
                    Store (WRST, WLEN)          /* write wireless RF st=
ate to EC */
                }

> I read the DSDT again. Fn+F5 is the soft rfkill key. It looks fine.
> I guess the problem is the hard rfkill status is blocked, wifi will b=
e
> blocked even the soft one is unblocked.
>=20
> > As I know on Thinkpad machine, the hardware switch causes killswitc=
h set
> > to hard-block, and Fn+F5 causes killswitch set to soft-block.
> >=20
> > Ike,=20
> > need your comments for Fn+F5 key and wireless hardware switch on
> > ideapad. How does it implement on ideapad?
> >   	- press Fn+F5: soft-block wireless killswitch?
> > 	- wireless hardware switch: hard-block wireless killswitch?
>=20
> Both of the answers are yes.
>=20
> The problem is that on ideapad s205 without acer-wmi, when ideapad-la=
ptop
> have the hard switch event, the driver asks the status of switch and =
DSDT
> replies blocked.
>=20
> In the DSDT the driver read bit of GWSS as status of hardware switch =
and
> I can not find out anything to update GWSS in DSDT :(

I also didn't see any other statement in DSDT touch GWSS.

On the other hand, =20
I reviewed Florian's following mail:

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 15:02 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A=20
> On 05/31/2011 11:42 AM, Joey Lee wrote:
> > Just checked your DSDT, it declared the AMW0 methods, I agreed Ike'=
s
> > suggestion that will be better you direct test acer-wmi on your mac=
hine.
> >
> > Please modprobe acer-wmi driver, then try to turn on/off bluetooth =
or
> > wireless device by rfkill.
>=20
> Hello Joey,
>=20
> here are some findings with acer_wmi. I execute the following steps f=
rom=20
> top to bottom, and only after the last step my wifi works. After each=
=20
> step you find the output of "rfkill list":
>=20
> after booting (no ideapad_laptop, no acer_wmi):
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
>=20

When system boot, wireless is hard blocked by default.

> after loading acer_wmi (wifi switch is on):
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no

The acer-wmi will set initial value by call AMW0 wmi method to unblock =
wireless.

>=20
> after switching off:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no
>=20

Press hardware switch to off, here have a question:
 + It disabled bluetooth but not wireless?

I thought the wireless works fine when system at this status, even acer=
-wireless
stay on soft blocked.

> switching on again:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no
> 3: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20

Press hardware switch again, here have a question:
 + looks like it enable bluetooth but hard blocked wireless again?

>=20
> after removing acer_wmi with modprobe -r:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 3: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20

Here a bit not make sense:
 + acer-wmi doesn't touch wireless by AMW0 when it un-probe, but wirele=
ss state
   set to unblock.=20
   Does that mean current "hardware switch" state is "OFF", but wireles=
s state is unblock?

>=20
>=20
> Now wifi networking can be used!
> The optimal solution would be to have ideapad_laptop make all=20
> initialisations so wifi can be used after booting with no manual step=
s=20
> necessary.
>=20
> Regards

Here have some questions:=20
 + Does "hardware switch" on IdeaPad S205 not just control wireless? Do=
es it also control bluetooth?
 + Does "hardware switch" emit any KEY_WIRELESS, KEY_BLUETOOTH or KEY_R=
=46KILL? And rfkill-input works?

I mean: Does this switch only control by BIOS? or actually rfkill-input=
 also touch the killswitch?


Thank's a lot!
Joey Lee
