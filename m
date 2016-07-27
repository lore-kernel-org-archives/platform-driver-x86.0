From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Wed, 27 Jul 2016 09:38:57 -0700
Message-ID: <20160727163857.GA2565@f23x64.localdomain>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
 <20160727072350.GF29844@pali>
 <1469634909478.10239@Dell.com>
 <201607271805.57123@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56568 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756828AbcG0QjA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 12:39:00 -0400
Content-Disposition: inline
In-Reply-To: <201607271805.57123@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario_Limonciello@dell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, Jul 27, 2016 at 06:05:57PM +0200, Pali Roh=E1r wrote:
> On Wednesday 27 July 2016 17:55:09 Mario_Limonciello@dell.com wrote:
> > > Hi! I'm not sure if KEY_PROG1/2/3 are good names here as we alrea=
dy
> > > use
> > >
> > >those for other actions (see bios_to_linux_keycode). Also there is=
:
> > I had missed this, do you have some recommendations on what would b=
e
> > better codes to map this to?
>=20
> Problem is that I do not know when those KEY_PROG keys from=20
> bios_to_linux_keycode table are emitted. There are missing comments o=
r=20
> description.
>=20
> Are you able to find out description for all those keys in that table=
?=20
> Maybe now (when linux key constants are extended), there could be bet=
ter=20
> candidates...
>=20
> > I'll double check what the things that "were" mapping to KEY_PROG1
> > etc actually were.  This might be a case of an expected clash if th=
e
> > functions aren't in current generations.
> >=20
> > >/* Wifi Catcher */
> > >
> > > { KE_KEY,    0xe011, { KEY_PROG2 } },
> >=20
> > It's worth mentioning that Wifi Catcher hasn't been used for any De=
ll
> > laptops for a handful generations.  The rugged 2in1's are current
> > generation that have these programmable buttons and don't have wifi
> > catcher.
>=20
> Anyway, what is "Wifi Catcher"? HW switch buttton which enable/disabl=
e=20
> wifi? Or something else?
>=20
> > So there should be no "real" clash here.
>=20
> Problem can be in future. This driver is unified for all Dell product=
s=20
> with wmi interface and so future product could do some nasty things..=
=2E

I suggest not worrying too much about unknown future platforms when it =
comes to
things like key names, we cannot predict this, and can address it when/=
if it
becomes a problem.



--=20
Darren Hart
Intel Open Source Technology Center
