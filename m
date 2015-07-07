From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Tue, 7 Jul 2015 16:04:57 +0200
Message-ID: <20150707140457.GH12087@pali>
References: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
 <20150706223937.GA111639@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:35158 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756950AbbGGOFC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 10:05:02 -0400
Content-Disposition: inline
In-Reply-To: <20150706223937.GA111639@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Monday 06 July 2015 15:39:37 Darren Hart wrote:
> On Mon, Jul 06, 2015 at 12:08:55PM +0200, Pali Roh=C3=A1r wrote:
> > Make sure that before initializing SMBIOS call input buffer does no=
t
> > contain any garbage (e.g. values from previous SMBIOS call). This f=
ix
> > problem with passing undefined/random parameters to SMBIOS function=
s.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> Queued all 3 to fixes. Thanks Pali.
>=20

Ok.

> (I made a few minor grammatical fixes tot he commit messages, review =
the changes
> if you like in the fixes branch)
>=20

It is OK, I'm not native speaker and I have lot of troubles with Englis=
h
language. So feel free to fix any grammatical mistakes...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
