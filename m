From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: preserve the bt rfkill status if wapf=4
Date: Thu, 8 Nov 2012 09:21:37 +0000
Message-ID: <CAHR064gMm26w9hv9urWYCm=oY7hUCZ8tqBm5+UC09+DXwOO_NQ@mail.gmail.com>
References: <1352345948-13924-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:44691 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580Ab2KHJVj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Nov 2012 04:21:39 -0500
Received: by mail-bk0-f46.google.com with SMTP id jk13so1053382bkc.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Nov 2012 01:21:38 -0800 (PST)
In-Reply-To: <1352345948-13924-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi,

On Thu, Nov 8, 2012 at 3:39 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> When wapf=4, BIOS won't resotre the wlan/bt rfkill status after resume or
> reboot. And when wapf=4, the bt rfkill status will be stored in the same
> place as wlan in the BIOS.
> Without this patch, bt status will be always on after reboot or resume.

Is this part of a spec from Asus, or just something that happens to
work on a specific machine ?

> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-wmi.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 18f5169..a317f44 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -334,6 +334,9 @@ static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
>
>  static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
>  {
> +       /* BT status will be stored in WLAN if wapf is 4. */
> +       if (dev_id == ASUS_WMI_DEVID_BLUETOOTH && asus->driver->quirks->wapf == 4)
> +               dev_id = ASUS_WMI_DEVID_WLAN;
>         return asus_wmi_get_devstate_bits(asus, dev_id,
>                                           ASUS_WMI_DSTS_STATUS_BIT);
>  }
> @@ -1875,6 +1878,12 @@ static int asus_hotk_restore(struct device *device)
>         if (asus->bluetooth.rfkill) {
>                 bl = !asus_wmi_get_devstate_simple(asus,
>                                                    ASUS_WMI_DEVID_BLUETOOTH);
> +               if (asus->driver->quirks->wapf == 4)
> +               {
> +                       mutex_lock(&asus->wmi_lock);
> +                       asus_rfkill_set(&asus->bluetooth, bl);
> +                       mutex_unlock(&asus->wmi_lock);
> +               }
>                 rfkill_set_sw_state(asus->bluetooth.rfkill, bl);
>         }
>         if (asus->wimax.rfkill) {
> @@ -1900,6 +1909,7 @@ static int asus_hotk_restore(struct device *device)
>  static const struct dev_pm_ops asus_pm_ops = {
>         .thaw = asus_hotk_thaw,
>         .restore = asus_hotk_restore,
> +       .resume = asus_hotk_restore,
>  };
>
>  static int asus_wmi_probe(struct platform_device *pdev)
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Corentin Chary
http://xf.iksaif.net
