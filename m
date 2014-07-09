From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 1/2] asus-wmi: control wlan-led if wapf > 0
Date: Wed, 9 Jul 2014 16:22:34 +0800
Message-ID: <CAMz9Wg-aLonjoGRv4_MUwTSBiE0vz7BGqGde5xDV1SoxcFKYzA@mail.gmail.com>
References: <1404893899-10082-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:54563 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbaGIIWf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jul 2014 04:22:35 -0400
Received: by mail-ve0-f181.google.com with SMTP id db11so6707361veb.26
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jul 2014 01:22:35 -0700 (PDT)
In-Reply-To: <1404893899-10082-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

Hi Matthew,

Sorry to re-send the patches.
I forgot to check the status of these 2 patches, it had been submitted
almost one year ago, but still didn't go into platform-drivers-x86 git
tree.
Please review them, many thanks.

Best regards,
AceLan Kao.

2014-07-09 16:18 GMT+08:00 AceLan Kao <acelan.kao@canonical.com>:
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
