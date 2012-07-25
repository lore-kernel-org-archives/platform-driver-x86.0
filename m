From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 2/2] asus-wmi: update wireless LED explicitly
Date: Wed, 25 Jul 2012 12:33:07 +0200
Message-ID: <CAHR064iBVu2btpUkk++HK+f1K4h7VrHrAKkFYSNWTD=6JJiAqA@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<1342754788-22880-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:45284 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754356Ab2GYKdJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jul 2012 06:33:09 -0400
Received: by lahd3 with SMTP id d3so419472lah.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jul 2012 03:33:08 -0700 (PDT)
In-Reply-To: <1342754788-22880-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Jul 20, 2012 at 5:26 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> For those machines with wapf=4, BIOS won't update the wireless LED,
> since wapf=4 means user application will take in chage of the wifi and bt.
> So, we have to turn on/off the wireless LED explicitly.
>
> But I found there is another wireless LED bug in launchpad and which is
> not in the wapf=4 quirk.
> So, I think maybe we should set wireless LED status explicitly for all
> machines.
>
> BugLink: https://launchpad.net/bugs/901105
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-wmi.c |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 638facf..75699b3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -719,6 +719,12 @@ error_workqueue:
>         return ret;
>  }
>
> +static void wlan_led_update(struct asus_wmi *asus)
> +{
> +       int status = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_WLAN);
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, status, NULL);
> +}
> +
>  /*
>   * Rfkill devices
>   */
> @@ -750,6 +756,7 @@ static int asus_rfkill_set(void *data, bool blocked)
>         }
>
>         result = asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
> +       wlan_led_update(priv->asus);
>
>         return result;
>  }

For this one, if it's really a led, please expose it using the generic
led class and assign it a default trigger linked to asus rfkill state.
Also, only expose the led if really present (if there is a way to know that).
Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
