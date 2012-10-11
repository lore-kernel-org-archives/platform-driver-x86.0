From: =?ISO-8859-1?Q?Trep=E1k?= Vilmos <trepo@netcomga.sk>
Subject: Re: [PATCH] Platform: hp-wmi: add rfkill support for integrated GPS
Date: Thu, 11 Oct 2012 15:15:47 +0200
Message-ID: <1349961347.29045.8.camel@pluto.netcomga.sk>
References: <1349952660.1577.43.camel@pluto.netcomga.sk>
	 <20121011123415.GA6056@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.netcomga.sk ([217.118.103.2]:39026 "EHLO netcomga.sk"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756353Ab2JKNPr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Oct 2012 09:15:47 -0400
In-Reply-To: <20121011123415.GA6056@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2012-10-11 at 13:34 +0100, Matthew Garrett wrote:
> On Thu, Oct 11, 2012 at 12:51:00PM +0200, Trep=C3=A1k Vilmos wrote:
> > @@ -663,6 +669,24 @@ static int __devinit hp_wmi_rfkill_setup
> >  			goto register_bluetooth_error;
> >  	}
> > =20
> > +	if (wireless & 0x3) {
> > +		gps_rfkill =3D rfkill_alloc("hp-gps", &device->dev,
> > +						RFKILL_TYPE_GPS,
> > +						&hp_wmi_rfkill_ops,
> > +						(void *) HPWMI_GPS);
>=20
> I don't think this bit is right - in this codepath, wireless is a mas=
k,=20
> so 0x3 would mean wifi and bluetooth, not gps. I'd expect gps to be 0=
x8.

And you'd expect right. Re-tested with 0x8, it works.

> =20
> The rest looks good, though.
>=20

Of course it does, it's just copy & paste & replace... I don't even
think I deserve credit for it.

Is it worth it to resubmit the patch for a 1-byte change or will you
just take care of it yourself? If it's easier for you, I'll resubmit.


--=20
Trep=C3=A1k Vilmos <trepo@netcomga.sk>
