From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Sat, 05 Mar 2011 19:53:40 -0700
Message-ID: <4D7391E40200002300029710@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <20110103204910.GA4223@srcf.ucam.org>
 <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
 <201103022109.51600.carlos@strangeworlds.co.uk>
 <20110304235927.GA31464@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110304235927.GA31464@srcf.ucam.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-03-04 =E6=96=BC 23:59 +0000=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> Looking at this, it seems that the affected machines have AMW0_GUID1 =
but=20
> none of the WMID GUIDs. By the looks of things this is just a=20
> semi-standardised way to trigger an SMM trap and communicate with the=
=20
> firmware. This makes things tricker to track down (because once we're=
 in=20
> SMM we have no way of knowing what the firwmare's doing), but=20
> potentially there's some method to identify the machine here. Carlos,=
 do=20
> we have any idea what the inputs and outputs for this method mean oth=
er=20
> than what's in AMW0_set_capabilities()?
>=20

Lenovo S12 have AMW0_GUID2 like Fujitsu Siemens Amilo Li2732, direct
assign wireless capability when detected AMW0_GUID2 in acer-wmi for
=46ujitsu Li2732, but the same EC cmmand doesn't work for Lenovo S12.


Thank's
Joey Lee
