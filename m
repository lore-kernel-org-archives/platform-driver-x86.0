From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Wed, 3 Dec 2014 10:00:20 -0800
Message-ID: <20141203180018.GA20370@vmdeb7>
References: <1415967813-7223-1-git-send-email-pali.rohar@gmail.com>
 <1417780411-5859-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49529 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbaLFEbY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Dec 2014 23:31:24 -0500
Content-Disposition: inline
In-Reply-To: <1417780411-5859-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Srinivas_G_Gowda@dell.com, Michael_E_Brown@dell.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, Dec 05, 2014 at 12:53:31PM +0100, Pali Roh=E1r wrote:
> This patch adds support for configuring keyboard backlight settings o=
n supported
> Dell laptops. It exports kernel leds interface and uses Dell SMBIOS t=
okens or
> keyboard class interface.
>=20
> With this patch it is possible to set:
> * keyboard backlight level
> * timeout after which will be backlight automatically turned off
> * input activity triggers (keyboard, touchpad, mouse) which enable ba=
cklight
> * ambient light settings
>=20
> Settings are exported via sysfs:
> /sys/class/leds/dell::kbd_backlight/
>=20
> Code is based on newly released documentation by Dell in libsmbios pr=
oject.
>=20
> Thanks to Dan Carpenter who reported bug about unpredictable results =
in
> quirks->kbd_timeouts for loop. His fix adds needs_kbd_timeouts flag t=
o
> quirk structure to indicate if kbd_timeouts array is empty or not.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>

Applied to testing with minor English corrections to the new comments.

Thank you Pali.

--=20
Darren Hart
Intel Open Source Technology Center
