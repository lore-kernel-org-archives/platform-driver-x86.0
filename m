From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Wed, 15 Jun 2016 20:19:58 -0700
Message-ID: <20160616031958.GA54214@f23x64.localdomain>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43845 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932393AbcFPDUD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2016 23:20:03 -0400
Content-Disposition: inline
In-Reply-To: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=C3=A1r wrote:
> First patch describe problem about 0xe045 code. Second and third are =
just
> cosmetic and last rework code which processing WMI events. It should =
be
> properly tested on more Dell machines, to check that everything is st=
ill
> working correctly.

Is this "should be properly tested on more Dell machines" still the cas=
e? Are
you ready for this to go into linux-next?

>=20
> Changes since v2:
> * Updated description for 2/4 and 4/4
> * Fixed comments over 80 characters in 2/4 and 4/4
> * Use switch fall-through in 4/4
> * Added Micha=C5=82's Reviewed-by line
>=20
> Changes since v1:
> * Fixed comments
> * Fixed memory leak
> * Added Tested-By lines
> * Added event 0xe06e
>=20
> Pali Roh=C3=A1r (4):
>   dell-wmi: Ignore WMI event code 0xe045
>   dell-wmi: Sort WMI event codes and update comments
>   dell-wmi: Add information about other WMI event codes
>   dell-wmi: Generate one sparse keymap for all machines
>=20
>  drivers/platform/x86/dell-wmi.c |  290 ++++++++++++++++++++++-------=
----------
>  1 file changed, 166 insertions(+), 124 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
