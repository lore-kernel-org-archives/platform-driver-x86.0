From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 00/23] drivers/platform/x86: Remove warnings and use pr_<level>
Date: Wed, 30 Mar 2011 14:30:53 +0000
Message-ID: <AANLkTik9KH_oU-u8gik12J7WEQTAm4tB+6R5kWFWikgx@mail.gmail.com>
References: <cover.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:33258 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932230Ab1C3Oaz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:30:55 -0400
In-Reply-To: <cover.1301436234.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Tue, Mar 29, 2011 at 10:21 PM, Joe Perches <joe@perches.com> wrote:
> Removed a couple of compilation warnings.
> Use pr_<level> consistently.

Did you do that using coccinelle or by hand ?
If you used coccinelle, is the .cocci file available ?
If not, you should try it :).

> Joe Perches (23):
> =C2=A0asus-wmi: Remove __init from asus_wmi_platform_init
> =C2=A0ibm_rtl: Remove warnings from casts of pointer to int
> =C2=A0acer-wmi: pr_<level> cleanups
> =C2=A0asus: Add pr_fmt and convert printks to pr_<level>
> =C2=A0compal-laptop: Convert printks to pr_<level>
> =C2=A0dell: Convert printks to pr_<level>
> =C2=A0eeepc: Use pr_warn
> =C2=A0fujitsu-laptop: Convert printks to pr_<level>
> =C2=A0hdaps: Convert printks to pr_<level>
> =C2=A0hp-wmi: Convert printks to pr_<level>
> =C2=A0ibm_rtl: Use pr_fmt and pr_<level>
> =C2=A0ideapad-laptop: Add pr_fmt
> =C2=A0intel_menlow: Add pr_fmt and use pr_<level>
> =C2=A0intel_pmic_gpio: Convert printks to pr_<level>
> =C2=A0msi-laptop: pr_<level> neatening
> =C2=A0msi-wmi: Use pr_fmt and pr_<level>
> =C2=A0sony-laptop: Add and use #define pr_fmt
> =C2=A0tc1100-wmi: Add pr_fmt, use pr_<level>
> =C2=A0thinkpad_acpi: Convert printks to pr_<level>
> =C2=A0topstar-laptop: Convert remaining printk to pr_info
> =C2=A0toshiba: Convert printks to pr_<level>
> =C2=A0wmi: Removed trailing whitespace from logging message.
> =C2=A0xo15-ebook: Use pr_<level>
>
> =C2=A0drivers/platform/x86/acer-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 32 +-
> =C2=A0drivers/platform/x86/asus-laptop.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 34 +-
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 22 +-
> =C2=A0drivers/platform/x86/asus_acpi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 77 ++---
> =C2=A0drivers/platform/x86/compal-laptop.c =C2=A0 =C2=A0 | =C2=A0 22 =
+-
> =C2=A0drivers/platform/x86/dell-laptop.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 12 +-
> =C2=A0drivers/platform/x86/dell-wmi-aio.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A03 +-
> =C2=A0drivers/platform/x86/dell-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 17 +-
> =C2=A0drivers/platform/x86/eeepc-laptop.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 20 +-
> =C2=A0drivers/platform/x86/eeepc-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 14 +-
> =C2=A0drivers/platform/x86/fujitsu-laptop.c =C2=A0 =C2=A0| =C2=A0 39 =
++--
> =C2=A0drivers/platform/x86/hdaps.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 19 +-
> =C2=A0drivers/platform/x86/hp-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 43 +--
> =C2=A0drivers/platform/x86/ibm_rtl.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 23 +-
> =C2=A0drivers/platform/x86/ideapad-laptop.c =C2=A0 =C2=A0| =C2=A0 =C2=
=A02 +
> =C2=A0drivers/platform/x86/intel_menlow.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A05 +-
> =C2=A0drivers/platform/x86/intel_pmic_gpio.c =C2=A0 | =C2=A0 14 +-
> =C2=A0drivers/platform/x86/msi-laptop.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A09 +-
> =C2=A0drivers/platform/x86/msi-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 45 ++--
> =C2=A0drivers/platform/x86/sony-laptop.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
104 +++----
> =C2=A0drivers/platform/x86/tc1100-wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A07 +-
> =C2=A0drivers/platform/x86/thinkpad_acpi.c =C2=A0 =C2=A0 | =C2=A0471 =
++++++++++++------------------
> =C2=A0drivers/platform/x86/topstar-laptop.c =C2=A0 =C2=A0| =C2=A0 =C2=
=A02 +-
> =C2=A0drivers/platform/x86/toshiba_acpi.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 59 ++--
> =C2=A0drivers/platform/x86/toshiba_bluetooth.c | =C2=A0 11 +-
> =C2=A0drivers/platform/x86/wmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 10 +-
> =C2=A0drivers/platform/x86/xo15-ebook.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A05 +-
> =C2=A027 files changed, 495 insertions(+), 626 deletions(-)
>
> --
> 1.7.4.2.g597a6.dirty
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Corentin Chary
http://xf.iksaif.net
