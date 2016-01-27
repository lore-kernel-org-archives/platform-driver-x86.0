From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness
 interface"
Date: Wed, 27 Jan 2016 15:26:51 -0800
Message-ID: <1453937211.10099.31.camel@perches.com>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]:59619 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932118AbcA0X05 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jan 2016 18:26:57 -0500
In-Reply-To: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net

On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
> Message gets logged on machines that are well supported.
>=20
> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> ---
> =A0drivers/platform/x86/thinkpad_acpi.c | 1 -
> =A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index a268a7a..4eb41aa 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6661,7 +6661,6 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("detected a 8=
-level brightness capable
> ThinkPad\n");
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> =A0=A0=A0=A0=A0=A0=A0=A0default:
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Unsupported br=
ightness interface\n");
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0tp_features.bright_un=
kfw =3D 1;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bright_maxlvl =3D b -=
 1;
> =A0=A0=A0=A0=A0=A0=A0=A0}

Perhaps this should be something like this instead:
---
=A0drivers/platform/x86/thinkpad_acpi.c | 4 +---
=A01 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index a268a7a..bd12c71 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6653,18 +6653,16 @@ static void __init tpacpi_detect_brightness_cap=
abilities(void)
=A0	switch (b) {
=A0	case 16:
=A0		bright_maxlvl =3D 15;
-		pr_info("detected a 16-level brightness capable ThinkPad\n");
=A0		break;
=A0	case 8:
=A0	case 0:
=A0		bright_maxlvl =3D 7;
-		pr_info("detected a 8-level brightness capable ThinkPad\n");
=A0		break;
=A0	default:
-		pr_info("Unsupported brightness interface\n");
=A0		tp_features.bright_unkfw =3D 1;
=A0		bright_maxlvl =3D b - 1;
=A0	}
+	pr_info("detected %u brightness levels\n", bright_maxlvl + 1);
=A0}
=A0
=A0static int __init brightness_init(struct ibm_init_struct *iibm)
