From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Sony-laptop: fix sparse warning
Date: Fri, 6 Feb 2015 19:08:27 -0800
Message-ID: <20150207030827.GC20934@fury.dvhart.com>
References: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
 <54D39283.4070300@gmail.com>
 <CA+V-a8utKmCRLgWMEMSzPv01hQ5F_nXeyYQe5r9ZKiqTw_uddg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54674 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754101AbbBGDIa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Feb 2015 22:08:30 -0500
Content-Disposition: inline
In-Reply-To: <CA+V-a8utKmCRLgWMEMSzPv01hQ5F_nXeyYQe5r9ZKiqTw_uddg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>

On Thu, Feb 05, 2015 at 04:00:32PM +0000, Lad, Prabhakar wrote:
> Hi Giedrius,
>=20
> On Thu, Feb 5, 2015 at 3:55 PM, Giedrius Statkevi=C4=8Dius
> <giedrius.statkevicius@gmail.com> wrote:
> > On 2015.02.05 16:49, Lad Prabhakar wrote:
> >> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> >>
> >> this patch fixes following sparse warning:
> >>
> >> sony-laptop.c:1035:29: warning: symbol 'sony_bl_props' was not dec=
lared. Should it be static?
> >>
> >> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Don't put a comma between your first and last name, please. Also, i=
s
> > this your real name and surname?
> >
> I have hundreds of patches with:
>=20
> Lad, Prabhakar <prabhakar.lad@ti.com>
> Lad, Prabhakar <prabhakar.csengg@gmail.com>

I think there may be a problem with this in an unquoted email address. =
The
unquoted local part, per RFC 2822 3.4.1, can only contain  !#$%'*+-/=3D=
?^_`{|}~
and . separators.

David Miller is the one who usually catches this sort of thing. David, =
do we
have a problem here?

>=20
> I don=E2=80=99t want to change it now! Yes that's my real name.
>=20
> Cheers,
> --Prabhakar
>=20

--=20
Darren Hart
Intel Open Source Technology Center
