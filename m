From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Mon, 28 Mar 2016 10:44:38 -0700
Message-ID: <20160328174438.GB26086@dvhart-mobl5.amr.corp.intel.com>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:49412 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753149AbcC1RrL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 13:47:11 -0400
Content-Disposition: inline
In-Reply-To: <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 22, 2016 at 02:30:51PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:

=2E..

> > > First of all, this patch raises a couple of checkpatch warnings.
> >=20
> > The code on the whole reads well so I would be happy with it as is.=
  Making
> > it (and the existing code) fully compliant with checkpatch results =
in harder
> > to read code - at least that was the consensus when it was initiall=
y merged,
> > which is why it was left in the current state.  Darren may have an
> > alternative view on this though, in which case I'm happy to defer t=
o his
> > preference.
>=20
> Thanks for the explanation.  It's just something that crossed my mind=
=2E
>=20
> Darren, feel free to let me know if you would like to get this done.

I primarily care about Errors getting fixed, Warnings we take on a case=
 by case
basis, but err on the side of legibility. In the case of a driver with =
an active
maintainer like Johnathan, I also weigh their input heavily. I haven't =
applied
it yet, so if I see something particularly concerning, I'll raise it at=
 that
point.
--=20
Darren Hart
Intel Open Source Technology Center
