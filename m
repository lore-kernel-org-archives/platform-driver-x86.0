From: Mattia Dongili <malattia@linux.it>
Subject: Re: [GIT] x86 platform driver bugfixes for 3.8
Date: Thu, 17 Jan 2013 06:29:56 +0900
Message-ID: <20130116212956.GA21553@kamineko.org>
References: <20130107171722.GA31427@srcf.ucam.org>
 <CA+55aFzL00K+oURqcnSgbAAkD18DJ8-p1G8vd7KE6RD77dLmCQ@mail.gmail.com>
 <20130107172616.GB31427@srcf.ucam.org>
 <20130107174306.GC31427@srcf.ucam.org>
 <87ehhlifae.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:48306 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756204Ab3APV3z convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jan 2013 16:29:55 -0500
Content-Disposition: inline
In-Reply-To: <87ehhlifae.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Linus Torvalds <torvalds@linux-foundation.org>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 16, 2013 at 11:38:17AM +0100, Bj=F8rn Mork wrote:
> Matthew Garrett <matthew.garrett@nebula.com> writes:
>=20
> > This set covers regressions and two obvious bugfixes. The rest can =
wait=20
> > for 3.9.
>=20
> Hello Matthew,
>=20
> may I request that you include the patch
>=20
>       sony-laptop: fully enable SNY controlled modems
>=20
> for 3.8 as well?  I'd even like it to go to stable if you and Mattia
> agree.

Yes, my initial intent was to have it in 3.7 as a bugfix. The
sony-laptop driver manages to disable the wwan device correctly but
fails to re-enable it afterwards.

--=20
mattia
:wq!
