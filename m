From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Add me on list of Dell laptop drivers
Date: Wed, 1 Apr 2015 22:10:27 -0700
Message-ID: <20150402051027.GD37152@fury.dvhart.com>
References: <1427636330-21091-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38328 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbbDBFKa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Apr 2015 01:10:30 -0400
Content-Disposition: inline
In-Reply-To: <1427636330-21091-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>

On Sun, Mar 29, 2015 at 03:38:50PM +0200, Pali Roh=E1r wrote:

Please include why. No empty commit messages please.

=46or example, you've written nearly a third of the dell-wmi.c driver, =
and all the
dell-smo8800.c driver.

Dell Laptop is still pending the keyboard backlight patches though I be=
lieve
(have I missed them?), so you don't currently have code ownership there=
=2E I agree
you should be on the MAINTAINERS list, but it would be good to get your=
 keyboard
backlight changes in first.

Gosh... sure seems like we should have merged that already... am I miss=
ing
something? The last thing I see in master, testing, and next is the rev=
ert from
Jan 21....

Also, Matthew, you're the listed maintainer for these, do you agree to =
adding
Pali?

> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> ---
>  MAINTAINERS |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88c09ca..72a08ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3058,10 +3058,16 @@ F:	drivers/net/fddi/defxx.*
> =20
>  DELL LAPTOP DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> +M:	Pali Roh=E1r <pali.rohar@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/dell-laptop.c
> =20
> +DELL LAPTOP FREEFALL DRIVER
> +M:	Pali Roh=E1r <pali.rohar@gmail.com>
> +S:	Maintained
> +F:	drivers/platform/x86/dell-smo8800.c
> +
>  DELL LAPTOP SMM DRIVER
>  M:	Guenter Roeck <linux@roeck-us.net>
>  S:	Maintained
> @@ -3076,6 +3082,7 @@ F:	drivers/firmware/dcdbas.*
> =20
>  DELL WMI EXTRAS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> +M:	Pali Roh=E1r <pali.rohar@gmail.com>
>  S:	Maintained
>  F:	drivers/platform/x86/dell-wmi.c
> =20
> --=20
> 1.7.9.5
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
