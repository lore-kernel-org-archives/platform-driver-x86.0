From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Tue, 7 Jul 2015 08:52:51 -0700
Message-ID: <20150707155251.GE111639@vmdeb7>
References: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
 <20150706223937.GA111639@vmdeb7>
 <20150707140457.GH12087@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44226 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758183AbbGGPwt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 11:52:49 -0400
Content-Disposition: inline
In-Reply-To: <20150707140457.GH12087@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Tue, Jul 07, 2015 at 04:04:57PM +0200, Pali Roh=E1r wrote:
> On Monday 06 July 2015 15:39:37 Darren Hart wrote:
> > On Mon, Jul 06, 2015 at 12:08:55PM +0200, Pali Roh=E1r wrote:
> > > Make sure that before initializing SMBIOS call input buffer does =
not
> > > contain any garbage (e.g. values from previous SMBIOS call). This=
 fix
> > > problem with passing undefined/random parameters to SMBIOS functi=
ons.
> > >=20
> > > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> >=20
> > Queued all 3 to fixes. Thanks Pali.
> >=20
>=20
> Ok.
>=20
> > (I made a few minor grammatical fixes tot he commit messages, revie=
w the changes
> > if you like in the fixes branch)
> >=20
>=20
> It is OK, I'm not native speaker and I have lot of troubles with Engl=
ish
> language. So feel free to fix any grammatical mistakes...

You do better than I do with any other language I attempt :-) I don't f=
eel it's
reasonable for me to nag you about commit messages, but I do need to en=
sure they
are clear. I'll continue to update them going forward.

--=20
Darren Hart
Intel Open Source Technology Center
