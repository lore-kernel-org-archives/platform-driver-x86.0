From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Sony-laptop: fix sparse warning
Date: Sat, 7 Feb 2015 12:07:10 -0800
Message-ID: <20150207200710.GA42679@vmdeb7>
References: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
 <54D39283.4070300@gmail.com>
 <CA+V-a8utKmCRLgWMEMSzPv01hQ5F_nXeyYQe5r9ZKiqTw_uddg@mail.gmail.com>
 <20150207030827.GC20934@fury.dvhart.com>
 <87386irm6b.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57407 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758668AbbBGUHT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Feb 2015 15:07:19 -0500
Content-Disposition: inline
In-Reply-To: <87386irm6b.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>

On Sat, Feb 07, 2015 at 12:33:16PM +0100, Bj=F8rn Mork wrote:
> Darren Hart <dvhart@infradead.org> writes:
> > On Thu, Feb 05, 2015 at 04:00:32PM +0000, Lad, Prabhakar wrote:
> >
> >> Lad, Prabhakar <prabhakar.lad@ti.com>
> >> Lad, Prabhakar <prabhakar.csengg@gmail.com>
> >
> > I think there may be a problem with this in an unquoted email addre=
ss. The
> > unquoted local part, per RFC 2822 3.4.1, can only contain  !#$%'*+-=
/=3D?^_`{|}~
> > and . separators.
>=20
> Yes, but that is not applicable to the git commit tags.  They are not
> RFC2822 header fields.  Nothing will ever parse "Lad" as an unqualifi=
ed
> local destination in a SOB, and therefore there is no problem using t=
he
> comma there.

Also, my reading was incorrect as "local part" refers to the text prece=
eding
the @ character, not the text outside the <>. So, while the name should=
 probably
be quoted to avoid problems with MUAs interpretting the , as a list sep=
arator, I
don't have anything definitive to reference to prevent it. So at least =
for now,
I'll be accepting Lad's contributions as is, comma and all :-)

I really dislike this aspect of our tooling. Being so free form, it's
inevitiable for even seasoned contributors to trip over these sort of i=
mplicit
rules. It seems to me that a very significant, perhaps not the majority=
, of the
time I spend as maintainer is dealing with things like coding style, co=
mmit
message formatting, and similar issues. I can sympathize with those who
criticize our mechanisms as archaic :-/

>=20
> Note that names using non-ascii characters are often written without
> quotes i SOBs (wonder how I know this? :-).  In practice I believe th=
e
> character set is only limited by what you will allow in your git log.
> The only characters with a special meaning are :<>#, and the latter i=
s
> somewhat dubious.  But it's often used as a comment separator in stab=
le
> CCs, so I guess it should be avoided for other uses.
>=20
> Scripts etc trying to parse these tags into email headers must be
> prepared to do the necessary stripping and quoting of any text outsid=
e
> the <> brackets.
>=20
> Requiring a full name is of course good for accountability, but do le=
t
> people format their names as they want them to appear in the log.
> Different cultures have different traditions. Wookey has collected a =
few
> links on this subject if anyone is interested:
> http://wookware.org/name.html
>=20

Thanks Bj=F8rn :-)

>=20
> Bj=F8rn
>=20

--=20
Darren Hart
Intel Open Source Technology Center
