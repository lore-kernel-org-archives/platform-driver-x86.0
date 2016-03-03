From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Thu, 3 Mar 2016 19:46:32 +0100
Message-ID: <20160303184632.GA26514@eudyptula.hq.kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <201602292139.16006@pali>
 <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
 <201602292156.03876@pali>
 <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
 <20160302123504.GB25223@eudyptula.hq.kempniu.pl>
 <20160303171655.GD1092@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160303171655.GD1092@dvhart-mobl5.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Your description below helped explain why the KE_KEY change was neces=
sary, the
> commit message didn't do that for me. Just explicitly stating "when t=
here is no
> i8042 interrupt, the WMI even must generate a valid KE_KEY" or someth=
ing along
> those lines would help.

I will do that in v5, then.

> > > > > > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > > > > >  =09
> > > > > > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > > > > > >=20
> > > > > > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(=
int
> > > > > > > > > reported_key)
> > > > > > > > >=20
> > > > > > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > > > > > >  	=09
> > > > > > > > >  		return;
> > > > > > > > >=20
> > > > > > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > > > > > !wmi_requires_smbios_request) +		return;
> > > > > > > > > +
> > > > > > > >=20
> > > > > > > > Here I would rather test against reported_key, not keyc=
ode. If
> > > > > > > > somebody in future adds KEY_PROG4 for something else we=
 will
> > > > > > > > have problem...
>=20
> And ultimately, that is under our control. So let's just not do that =
:-)
>=20
> A comment by the definition of KEY_PROG4 that notes it's meaning in t=
his driver
> should prevent any future attempts at overloading it and breaking thi=
s.

As I'll be sending a v5 anyway, do you think Pali's idea is bad?
Personally, I'm leaning towards it.  IMHO comparing against reported_ke=
y
would emphasize the fact that only event 0xe025 is "special" and chance=
s
are that there are no other WMI event codes which need to be handled
this way.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
