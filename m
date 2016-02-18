From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][RESEND] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Wed, 17 Feb 2016 21:34:34 -0800
Message-ID: <20160218053434.GF18421@dvhart-mobl5.amr.corp.intel.com>
References: <4f2df9dab959ad572e08eb7f7fa03220@natalenko.name>
 <20160217103738.GA1609@tyrael>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55237 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424699AbcBRFeh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 00:34:37 -0500
Content-Disposition: inline
In-Reply-To: <20160217103738.GA1609@tyrael>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 17, 2016 at 12:37:38PM +0200, Giedrius Statkevi=C4=8Dius wr=
ote:
> On Wed, Feb 17, 2016 at 09:45:05AM +0200, Oleksandr Natalenko wrote:
> > Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
> > is loaded with wapf=3D4 option. Add quirk for this.
> > ---
>=20
> You forgot Signed-off-by here. Always run your patch through
> scripts/checkpatch.pl. Also, I think the format is usually
> [PATCH RESEND vX AA/BB] and not [PATCH][RESEND].

RESEND means it's identical. v2 means there was a change. The change sh=
ould be
noted below the --- line. See Documentation/SubmittingPatches Section 1=
4.

--=20
Darren Hart
Intel Open Source Technology Center
