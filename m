From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2 1/2] eeepc-wmi: add additional hotkeys
Date: Thu, 21 Oct 2010 08:40:13 +0200
Message-ID: <AANLkTinwJLKYeWq7YeSDO4_J8w8TQRCrb+wVuQ4kvZf2@mail.gmail.com>
References: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33420 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736Ab0JUGkS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Oct 2010 02:40:18 -0400
Received: by eyx24 with SMTP id 24so1754430eyx.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Oct 2010 23:40:14 -0700 (PDT)
In-Reply-To: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Tue, Oct 12, 2010 at 1:47 AM,  <chris@cnpbagwell.com> wrote:
> From: Chris Bagwell <chris@cnpbagwell.com>
>
> Added 4 hotkeys using same keymap values as eeepc-latop.
> These are mousepad toggle, resolution change, screen off,
> and task manager. =C2=A0These were tested on 1005PE and are the
> Fn-F3, F4, F7, and F9, respectively.
>
> Also, added a new hot key for power toggles (Fn-Space on 1005PE)
> and is meant to drive cpufv interface from userspace.
>
> Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
> ---
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 =C2=A05 +++++
> =C2=A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 9dc50fb..21df266 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -69,6 +69,11 @@ static const struct key_entry eeepc_wmi_keymap[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_IGNORE, NOTIFY_BRNDOWN_MIN, { KEY_BRI=
GHTNESSDOWN } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_IGNORE, NOTIFY_BRNUP_MIN, { KEY_BRIGH=
TNESSUP } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touc=
hpad */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xe1, { KEY_F14 } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xe9, { KEY_DISPLAY_OFF } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0xe0, { KEY_PROG1 } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x5c, { KEY_F15 } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_END, 0},
> =C2=A0};
>
> --
> 1.7.3.1
>
>

Reviewed-by: Corentin Chary <corentincj@iksaif.net>

Matthew, could you add this patch for 2.6.37 ? Thanks.

--=20
Corentin Chary
http://xf.iksaif.net
