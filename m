From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/2] Fixes for dell-wmi
Date: Mon, 11 Jan 2016 11:22:51 -0800
Message-ID: <20160111192251.GG10643@malice.jf.intel.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43318 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934419AbcAKTWz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:22:55 -0500
Content-Disposition: inline
In-Reply-To: <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 04, 2016 at 10:26:34PM +0100, Pali Roh=E1r wrote:
> This patch series adds check if Dell WMI descriptor structure is vali=
d and
> fixes processing WMI events on devices with WMI interface version 0.
>=20
> After testing, second patch is good candidate for backporting into st=
able
> kernels, but problem is that it cannot be used without first patch. S=
o I
> let decision to other people.
>=20
> Pali Roh=E1r (2):
>   dell-wmi: Check if Dell WMI descriptor structure is valid
>   dell-wmi: Process only one event on devices with interface version =
0
>=20
>  drivers/platform/x86/dell-wmi.c |   96 +++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 94 insertions(+), 2 deletions(-)

Thank you everyone. I have queued these to testing.

Should I add a tested-by for Michal, Andy, and Gabriele?

Do I have any Reviewed-by's to add?

--=20
Darren Hart
Intel Open Source Technology Center
