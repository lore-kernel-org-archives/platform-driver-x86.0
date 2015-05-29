From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad_laptop: Add Lenovo G50-30 to devices without
 radio switch
Date: Fri, 29 May 2015 21:19:52 +0200
Message-ID: <20150529191952.GA42403@vmdeb7>
References: <1432905601-25381-1-git-send-email-philippe.coval@open.eurogiciel.org>
 <20150529164928.GB94698@vmdeb7>
 <55689BB6.6060807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39054 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882AbbE2TTz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 May 2015 15:19:55 -0400
Content-Disposition: inline
In-Reply-To: <55689BB6.6060807@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: Philippe Coval <philippe.coval@open.eurogiciel.org>, ike.pan@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 29, 2015 at 08:02:46PM +0300, Dmitry Tunin wrote:
> Darren,
>=20
> I sent this patch twice, second time with more detailed explanation.
> But got no answer. So I asked Philippe to push it.

Checked my Inbox, nothing from you on this one. Found it on the list. P=
lease see
the MAINTAINERS file and Cc the maintainer per Documentation/Submitting=
Patches:


    5) Select the recipients for your patch.
    ----------------------------------------

    You should always copy the appropriate subsystem maintainer(s) on a=
ny patch
    to code that they maintain; look through the MAINTAINERS file and t=
he source
    code revision history to see who those maintainers are.  The ...


This is why your patches were ignored (not ever seen) and why Philippe'=
s were
accepted.

>=20
> Regards,
>=20
> Dmitry.
>=20
> 29.05.2015 19:49, Darren Hart =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, May 29, 2015 at 03:20:01PM +0200, Philippe Coval wrote:
> >> From: Dmitry Tunin <hanipouspilot@gmail.com>
> >>
> >> Lenovo G50-30 rfkill always reports wireless blocked fix.
> >=20
> > A little more detail in the future please, remember the bug link is=
 a reference,
> > but this log is the official justification for the change. This bar=
ely makes it.
> >=20
> >> BugLink: https://bugs.launchpad.net/bugs/1397021
> >> Cc: platform-driver-x86@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> >> Signed-off-by: Philippe Coval <philippe.coval@open.eurogiciel.org>
> >=20
> > Queued for next.
> >=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
