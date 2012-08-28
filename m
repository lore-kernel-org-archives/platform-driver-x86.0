From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/2] asus-nb-wmi: correct a touchpad hotkey mapping
Date: Tue, 28 Aug 2012 08:23:52 +0100
Message-ID: <CAHR064i1zw1eoRwev1=S+rf-+7Ujdaz4a6deQT_SZjx2kFGk_w@mail.gmail.com>
References: <1346133532-16686-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:62088 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261Ab2H1HXx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Aug 2012 03:23:53 -0400
Received: by qaas11 with SMTP id s11so2443089qaa.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Aug 2012 00:23:52 -0700 (PDT)
In-Reply-To: <1346133532-16686-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Aug 28, 2012 at 6:58 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> 0x60 is touchpad enable key, but is misdefined in the keymap.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6b0ebde..ab44fee 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -180,7 +180,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
>         { KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
>         { KE_KEY, 0x5F, { KEY_WLAN } }, /* Wireless console Disable */
> -       { KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
> +       { KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
>         { KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
>         { KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
>         { KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Acked-by: Corentin Chary <corentin.chary@gmail.com>

-- 
Corentin Chary
http://xf.iksaif.net
