From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 20:08:02 -0600
Message-ID: <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4DE57CD6.5030609@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=B8=89=EF=BC=8C2011-06-01 =E6=96=BC 01:42 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/01/2011 12:50 AM, Joey Lee wrote:
> >
> > After traced S205 DSDT, I thought you will got a result is 0x71, pl=
ease
> > help to use acer_ec.pl to confirm this register changed. Please giv=
e me
> > the value when wireless on/off.
>=20
> Hello Joey,
>=20
> just short testing: the hardware wifi switch (not the wifi key=20
> combination fn+f5) toggles register 0x0C from 0 (off) to 64 (on). Wif=
i=20
> goes on/off (after having first loaded/unloaded acer_wmi).
>=20

It's also ok for acer-wmi can capture 0x0C then set to wireless
killswitch.

> The wifi key combination fn+f5 doesn't seem to change anything (i hav=
e=20
> to look again to be sure).
>=20

So, does that mean Fn+F5 cann't on/off wireless? or Not?
Could you please help to check the value on 0x51 and 0x52?


Thakn's
Joey Lee

> >
> > And,
> > Please attached on dmidecode, just need:
> > 	dmidecode>  dmidecode.log
>=20
> ok, i'll provide that tomorrow.
>=20
>=20
> regards
