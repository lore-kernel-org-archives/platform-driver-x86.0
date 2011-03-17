From: "Joey Lee" <jlee-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [b43] usb device disconnects automatically after 1s
Date: Wed, 16 Mar 2011 19:11:31 -0600
Message-ID: <4D81FA730200002300029F0F@novprvlin0050.provo.novell.com>
References: <201103170018.32061.mihai.dontu@gmail.com>
 <201103170022.24290.mihai.dontu@gmail.com>
 <AANLkTi=-B0e4VT_v+F23Q+hG_zn=JnVbmVHnFpETVrZu@mail.gmail.com>
 <201103170106.58746.mihai.dontu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201103170106.58746.mihai.dontu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mihai.dontu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Add Cc. to platform driver guys.

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-03-17 =E6=96=BC 01:06 +0200=EF=BC=8CMi=
hai Don=C8=9Bu =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thursday 17 March 2011 00:35:02 Rafa=C5=82 Mi=C5=82ecki wrote:
> > 2011/3/16 Mihai Don=C8=9Bu <mihai.dontu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > > Added linux-usb and linux-wireless to CC.
> > >=20
> > > On Thursday 17 March 2011 00:18:31 Mihai Don=C8=9Bu wrote:
> > >> Hi,
> > >>=20
> > >> I have just upgraded to 2.6.38 and discovered that I can't use m=
y
> > >> wireless device (BCM4312 802.11a/b/g). I press Fn + F2, the blue=
tooth
> > >> led lights and after a second it turns off by itself. In dmesg I=
'm
> > >> seeing the following:
> > >>=20
> > >> [   88.167212] usb 1-2.2: new full speed USB device using ehci_h=
cd and
> > >> address 5
> > >> [   88.782330] usb 1-2.2: USB disconnect, address 5
> > >>=20
> > >> I switched to 2.6.37 until I'll have some time to bisect this. I=
n the
> > >> mean time I have attached the output of lspci, interrupts and dm=
esg.
> >=20
> > I suspect it's WMI related. What is your machine?
>=20
> It's a Dell Latitude D520 but I can't find a link with full specs (in=
=20
> English).
>=20
> > Please check:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D31002
> > http://comments.gmane.org/gmane.linux.acpi.devel/49577
> >=20
> > I can't help you more, I just noticed such a issue reported on ACPI
> > ML, you have to dig into this yourself (or someone else may help yo=
u).
>=20
> Thanks for the links. I'll see if I can get anywhere from there.
>=20


--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
