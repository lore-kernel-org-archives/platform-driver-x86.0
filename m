From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Fri, 15 Apr 2016 15:03:33 +0930
Message-ID: <20160415053333.GP12741@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
 <20160412123634.GA8195@marvin.atrad.com.au>
 <20160415044255.GE3232@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:38548 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbcDOFgS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 01:36:18 -0400
Content-Disposition: inline
In-Reply-To: <20160415044255.GE3232@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 14, 2016 at 09:42:55PM -0700, Darren Hart wrote:
> > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
>=20
> Jonathan, please check your character set, a few mangled characters h=
ere
> which I have to fix up to use.  UTF-8 seems to work reliably.

Sorry about that.  Normally UTF-8 stuff goes through just fine so I'm n=
ot sure
what happened there.  I'll admit I've never touched the default mutt ch=
arset
settings though so perhaps there's a corner case that's not being handl=
ed.=20
I'll look into it.

> > Acked-by: Jonathan Woithe <jwoithe@just42.net>
> >=20
> > Micha=C5=82 hasn't indicated that a revised patch is in the works s=
o I'm fine if
> > you proceed with the one below.  I've selected the relevant parts o=
f his
> > preamble for inclusion in the commit message, but feel free to edit=
 further
> > to your taste.
>=20
> Yeah, tough call, some guess work involved here, and where we are
> uncertain, we should document it.  I don't think we need to include b=
its
> about uncertain future plans or speculation on how things might be do=
ne.=20
> Keep it to what this patch does and any qualifiers a developer should=
 be
> aware of.

I agree.  Also note that a followup post from the original submitter
indicated they were happy to go with what I proposed.

> I've made a couple cosmetic changes and queued to for-next. Please re=
view
> and let me know if you have any concerns.

Sure.  Pardon my ignorance of such things, but what is the most
straight-forward way to review the queued commit (preferrably without
cloning an entire kernel git repo)?

jonathan
