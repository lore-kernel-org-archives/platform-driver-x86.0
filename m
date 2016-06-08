From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Wed, 8 Jun 2016 13:15:18 -0700
Message-ID: <20160608201518.GE28348@f23x64.localdomain>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <20160607220324.GN29844@pali>
 <20160608194824.GC28348@f23x64.localdomain>
 <201606082157.26447@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36115 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162227AbcFHUPX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:15:23 -0400
Content-Disposition: inline
In-Reply-To: <201606082157.26447@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 08, 2016 at 09:57:26PM +0200, Pali Roh=C3=A1r wrote:
> On Wednesday 08 June 2016 21:48:24 Darren Hart wrote:
> > On Wed, Jun 08, 2016 at 12:03:24AM +0200, Pali Roh=C3=A1r wrote:
> > > On Thursday 02 June 2016 12:41:42 Micha=C5=82 K=C4=99pie=C5=84 wr=
ote:
> > > > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > >=20
> > > > My guess is that Darren won't let you off without at least a
> > > > short commit message.
> > >=20
> > > I have no idea what else to write. I think that description is
> > > enough.
> >=20
> > There is always something. For example, why? See
> > Documentation/SubmittingPatches section "14) The canonical patch
> > format" for an explanation.
> >=20
> > "Traceability" of changes is important. If it's worth preparing the
> > patch, it's worth documenting why.
>=20
> In my opinion current description is enough and cover everything what=
=20
> this patch is doing. I think it is clear from my description what thi=
s=20
> patch is doing and so it is documented.
>=20
> But if it is not clear and something is missing, let me know or show=20
> what is wrong and how you change it... It is just my assumption that=20
> "Sort WMI event codes and update comments" is clear...

The patch summary accurately states what it does. It does not explain w=
hy it
does it, or why it is necessary. I understand this is a trivial change,=
 but also
understand that both maintainers and people doing maintenance and regre=
ssion
analysis will appreciate understanding the motivation and intent of the=
 patch,
in addition to the content of the patch.

=46rom the maintainer perspective, whether we have 20 or 200 patches to=
 review, we
will naturally merge the ones that require the least effort first. This
maximizes our efficiency and benefits the most people with what time we=
 have
available. For many of us, this is our nights and weekends (guessing th=
at's the
case for you as well). It is in the submitter's best interest to take t=
he time
document the why, what, and how of each patch in a way that minimizes t=
he effort
on the part of the maintainer to decide if the patch should be merged. =
It is
also a matter of scale, if every patch conforms to these guidelines, th=
e
workflow is much more efficient.

In this case, I don't know why you decided to sort the event codes or u=
pdate the
comments. I assume the comments were wrong before, but maybe something =
changed.
Do you care about alphabetically order or optimizing the switch stateme=
nts? Is
it purely for legibility? Etc.

If that isn't sufficient, then just do it out of self-interest, because=
 I will
not send patches to Linus that do not provide both a summary and a desc=
ription
in the commit which meet the guidelines of section 14 referenced above.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
