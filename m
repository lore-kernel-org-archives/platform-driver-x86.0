From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] toshiba_acpi.c: Add key_entry for a lone FN keypress
Date: Tue, 26 Oct 2010 08:56:53 -0700
Message-ID: <20101026155653.GC13097@core.coreip.homeip.net>
References: <20101023221253.GA4829@hathor>
 <201010251127.37374.dmitry.torokhov@gmail.com>
 <20101026120026.GA27720@deckard.alcopop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:57445 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754528Ab0JZP7B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Oct 2010 11:59:01 -0400
Content-Disposition: inline
In-Reply-To: <20101026120026.GA27720@deckard.alcopop.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jon Dowland <jmtd@debian.org>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 26, 2010 at 01:00:26PM +0100, Jon Dowland wrote:
> On Mon, Oct 25, 2010 at 11:27:35AM -0700, Dmitry Torokhov wrote:
> > Well, if FN key can generate separate events then we should report
> > KEY_FN, not KEY_UNKNOWN.
>=20
> Good point, thanks.  I missed that when I went shopping for an approp=
riate
> KEY_*.
>=20
> Adjusted patch to apply on top of current HEAD.
>=20
> A lone FN key press on a Toshiba Port=E9g=E9 R700 without another key=
 in
> conjunction results in an ACPI event and a spurious error message on
> the console.
>=20
> Add a key entry to map this event to a KEY_UNKNOWN keypress silences

                                         ^^^^^^
Better fix commit log message as well. Otherwise:

	Acked-by: Dmitry Torokhov <dtor@mail.ru>

(or whatever tag Matthew might want to change it).

> this message.
>=20
> Signed-off-by: Jon Dowland <jmtd@debian.org>
>=20
> ----
> --- a/drivers/platform/x86/toshiba_acpi.c	2010-10-26 12:56:46.0000000=
00 +0100
> +++ b/drivers/platform/x86/toshiba_acpi.c	2010-10-26 12:58:21.0000000=
00 +0100
> @@ -135,6 +135,7 @@
>  	{ KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
>  	{ KE_KEY, 0x142, { KEY_WLAN } },
>  	{ KE_KEY, 0x143, { KEY_PROG1 } },
> +	{ KE_KEY, 0x17f, { KEY_FN } },
>  	{ KE_KEY, 0xb05, { KEY_PROG2 } },
>  	{ KE_KEY, 0xb06, { KEY_WWW } },
>  	{ KE_KEY, 0xb07, { KEY_MAIL } },

--=20
Dmitry
