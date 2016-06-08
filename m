From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Wed, 8 Jun 2016 13:43:28 -0700
Message-ID: <20160608204328.GH28348@f23x64.localdomain>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <201606082157.26447@pali>
 <20160608201518.GE28348@f23x64.localdomain>
 <201606082227.20875@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45562 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753817AbcFHUne (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:43:34 -0400
Content-Disposition: inline
In-Reply-To: <201606082227.20875@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 08, 2016 at 10:27:20PM +0200, Pali Roh=C3=A1r wrote:
> On Wednesday 08 June 2016 22:15:18 Darren Hart wrote:
> > On Wed, Jun 08, 2016 at 09:57:26PM +0200, Pali Roh=C3=A1r wrote:
> > > On Wednesday 08 June 2016 21:48:24 Darren Hart wrote:
> > > > On Wed, Jun 08, 2016 at 12:03:24AM +0200, Pali Roh=C3=A1r wrote=
:
> > > > > On Thursday 02 June 2016 12:41:42 Micha=C5=82 K=C4=99pie=C5=84=
 wrote:
> > > > > > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > > >=20
> > > > > > My guess is that Darren won't let you off without at least =
a
> > > > > > short commit message.
> > > > >=20
> > > > > I have no idea what else to write. I think that description i=
s
> > > > > enough.
> > > >=20
> > > > There is always something. For example, why? See
> > > > Documentation/SubmittingPatches section "14) The canonical patc=
h
> > > > format" for an explanation.
> > > >=20
> > > > "Traceability" of changes is important. If it's worth preparing
> > > > the patch, it's worth documenting why.
> > >=20
> > > In my opinion current description is enough and cover everything
> > > what this patch is doing. I think it is clear from my description
> > > what this patch is doing and so it is documented.
> > >=20
> > > But if it is not clear and something is missing, let me know or
> > > show what is wrong and how you change it... It is just my
> > > assumption that "Sort WMI event codes and update comments" is
> > > clear...
> >=20
> > The patch summary accurately states what it does. It does not expla=
in
> > why it does it, or why it is necessary. I understand this is a
> > trivial change, but also understand that both maintainers and peopl=
e
> > doing maintenance and regression analysis will appreciate
> > understanding the motivation and intent of the patch, in addition t=
o
> > the content of the patch.
> >=20
> > From the maintainer perspective, whether we have 20 or 200 patches =
to
> > review, we will naturally merge the ones that require the least
> > effort first. This maximizes our efficiency and benefits the most
> > people with what time we have available. For many of us, this is ou=
r
> > nights and weekends (guessing that's the case for you as well). It
> > is in the submitter's best interest to take the time document the
> > why, what, and how of each patch in a way that minimizes the effort
> > on the part of the maintainer to decide if the patch should be
> > merged. It is also a matter of scale, if every patch conforms to
> > these guidelines, the workflow is much more efficient.
> >=20
> > In this case, I don't know why you decided to sort the event codes =
or
> > update the comments. I assume the comments were wrong before, but
> > maybe something changed. Do you care about alphabetically order or
> > optimizing the switch statements? Is it purely for legibility? Etc.
> >=20
> > If that isn't sufficient, then just do it out of self-interest,
> > because I will not send patches to Linus that do not provide both a
> > summary and a description in the commit which meet the guidelines o=
f
> > section 14 referenced above.
> >=20
> > Thanks,
>=20
> I fully understand your maintainer perspective. I just though that my=
=20
> one line explain everything what is needed about my patch...
>=20
> So do you want to include reason for my patch? What about this=20
> additional description?
>=20
> =3D=3D=3D
> For better readability of keymap table, sort events by codes and also=
=20
> update comments for events to be more informative.

Great, that works for me. Reason was readability and providing context.

I'm just getting to the series now, if it's otherwise ready, I'll inclu=
de this
myself. If changes are required, I'll leave it to you. Thanks Pali.

--=20
Darren Hart
Intel Open Source Technology Center
