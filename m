From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 1/2] asus-wmi: control wlan-led if wapf > 0
Date: Tue, 17 Dec 2013 14:27:16 +0800
Message-ID: <CAMz9Wg_pfVuzvKwTuQqdu2fxoLPagh2W9+MP2SBuy2pgH96N2w@mail.gmail.com>
References: <1380685264-18619-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vb0-f54.google.com ([209.85.212.54]:63439 "EHLO
	mail-vb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267Ab3LQG1R (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Dec 2013 01:27:17 -0500
Received: by mail-vb0-f54.google.com with SMTP id g10so3785446vbg.41
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2013 22:27:16 -0800 (PST)
In-Reply-To: <1380685264-18619-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

Hi Mathew,

It looks like you miss the 2 patches, I didn't see them appear in
platform git tree.
Could you review the 2 patches and apply them?
Thanks.

Best regards,
AceLan Kao.

2013/10/2 AceLan Kao <acelan.kao@canonical.com>:
> Wifi will be controlled by asus-wmi driver when wapf > 0
> So, controls the wifi-led when wapf > 0
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 19c313b..cb22d3f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -558,7 +558,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>                         goto error;
>         }
>
> -       if (wlan_led_presence(asus) && (asus->driver->quirks->wapf == 4)) {
> +       if (wlan_led_presence(asus) && (asus->driver->quirks->wapf > 0)) {
>                 INIT_WORK(&asus->wlan_led_work, wlan_led_update);
>
>                 asus->wlan_led.name = "asus::wlan";
> @@ -887,7 +887,7 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>                 return -EINVAL;
>
>         if ((dev_id == ASUS_WMI_DEVID_WLAN) &&
> -                       (asus->driver->quirks->wapf == 4))
> +                       (asus->driver->quirks->wapf > 0))
>                 rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
>
>         rfkill_init_sw_state(*rfkill, !result);
> --
> 1.8.3.2
>



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
