From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Thu, 26 Nov 2015 15:55:56 +0100
Message-ID: <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
 <20151126144130.GI14190@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35915 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbbKZO4B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Nov 2015 09:56:01 -0500
Received: by lfs39 with SMTP id 39so97741316lfs.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2015 06:55:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151126144130.GI14190@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Pali,

> Can you wait just a little bit? Till end of month two Dell kernel dev=
s
> are on vacation, so after that they maybe answer to question about ne=
w
> hotkey format/support in kernel.

Absolutely, after all this issue is already several months old (or even
years, depending on how you interpret it).  I just didn't want it to
fade into the void.

> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index 8cb0f57..e68ce3b 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -44,6 +44,10 @@ MODULE_LICENSE("GPL");
> >  #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
> > =20
> >  static int acpi_video;
> > +static bool process_dil;
> > +
> > +module_param(process_dil, bool, 0644);
> > +MODULE_PARM_DESC(process_dil, "Generate an input event when the WM=
I event for Dell Instant Launch hotkey is received");
>=20
> I do not like name "dil". It takes me few minutes to interpret it as
> Dell Instant Launch...

Yes, it's ugly.  I really wanted to avoid process_dell_instant_launch.
Perhaps I shouldn't have?

> Also I do not know if this is the best approach.

Same here, that's why I submitted this patch for discussion.

> >  	/* Shortcut and audio panel keys */
> > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
>=20
> I'm trying to figure out if those two keys are really reported via
> keyboard controller or not. They were added 4 years ago in commit
> f1566f0dc07ec9b5409b348070f5a700032d7881. But from bug report
> http://bugs.launchpad.net/bugs/815914 there is no information if thos=
e
> two keys are really reported by keyboard controller or not.
>=20
> And if not our problem could be easier...

That would indeed be sweet as this patch could then be shrinked to just
changing the entry in the sparse keymap.  Does anyone have a Dell XPS
L502X handy?  Also, any ideas for making sure no other model is
generating that keypress?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
