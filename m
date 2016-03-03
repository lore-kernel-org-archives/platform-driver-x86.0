From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Thu, 3 Mar 2016 12:47:02 -0800
Message-ID: <20160303204702.GE1092@dvhart-mobl5.amr.corp.intel.com>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <201602292139.16006@pali>
 <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
 <201602292156.03876@pali>
 <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
 <20160302123504.GB25223@eudyptula.hq.kempniu.pl>
 <20160303171655.GD1092@dvhart-mobl5.amr.corp.intel.com>
 <20160303184632.GA26514@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39359 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbcCCUrE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Mar 2016 15:47:04 -0500
Content-Disposition: inline
In-Reply-To: <20160303184632.GA26514@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 03, 2016 at 07:46:32PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > Your description below helped explain why the KE_KEY change was nec=
essary, the
> > commit message didn't do that for me. Just explicitly stating "when=
 there is no
> > i8042 interrupt, the WMI even must generate a valid KE_KEY" or some=
thing along
> > those lines would help.
>=20
> I will do that in v5, then.
>=20
> > > > > > > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > > > > > >  =09
> > > > > > > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > > > > > > >=20
> > > > > > > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_ke=
y(int
> > > > > > > > > > reported_key)
> > > > > > > > > >=20
> > > > > > > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > > > > > > >  	=09
> > > > > > > > > >  		return;
> > > > > > > > > >=20
> > > > > > > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > > > > > > !wmi_requires_smbios_request) +		return;
> > > > > > > > > > +
> > > > > > > > >=20
> > > > > > > > > Here I would rather test against reported_key, not ke=
ycode. If
> > > > > > > > > somebody in future adds KEY_PROG4 for something else =
we will
> > > > > > > > > have problem...
> >=20
> > And ultimately, that is under our control. So let's just not do tha=
t :-)
> >=20
> > A comment by the definition of KEY_PROG4 that notes it's meaning in=
 this driver
> > should prevent any future attempts at overloading it and breaking t=
his.
>=20
> As I'll be sending a v5 anyway, do you think Pali's idea is bad?
> Personally, I'm leaning towards it.  IMHO comparing against reported_=
key
> would emphasize the fact that only event 0xe025 is "special" and chan=
ces
> are that there are no other WMI event codes which need to be handled
> this way.

I took another look at the discussion on 5/5 regarding event 0xe029, an=
d after
that, no, no objection from me. Go ahead with Pali's recommendation to =
test
against reported_key.

--=20
Darren Hart
Intel Open Source Technology Center
