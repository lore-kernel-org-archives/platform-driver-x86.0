From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 2/2] asus-wmi: update wlan LED through rfkill led trigger
Date: Thu, 26 Jul 2012 07:19:58 +0200
Message-ID: <CAHR064hSQC9tQG3DATufiB6+taWbkEuV_egSy5=Jqfd8iFf1sg@mail.gmail.com>
References: <1343273640-13033-1-git-send-email-acelan.kao@canonical.com>
	<1343273640-13033-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:43735 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751612Ab2GZFUA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Jul 2012 01:20:00 -0400
Received: by lahd3 with SMTP id d3so1135180lah.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jul 2012 22:19:59 -0700 (PDT)
In-Reply-To: <1343273640-13033-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jul 26, 2012 at 5:34 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
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

Why no brightness_get ?
(note that if you decide to add wl_led_get() function that returns
-ENODEV when not found (like for touchpad), please use directly
instead of checking devstate above).

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

I think this is only needed because leds are created before rfkill
switchs. You may also simply move rfkill_init() above led_init() (take
care of fail_led, fail_rfkill too).

Another solution is to call led_trigger_set_default() instead of
rfkill_set_led_trigger_name()

>         rfkill_init_sw_state(*rfkill, !result);
>         result = rfkill_register(*rfkill);
>         if (result) {
> --
> 1.7.9.5
>



-- 
Corentin Chary
http://xf.iksaif.net
