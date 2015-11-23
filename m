From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Mon, 23 Nov 2015 15:56:43 +0100
Message-ID: <20151123145643.GH24147@pali>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
 <CALCETrW0A3rH-BAqTWUAOGhsERR+R5M4d9uCEcjNtJQZLW7zKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35579 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753840AbbKWO4q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 09:56:46 -0500
Received: by wmuu63 with SMTP id u63so57588061wmu.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 06:56:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CALCETrW0A3rH-BAqTWUAOGhsERR+R5M4d9uCEcjNtJQZLW7zKA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Friday 20 November 2015 17:30:13 Andy Lutomirski wrote:
> On Fri, Nov 20, 2015 at 5:27 PM, Andy Lutomirski <luto@kernel.org> wr=
ote:
> > If DMI lists a hotkey that we don't recognize, log and ignore it
> > instead of trying to map it to keycode 0.  I haven't seen this happ=
en,
> > but it will help maintain the key map in the future and it will hel=
p
> > avoid sending bogus events.
> >
> > This also improves the message that we log when we get an unknown k=
ey
> > event.
> >
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > ---
> >
> > Changes from v1:
> >  - Use KEY_RESERVED instead of zero and document why that's okay
> >  - Fix scancode vs keycode confusion in the log message (whoops!)
> >  - Switch from hardcoded 256 to ARRAY_SIZE
> >
> >  drivers/platform/x86/dell-wmi.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index d2daf5417cd7..cb96ef03fa79 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
>=20
>=20
> > +               /* Uninitialized entries are 0 aka KEY_RESERVED. */
> > +               BUILD_BUG_ON(KEY_RESERVED !=3D 0);
> > +               u16 keycode =3D (bios_entry->keycode <
> > +                              ARRAY_SIZE(bios_to_linux_keycode)) ?
> > +                       bios_to_linux_keycode[bios_entry->keycode] =
:
> > +                       KEY_RESERVED;
>=20
> Oops.  BUILD_BUG_ON should be below u16 keycode =3D ... to avoid a
> warning.  Feel free to fix it up.  I can also send a v3.

KEY_RESERVED is zero by definition and exported to user space. So this
should not be redefined otherwise Linux ABI will be broken too.

So I think BUILD_BUG_ON is not needed there.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
