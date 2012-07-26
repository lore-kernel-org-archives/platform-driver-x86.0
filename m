From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 2/2] asus-wmi: update wlan LED through rfkill led trigger
Date: Thu, 26 Jul 2012 11:39:10 +0800
Message-ID: <CAMz9Wg8oJOMPk4gYKUgMxxAGCOdCMHK1f-V+Oi4CzQdK1ovPKA@mail.gmail.com>
References: <1343273640-13033-1-git-send-email-acelan.kao@canonical.com>
	<1343273640-13033-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45577 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab2GZDjK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jul 2012 23:39:10 -0400
Received: by pbbrp8 with SMTP id rp8so2500436pbb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jul 2012 20:39:10 -0700 (PDT)
In-Reply-To: <1343273640-13033-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Hi,

This patch uses a function, rfkill_set_led_trigger_name(), which was
removed by commit
2e48928d8a0f38c1b5c81eb3f1294de8a6382c68
This function is necessary and should not be removed.
So, I submitted another patch to revert it to linux-wireless mailing list.
Without that revert patch, the code won't get compiled

Best regards,
AceLan Kao.

2012/7/26 AceLan Kao <acelan.kao@canonical.com>:
> For those machines with wapf=4, BIOS won't update the wireless LED,
> since wapf=4 means user application will take in chage of the wifi and bt.
> So, we have to update wlan LED status explicitly.
>
> But I found there is another wireless LED bug in launchpad and which is
> not in the wapf=4 quirk.
> So, it might be better to set wireless LED status explicitly for all
> machines.
>
> BugLink: https://launchpad.net/bugs/901105
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-wmi.c |   24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a13eb45..6ddfb0b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -183,6 +183,7 @@ struct asus_wmi {
>         struct device *hwmon_device;
>         struct platform_device *platform_device;
>
> +       struct led_classdev wlan_led;
>         struct led_classdev tpd_led;
>         int tpd_led_wk;
>         struct led_classdev kbd_led;
> @@ -452,12 +453,20 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>         return value;
>  }
>
> +static void wlan_led_set(struct led_classdev *led_cdev,
> +                        enum led_brightness value)
> +{
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, value, NULL);
> +}
> +
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>         if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
>                 led_classdev_unregister(&asus->kbd_led);
>         if (!IS_ERR_OR_NULL(asus->tpd_led.dev))
>                 led_classdev_unregister(&asus->tpd_led);
> +       if (!IS_ERR_OR_NULL(asus->wlan_led.dev))
> +               led_classdev_unregister(&asus->wlan_led);
>         if (asus->led_workqueue)
>                 destroy_workqueue(asus->led_workqueue);
>  }
> @@ -465,6 +474,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
>  static int asus_wmi_led_init(struct asus_wmi *asus)
>  {
>         int rv = 0;
> +       u32 result;
>
>         asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
>         if (!asus->led_workqueue)
> @@ -498,6 +508,17 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>                         goto error;
>         }
>
> +       asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
> +       if (result & ASUS_WMI_DSTS_PRESENCE_BIT) {
> +               asus->wlan_led.name = "asus-wmi::wlan";
> +               asus->wlan_led.brightness_set = wlan_led_set;
> +               asus->wlan_led.flags = LED_CORE_SUSPENDRESUME;
> +               asus->wlan_led.max_brightness = 1;
> +               asus->wlan_led.default_trigger = "asus-wlan";
> +               rv = led_classdev_register(&asus->platform_device->dev,
> +                                          &asus->wlan_led);
> +
> +       }
>  error:
>         if (rv)
>                 asus_wmi_led_exit(asus);
> @@ -811,6 +832,9 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>         if (!*rfkill)
>                 return -EINVAL;
>
> +       if (dev_id == ASUS_WMI_DEVID_WLAN)
> +               rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
> +
>         rfkill_init_sw_state(*rfkill, !result);
>         result = rfkill_register(*rfkill);
>         if (result) {
> --
> 1.7.9.5
>



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
