From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 07 Jun 2011 07:48:59 -0600
Message-ID: <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:52802 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753023Ab1FGNtI (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Tue, 7 Jun 2011 09:49:08 -0400
In-Reply-To: <4DE8D876.7060304@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, heyho@flanto.de
Cc: Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-06-03 =E6=96=BC 14:49 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 02.06.2011 21:16, Joey Lee wrote:
> > This is a problem on "Fn+F5" and "wireless hardware switch", does "=
=46n
> > +F5" also can control wireless state? If yes, then it's a problem i=
t
> > have conflict with "wirelss hardware switch".
> >=20
> > I mean, even 0x0C is "64", the Fn+F5 still can turn-off wireless, d=
oes
> > it right?
> > If the answer is yes, then we cann't use 0x0C to be killswitch stat=
e.
>=20
> fn+f5 doesn't do anything no matter what state the wifi switch is.
> Personally i wouldn't mind if only the wifi switch is supported, i me=
an,
> you don't need a key combination if you have a real switch for wifi
> (de)activation.
>=20

I thought need to check with Ike for more detail why the Fn+F5 key not
work on S205.
As I know on Thinkpad machine, the hardware switch causes killswitch se=
t
to hard-block, and Fn+F5 causes killswitch set to soft-block.

Ike,=20
need your comments for Fn+F5 key and wireless hardware switch on
ideapad. How does it implement on ideapad?
  	- press Fn+F5: soft-block wireless killswitch?
	- wireless hardware switch: hard-block wireless killswitch?

> > What the value in 0x51 and 0x52? is 0, 1 or?
>=20
> It's 0!
>=20
> regards

0x52 is zero maybe means the Fn+F5 will not do anything.
Could you please help to double check it by the following ways?

 a. Please make sure CONFIG_ACPI_DEBUG=3Dy then run the following comma=
nd
by root:

echo 0xFFFFFFFF >/sys/module/acpi/parameters/debug_layer; echo 0xF >/sy=
s/module/acpi/parameters/debug_level=20

	Then please press Fn+F5 key and attached dmesg on mail, we can know
find out which _Q method mapping to this key.

 b. Please run this command by root:
	perl acer_ec.pl :=3D 0x52 1
  =20
    Then press Fn+F5 key, does it have anything changed?


Thank's
Joey Lee
