From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 4/5] dell-wmi: Support new hotkeys on the XPS 13 9350
 (Skylake)
Date: Wed, 17 Feb 2016 12:19:12 +0100
Message-ID: <20160217111912.GR1476@pali>
References: <cover.1455553470.git.luto@kernel.org>
 <201602151820.56085@pali>
 <56C20A40.6010807@dell.com>
 <201602151837.16114@pali>
 <20160217072942.GB22091@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37524 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161149AbcBQLTP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 06:19:15 -0500
Received: by mail-wm0-f50.google.com with SMTP id g62so23195444wme.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Feb 2016 03:19:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160217072942.GB22091@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>

On Tuesday 16 February 2016 23:29:42 Darren Hart wrote:
> On Mon, Feb 15, 2016 at 06:37:16PM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 15 February 2016 18:26:24 Mario Limonciello wrote:
> > > On 02/15/2016 11:20 AM, Pali Roh=C3=A1r wrote:
> > > > On Monday 15 February 2016 17:32:36 Andy Lutomirski wrote:
> > > >> +       /* Stealth mode toggle */
> > > >> +       { KE_IGNORE, 0x155, { KEY_RESERVED } },
> > > >=20
> > > > Hi! Just one question, what does this "Stealth mode" means and =
what
> > > > this toggle key/button doing?
> > > >=20
> > > > I would propose for Laptops manufactures to revert back normal
> > > > nonchiclet keyboard with full 105 normal keys (with F1-F12) ins=
tead
> > > > inventing such useless and crappy/funny names for keys/buttons =
on
> > > > laptops which replace PgUP/PgDown/SysRq and etc...
> > >=20
> > > Pali,
> > >=20
> > > Stealth mode will "disable all lights and sounds".  The event is =
for
> > > notification only.  The actual change is performed by a combinati=
on
> > > of the BIOS and EC.
> > >=20
> > > There is also a BIOS setting that disables the hotkey from doing
> > > anything.
> > >=20
> > > Thanks,
> >=20
> > Thank you! Now I can image what this line in diff means :-)
> >=20
> > Anyway, I would propose some rule to and longer description for new=
ly=20
> > invented hot key events which are marked as KEY_RESERVED in kernel=20
> > source code. Really sometimes it is hard to guess what it can means=
 and=20
> > constant KEY_RESERVED does not help much more.
>=20
> Since we got the update from Mario, could you include the "disable al=
l lights
> and sounds" blurb in the KEY_RESERVED comment for stealth mode as par=
t of the
> next spin.
>=20
> Pali, is that your only concern with this series?

Just I would like to know reason for NetworkManager in 5/5. But patches
looks good, so you can add my Acked-by.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
