From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH V2 2/2] thinkpad_acpi: Convert printks to pr_<level>
Date: Mon, 4 Apr 2011 20:03:13 +0200
Message-ID: <BANLkTinKXtiNE=4xfNMh+nJBpiYUYFNRZQ@mail.gmail.com>
References: <664bf5e5585f3d959d6c57524d09353dd8d49f3f.1301936559.git.joe@perches.com>
	<20110404130036.GB16669@srcf.ucam.org>
	<c428cc13a1a5953be3310237e4f404ec65968d5a.1301936559.git.joe@perches.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:39609 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754999Ab1DDSDO convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 14:03:14 -0400
In-Reply-To: <c428cc13a1a5953be3310237e4f404ec65968d5a.1301936559.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 4, 2011 at 7:06 PM, Joe Perches <joe@perches.com> wrote:
> Add pr_fmt.
> Removed local TPACPI_<level> #defines, convert to pr_<level>.
> Neaten dbg_<foo> macros.
> Added a few missing newlines to logging messages.
> Added static inline str_supported for !CONFIG_THINKPAD_ACPI_DEBUG vdb=
g_printk
> defect reported by Sedat Dilek <sedat.dilek@googlemail.com>.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =C2=A0drivers/platform/x86/thinkpad_acpi.c | =C2=A0472 ++++++++++++++=
--------------------
> =C2=A01 files changed, 188 insertions(+), 284 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/=
x86/thinkpad_acpi.c
[...]
> =C2=A0#ifdef CONFIG_THINKPAD_ACPI_DEBUG
> =C2=A0#define vdbg_printk dbg_printk
> =C2=A0static const char *str_supported(int is_supported);
> =C2=A0#else
> -#define vdbg_printk(a_dbg_level, format, arg...) \
> - =C2=A0 =C2=A0 =C2=A0 do { } while (0)
> +static inline const char *str_supported(int is_supported) { return "=
"; }
> +#define vdbg_printk(a_dbg_level, format, arg...) =C2=A0 =C2=A0 =C2=A0=
 \
> + =C2=A0 =C2=A0 =C2=A0 no_printk(format, ##arg)
> =C2=A0#endif

Should be...
+       do { } while (0)
=2E..not...
+       no_printk(format, ##arg)

- Sedat -
