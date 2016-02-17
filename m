From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 4/5] dell-wmi: Support new hotkeys on the XPS 13 9350
 (Skylake)
Date: Tue, 16 Feb 2016 23:29:42 -0800
Message-ID: <20160217072942.GB22091@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <201602151820.56085@pali>
 <56C20A40.6010807@dell.com>
 <201602151837.16114@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42869 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756450AbcBQH3s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 02:29:48 -0500
Content-Disposition: inline
In-Reply-To: <201602151837.16114@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>

On Mon, Feb 15, 2016 at 06:37:16PM +0100, Pali Roh=E1r wrote:
> On Monday 15 February 2016 18:26:24 Mario Limonciello wrote:
> > On 02/15/2016 11:20 AM, Pali Roh=E1r wrote:
> > > On Monday 15 February 2016 17:32:36 Andy Lutomirski wrote:
> > >> +       /* Stealth mode toggle */
> > >> +       { KE_IGNORE, 0x155, { KEY_RESERVED } },
> > >=20
> > > Hi! Just one question, what does this "Stealth mode" means and wh=
at
> > > this toggle key/button doing?
> > >=20
> > > I would propose for Laptops manufactures to revert back normal
> > > nonchiclet keyboard with full 105 normal keys (with F1-F12) inste=
ad
> > > inventing such useless and crappy/funny names for keys/buttons on
> > > laptops which replace PgUP/PgDown/SysRq and etc...
> >=20
> > Pali,
> >=20
> > Stealth mode will "disable all lights and sounds".  The event is fo=
r
> > notification only.  The actual change is performed by a combination
> > of the BIOS and EC.
> >=20
> > There is also a BIOS setting that disables the hotkey from doing
> > anything.
> >=20
> > Thanks,
>=20
> Thank you! Now I can image what this line in diff means :-)
>=20
> Anyway, I would propose some rule to and longer description for newly=
=20
> invented hot key events which are marked as KEY_RESERVED in kernel=20
> source code. Really sometimes it is hard to guess what it can means a=
nd=20
> constant KEY_RESERVED does not help much more.

Since we got the update from Mario, could you include the "disable all =
lights
and sounds" blurb in the KEY_RESERVED comment for stealth mode as part =
of the
next spin.

Pali, is that your only concern with this series?

--=20
Darren Hart
Intel Open Source Technology Center
