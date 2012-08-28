From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 2/2] asus-nb-wmi: add all video switch keys
Date: Tue, 28 Aug 2012 08:22:58 +0100
Message-ID: <CAHR064itK4PM5TXahdVrs3Gf4N0XidFvMng8D34Vc7KaKiz7AQ@mail.gmail.com>
References: <1346133532-16686-1-git-send-email-acelan.kao@canonical.com>
	<1346133532-16686-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:45009 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977Ab2H1HW7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Aug 2012 03:22:59 -0400
Received: by qaas11 with SMTP id s11so2446600qaa.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Aug 2012 00:22:58 -0700 (PDT)
In-Reply-To: <1346133532-16686-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Aug 28, 2012 at 6:58 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Fill up all the video switch keys in the map.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c |   22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index ab44fee..6eee4e1 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -181,21 +181,37 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
>         { KE_KEY, 0x5F, { KEY_WLAN } }, /* Wireless console Disable */
>         { KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
> -       { KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
> -       { KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
> -       { KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
> +       { KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD only */
> +       { KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT only */
> +       { KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT */
> +       { KE_KEY, 0x64, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV */
> +       { KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
> +       { KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
> +       { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
>         { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>         { KE_KEY, 0x7D, { KEY_BLUETOOTH } },
>         { KE_KEY, 0x7E, { KEY_BLUETOOTH } },
>         { KE_KEY, 0x82, { KEY_CAMERA } },
>         { KE_KEY, 0x88, { KEY_RFKILL  } },
>         { KE_KEY, 0x8A, { KEY_PROG1 } },
> +       { KE_KEY, 0x8C, { KEY_SWITCHVIDEOMODE } }, /* SDSP DVI only */
> +       { KE_KEY, 0x8D, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + DVI */
> +       { KE_KEY, 0x8E, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + DVI */
> +       { KE_KEY, 0x8F, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + DVI */
> +       { KE_KEY, 0x90, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + DVI */
> +       { KE_KEY, 0x91, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + DVI */
> +       { KE_KEY, 0x92, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + DVI */
> +       { KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
>         { KE_KEY, 0x95, { KEY_MEDIA } },
>         { KE_KEY, 0x99, { KEY_PHONE } },
>         { KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
>         { KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
>         { KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
>         { KE_KEY, 0xA3, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + HDMI */
> +       { KE_KEY, 0xA4, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + HDMI */
> +       { KE_KEY, 0xA5, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV + HDMI */
> +       { KE_KEY, 0xA6, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV + HDMI */
> +       { KE_KEY, 0xA7, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + HDMI */
>         { KE_KEY, 0xb5, { KEY_CALC } },
>         { KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
>         { KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
> --
> 1.7.9.5

Looks good. Remember that asus-laptop share the same keymap, so please
also patch this file.
If you got other keys, or better description for some of them, feel
free to patch that too.
Thanks,

Acked-By: Corentin Chary <corentin.chary@gmail.com>


-- 
Corentin Chary
http://xf.iksaif.net
