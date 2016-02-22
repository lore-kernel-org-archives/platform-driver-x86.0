From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Mon, 22 Feb 2016 10:03:14 +0100
Message-ID: <20160222090314.GB4606@pali>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
 <20160220012457.GC23707@dvhart-mobl5.amr.corp.intel.com>
 <20160222085650.GA8322@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37154 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224AbcBVJDS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Feb 2016 04:03:18 -0500
Content-Disposition: inline
In-Reply-To: <20160222085650.GA8322@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 22 February 2016 09:56:50 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > >  /*
> > >   * Certain keys are flagged as KE_IGNORE. All of these are eithe=
r
> > >   * notifications (rather than requests for change) or are also s=
ent
> > > @@ -513,6 +533,7 @@ static int __init dell_wmi_init(void)
> > >  {
> > >  	int err;
> > >  	acpi_status status;
> > > +	struct calling_interface_buffer *buffer;
> >=20
> > Please place the longest line first, and move int err to the last d=
eclaration.
> > When changing declarations of local variables, please use "Reverse =
Christmas
> > Tree" order (longest line to shortest line) wherever possible.
>=20
> Thanks, I'll keep that in mind for the future, though putting the
> WMI-enabling SMBIOS request in a separate function renders the need f=
or
> the buffer variable in dell_wmi_init() void, so v4 won't touch this a=
rea
> any more.
>=20
> > Pali's point about documenting the hardcoded values and eliminating=
 the code
> > duplication with a function (inline) is a good one.
>=20
> I plan to only put a comment next to 0x51534554 as 0x10000 is apparen=
tly
> just something pulled out of a hat (as the link provided in the commi=
t
> message proves) and input[3] should be self-explanatory due to the na=
me
> of the variable whose value is put into it.

Maybe you can add documentation which we got from Dell on some ML about
this SMI call. Similarly what I added in dell-laptop.c...

> By the way, is there any kernel-wide or subsystem-wide policy for
> marking a function inline?  I mean, this is hardly time-critical code=
,
> so is your suggestion to make it inline just a preference or am I
> unaware of some rule?

IIRC recent versions of gcc ignores "inline" keyword and inline
functions as needed when doing optimizations.

If there is some functions which must be inlined you need to to use gcc
attrbiute always_inline.

But if there is policy? I do not know, maybe somebody else should
comment it.

> > Otherwise, this series looks good to me. Looking forward to merging=
 v4.
>=20
> I'll try to post a v4 within the next couple of days.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
