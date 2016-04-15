From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Thu, 14 Apr 2016 21:42:55 -0700
Message-ID: <20160415044255.GE3232@f23x64.localdomain>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
 <20160412123634.GA8195@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39721 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbcDOEnC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 00:43:02 -0400
Content-Disposition: inline
In-Reply-To: <20160412123634.GA8195@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 12, 2016 at 10:06:34PM +0930, Jonathan Woithe wrote:
> Hi Darren
>=20
> On Sun, Apr 10, 2016 at 08:22:58PM +0930, Jonathan Woithe wrote:
> > On Sat, Apr 09, 2016 at 07:30:20PM -0700, Darren Hart wrote:
> > > Jonathan, Micha??,
> > >=20
> > > Where are we with this? The above reads as "Doesn't appear to bre=
ak existing
> > > systems on hand". Jonathan, are you happy with this patch?
> >=20
> > Sorry, I got caught up over the last couple of weeks with other tas=
ks and
> > have not yet managed to confirm the lack of regressions on the S702=
0.  It
> > was on my list for this coming week though.  My comments quoted abo=
ve were
> > theoretical rather than based on an actual test.  The patch appears=
 fairly
> > innoculous given that BTNI bit 24 is not set on the S7020 but for
> > completeness I would prefer to give it a run on the S7020 before we=
 merge
> > the patch.  I will make an effort to fit this in over the next coup=
le of
> > days.
>=20
> I have now tested the patch on the S7020 and unsurprisingly I have no=
t
> observed any regressions.  I'm therefore happy to take the patch more=
 or
> less as is.  However, I would like to see a brief comment in
> acpi_fujitsu_hotkey_add() about the use of bit 24 in BTNI to determin=
e
> whether the LED handler should be registered since the reasoning is n=
ot
> obvious and is not evident from the code.  A copy of the original pat=
ch with
> such a comment inserted (no code changes) is below.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

Jonathan, please check your character set, a few mangled characters her=
e which I
have to fix up to use. UTF-8 seems to work reliably.

Your headers currently include:
Content-Type: text/plain; charset=3Diso-8859-1

> Acked-by: Jonathan Woithe <jwoithe@just42.net>
>=20
> Micha=C5=82 hasn't indicated that a revised patch is in the works so =
I'm fine if
> you proceed with the one below.  I've selected the relevant parts of =
his
> preamble for inclusion in the commit message, but feel free to edit f=
urther
> to your taste.
>=20

Yeah, tough call, some guess work involved here, and where we are uncer=
tain, we
should document it. I don't think we need to include bits about uncerta=
in future
plans or speculation on how things might be done. Keep it to what this =
patch
does and any qualifiers a developer should be aware of.

I've made a couple cosmetic changes and queued to for-next. Please revi=
ew and
let me know if you have any concerns.

--=20
Darren Hart
Intel Open Source Technology Center
