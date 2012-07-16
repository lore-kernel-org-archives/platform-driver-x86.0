From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-nb-wmi: add some video toggle keys
Date: Mon, 16 Jul 2012 07:42:24 +0200
Message-ID: <CAHR064i3-TNUr=TGwJuOL6yuJ10hymt_9KpOo7k_8-wj_COy6A@mail.gmail.com>
References: <1341386414-20398-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:56644 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437Ab2GPFm0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Jul 2012 01:42:26 -0400
Received: by lbbgm6 with SMTP id gm6so8243236lbb.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Jul 2012 22:42:24 -0700 (PDT)
In-Reply-To: <1341386414-20398-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>

On Wed, Jul 4, 2012 at 9:20 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> There are some new video switch keys that used by newer machines.
> 0xA0 - SDSP HDMI only
> 0xA1 - SDSP LCD + HDMI
> 0xA2 - SDSP CRT + HDMI
> 0xA3 - SDSP TV + HDMI
> But in Linux, there is no suitable userspace application to handle this,
> so, mapping them all to KEY_SWITCHVIDEOMODE.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 99a30b5..6de14fd 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -94,6 +94,10 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x8A, { KEY_PROG1 } },
>         { KE_KEY, 0x95, { KEY_MEDIA } },
>         { KE_KEY, 0x99, { KEY_PHONE } },
> +       { KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
> +       { KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
> +       { KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
> +       { KE_KEY, 0xA3, { KEY_SWITCHVIDEOMODE } }, /* SDSP TV + HDMI */
>         { KE_KEY, 0xb5, { KEY_CALC } },
>         { KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
>         { KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
> --
> 1.7.9.5
>

Acked-by: Corentin Chary <corentin.chary@gmail.com>

-- 
Corentin Chary
http://xf.iksaif.net
