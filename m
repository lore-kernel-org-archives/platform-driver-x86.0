From: Jon Dowland <jmtd@debian.org>
Subject: Re: [PATCH] toshiba_acpi.c: Add key_entry for a lone FN keypress
Date: Tue, 26 Oct 2010 13:00:26 +0100
Message-ID: <20101026120026.GA27720@deckard.alcopop.org>
References: <20101023221253.GA4829@hathor> <201010251127.37374.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from redmars.org ([92.243.31.175]:55392 "EHLO deckard.alcopop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932592Ab0JZMA3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Oct 2010 08:00:29 -0400
Content-Disposition: inline
In-Reply-To: <201010251127.37374.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 25, 2010 at 11:27:35AM -0700, Dmitry Torokhov wrote:
> Well, if FN key can generate separate events then we should report
> KEY_FN, not KEY_UNKNOWN.

Good point, thanks.  I missed that when I went shopping for an appropri=
ate
KEY_*.

Adjusted patch to apply on top of current HEAD.

A lone FN key press on a Toshiba Port=E9g=E9 R700 without another key i=
n
conjunction results in an ACPI event and a spurious error message on
the console.

Add a key entry to map this event to a KEY_UNKNOWN keypress silences
this message.

Signed-off-by: Jon Dowland <jmtd@debian.org>

----
--- a/drivers/platform/x86/toshiba_acpi.c	2010-10-26 12:56:46.000000000=
 +0100
+++ b/drivers/platform/x86/toshiba_acpi.c	2010-10-26 12:58:21.000000000=
 +0100
@@ -135,6 +135,7 @@
 	{ KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x142, { KEY_WLAN } },
 	{ KE_KEY, 0x143, { KEY_PROG1 } },
+	{ KE_KEY, 0x17f, { KEY_FN } },
 	{ KE_KEY, 0xb05, { KEY_PROG2 } },
 	{ KE_KEY, 0xb06, { KEY_WWW } },
 	{ KE_KEY, 0xb07, { KEY_MAIL } },
