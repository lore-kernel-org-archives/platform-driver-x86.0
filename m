From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Thu, 14 Apr 2016 22:44:52 -0700
Message-ID: <20160415054417.GA127188@f23x64.localdomain>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
 <20160412123634.GA8195@marvin.atrad.com.au>
 <20160415044255.GE3232@f23x64.localdomain>
 <20160415053333.GP12741@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48613 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbcDOFoz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 01:44:55 -0400
Content-Disposition: inline
In-Reply-To: <20160415053333.GP12741@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 15, 2016 at 03:03:33PM +0930, Jonathan Woithe wrote:
> On Thu, Apr 14, 2016 at 09:42:55PM -0700, Darren Hart wrote:
> > > Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> >=20
> > Jonathan, please check your character set, a few mangled characters=
 here
> > which I have to fix up to use.  UTF-8 seems to work reliably.
>=20
> Sorry about that.  Normally UTF-8 stuff goes through just fine so I'm=
 not sure
> what happened there.  I'll admit I've never touched the default mutt =
charset
> settings though so perhaps there's a corner case that's not being han=
dled.=20
> I'll look into it.
>=20
> > > Acked-by: Jonathan Woithe <jwoithe@just42.net>
> > >=20
> > > Micha=C5=82 hasn't indicated that a revised patch is in the works=
 so I'm fine if
> > > you proceed with the one below.  I've selected the relevant parts=
 of his
> > > preamble for inclusion in the commit message, but feel free to ed=
it further
> > > to your taste.
> >=20
> > Yeah, tough call, some guess work involved here, and where we are
> > uncertain, we should document it.  I don't think we need to include=
 bits
> > about uncertain future plans or speculation on how things might be =
done.=20
> > Keep it to what this patch does and any qualifiers a developer shou=
ld be
> > aware of.
>=20
> I agree.  Also note that a followup post from the original submitter
> indicated they were happy to go with what I proposed.
>=20
> > I've made a couple cosmetic changes and queued to for-next. Please =
review
> > and let me know if you have any concerns.
>=20
> Sure.  Pardon my ignorance of such things, but what is the most
> straight-forward way to review the queued commit (preferrably without
> cloning an entire kernel git repo)?

You can see the tree in the MAINTAINERS file, but I suppose that doesn'=
t make it
obvious how to browse it. You can do that via the git web interface on
infradead. The direct link to this patch is here:

http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/co=
mmit/34b5199d2b69f9be731233af2425c53cc7ff995b

--=20
Darren Hart
Intel Open Source Technology Center
