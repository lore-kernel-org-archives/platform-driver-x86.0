From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Mon, 22 Feb 2016 09:56:50 +0100
Message-ID: <20160222085650.GA8322@eudyptula.hq.kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
 <20160220012457.GC23707@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35187 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243AbcBVI4y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Feb 2016 03:56:54 -0500
Received: by mail-lb0-f171.google.com with SMTP id bc4so77970753lbc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Feb 2016 00:56:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160220012457.GC23707@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> >  /*
> >   * Certain keys are flagged as KE_IGNORE. All of these are either
> >   * notifications (rather than requests for change) or are also sen=
t
> > @@ -513,6 +533,7 @@ static int __init dell_wmi_init(void)
> >  {
> >  	int err;
> >  	acpi_status status;
> > +	struct calling_interface_buffer *buffer;
>=20
> Please place the longest line first, and move int err to the last dec=
laration.
> When changing declarations of local variables, please use "Reverse Ch=
ristmas
> Tree" order (longest line to shortest line) wherever possible.

Thanks, I'll keep that in mind for the future, though putting the
WMI-enabling SMBIOS request in a separate function renders the need for
the buffer variable in dell_wmi_init() void, so v4 won't touch this are=
a
any more.

> Pali's point about documenting the hardcoded values and eliminating t=
he code
> duplication with a function (inline) is a good one.

I plan to only put a comment next to 0x51534554 as 0x10000 is apparentl=
y
just something pulled out of a hat (as the link provided in the commit
message proves) and input[3] should be self-explanatory due to the name
of the variable whose value is put into it.

By the way, is there any kernel-wide or subsystem-wide policy for
marking a function inline?  I mean, this is hardly time-critical code,
so is your suggestion to make it inline just a preference or am I
unaware of some rule?

> Otherwise, this series looks good to me. Looking forward to merging v=
4.

I'll try to post a v4 within the next couple of days.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
