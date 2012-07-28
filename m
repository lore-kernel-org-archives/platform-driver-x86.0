From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: update wlan LED through rfkill led trigger
Date: Sat, 28 Jul 2012 11:51:16 +0200
Message-ID: <CAHR064jqCEoUSmmbbFXia-LS=nxp2wtTcL9Aw0-aJbzP3yeidA@mail.gmail.com>
References: <1343379119-10939-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:33404 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751329Ab2G1JvR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Jul 2012 05:51:17 -0400
Received: by qaas11 with SMTP id s11so191093qaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jul 2012 02:51:16 -0700 (PDT)
In-Reply-To: <1343379119-10939-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Jul 27, 2012 at 10:51 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
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
>  drivers/platform/x86/asus-wmi.c |   76 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 83d4cf7..da8e13e 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -183,6 +183,8 @@ struct asus_wmi {
>         struct device *hwmon_device;
>         struct platform_device *platform_device;
>
> +       struct led_classdev wlan_led;
> +       int wlan_led_wk;
>         struct led_classdev tpd_led;
>         int tpd_led_wk;
>         struct led_classdev kbd_led;
> @@ -190,6 +192,7 @@ struct asus_wmi {
>         struct workqueue_struct *led_workqueue;
>         struct work_struct tpd_led_work;
>         struct work_struct kbd_led_work;
> +       struct work_struct wlan_led_work;
>
>         struct asus_rfkill wlan;
>         struct asus_rfkill bluetooth;
> @@ -452,12 +455,65 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>         return value;
>  }
>
> +static int wlan_led_unknown_state(struct asus_wmi *asus)
> +{
> +       u32 result;
> +
> +       asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
> +
> +       return result & ASUS_WMI_DSTS_UNKNOWN_BIT;
> +}
> +
> +static int wlan_led_presence(struct asus_wmi *asus)
> +{
> +       u32 result;
> +
> +       asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
> +
> +       return result & ASUS_WMI_DSTS_PRESENCE_BIT;
> +}
> +
> +static void wlan_led_update(struct work_struct *work)
> +{
> +       int ctrl_param;
> +       struct asus_wmi *asus;
> +
> +       asus = container_of(work, struct asus_wmi, wlan_led_work);
> +
> +       ctrl_param = asus->wlan_led_wk;
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, ctrl_param, NULL);
> +}
> +
> +static void wlan_led_set(struct led_classdev *led_cdev,
> +                        enum led_brightness value)
> +{
> +       struct asus_wmi *asus;
> +
> +       asus = container_of(led_cdev, struct asus_wmi, wlan_led);
> +
> +       asus->wlan_led_wk = !!value;
> +       queue_work(asus->led_workqueue, &asus->wlan_led_work);
> +}
> +
> +static enum led_brightness wlan_led_get(struct led_classdev *led_cdev)
> +{
> +       struct asus_wmi *asus;
> +       u32 result;
> +
> +       asus = container_of(led_cdev, struct asus_wmi, wlan_led);
> +       asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
> +
> +       return result & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
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
> @@ -494,6 +550,23 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>
>                 rv = led_classdev_register(&asus->platform_device->dev,
>                                            &asus->kbd_led);
> +               if (rv)
> +                       goto error;
> +       }
> +
> +       if (wlan_led_presence(asus)) {
> +               INIT_WORK(&asus->wlan_led_work, wlan_led_update);
> +
> +               asus->wlan_led.name = "asus::wlan";
> +               asus->wlan_led.brightness_set = wlan_led_set;
> +               if (!wlan_led_unknown_state(asus))
> +                       asus->wlan_led.brightness_get = wlan_led_get;
> +               asus->wlan_led.flags = LED_CORE_SUSPENDRESUME;
> +               asus->wlan_led.max_brightness = 1;
> +               asus->wlan_led.default_trigger = "asus-wlan";
> +
> +               rv = led_classdev_register(&asus->platform_device->dev,
> +                                          &asus->wlan_led);
>         }
>
>  error:
> @@ -809,6 +882,9 @@ static int asus_new_rfkill(struct asus_wmi *asus,
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
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Acked-by: Corentin Chary <corentin.chary@gmail.com>

Matthew could you merge this one ?
Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
