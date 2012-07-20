From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Fri, 20 Jul 2012 08:02:15 +0200
Message-ID: <CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:51652 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752107Ab2GTGCR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Jul 2012 02:02:17 -0400
Received: by lbbgm6 with SMTP id gm6so4562228lbb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jul 2012 23:02:15 -0700 (PDT)
In-Reply-To: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Jul 20, 2012 at 5:26 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> If the user bit is set, that mean BIOS can't set and record the wlan
> status, it will report the value read from id ASUS_WMI_DEVID_WLAN_LED
> while we query the wlan status by id ASUS_WMI_DEVID_WLAN through WMI.
> So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
> while setting the wlan status through WMI.
> This is also the behavior that windows app will do.
>
> Quote from ASUS application engineer
> =3D=3D=3D
> When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it may =
return
>
> (1) 0x00050001 (On)
> (2) 0x00050000 (Off)
> (3) 0x00030001 (On)
> (4) 0x00030000 (Off)
> (5) 0x00000002 (Unknown)
>
> (1), (2) means that the model has hardware GPIO for WLAN, you can cal=
l
> WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off

Will it handle the LED too, or do you have to call 0x00010012 ?

> (3), (4) means that the model doesn=E2=80=99t have hardware GPIO, you=
 need to use
> API or driver library to turn WLAN on/off, and call
> WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
> After you set WLAN LED status, you can see the WLAN status is changed=
 with
> WMIMethod(DSTS, 0x00010011). Because the status is recorded lastly
> (ex: Windows), you can use it for synchronization.

That means WMIMethod(DSTS, 0x00010011, 0) will do nothing ? Or will it
control both the led and the device ?
How can you then call WMIMethod(DSTS, 0x00010012, 0/1) since nobody
switched wlan on or off ?
If you just want a way to control the led, expose it under
/sys/class/leds, and remove wlan from /sys/class/rfkill if it doesn't
work.

> (5) means that the model doesn=E2=80=99t have WLAN device.
>
> WLAN is the ONLY special case with upper rule.
>
> For other device, like Bluetooth, you just need use
> WMIMethod(DSTS, 0x00010013) to get, and WMIMethod(DEVS, 0x00010013, 1=
 or 0)
> to set.
> =3D=3D=3D
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/asus-wmi.c |   27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 556cbb4..638facf 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -98,6 +98,7 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_DEVID_WIRELESS_LED    0x00010002
>  #define ASUS_WMI_DEVID_CWAP            0x00010003
>  #define ASUS_WMI_DEVID_WLAN            0x00010011
> +#define ASUS_WMI_DEVID_WLAN_LED                0x00010012

What's the difference between this one and ASUS_WMI_DEVID_WIRELESS_LED =
?
What is really  0x00010002 ?

>  #define ASUS_WMI_DEVID_BLUETOOTH       0x00010013
>  #define ASUS_WMI_DEVID_GPS             0x00010015
>  #define ASUS_WMI_DEVID_WIMAX           0x00010017
> @@ -723,10 +724,34 @@ error_workqueue:
>   */
>  static int asus_rfkill_set(void *data, bool blocked)
>  {
> +       static u32 wlan_status =3D 0xffffffff;

Don't use a static variable, add a field into struct asus_wmi instead.

>         struct asus_rfkill *priv =3D data;
>         u32 ctrl_param =3D !blocked;
> +       u32 dev_id =3D priv->dev_id;
> +       int result;
>
> -       return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL);
> +       /*
> +        * If the user bit is set, BIOS can't set and record the wlan=
 status,
> +        * it will report the value read from id ASUS_WMI_DEVID_WLAN_=
LED
> +        * while we query the wlan status through WMI.
> +        * So, we have to record wlan status in id ASUS_WMI_DEVID_WLA=
N_LED
> +        * while setting the wlan status through WMI.
> +        * This is also the behavior that windows app will do.
> +        */
> +       if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN) {
> +               if (wlan_status =3D=3D 0xffffffff)
> +                       asus_wmi_get_devstate(priv->asus,
> +                                             ASUS_WMI_DEVID_WLAN,
> +                                             &wlan_status);

Maybe you could read that on startup instead of using lazy loading ?
Read the state of the wlan device, and set a flag "led should be contro=
lled"

> +               if (wlan_status &
> +                  (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_B=
IT))
> +                       dev_id =3D ASUS_WMI_DEVID_WLAN_LED;
> +       }
> +
> +       result =3D asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
> +
> +       return result;
>  }
>
>  static void asus_rfkill_query(struct rfkill *rfkill, void *data)

While this patch work, I'll prefer an approach using a led class and a
led trigger. The led trigger would be set by default, but the user
would also be able to switch the trigger to another one, or to control
the led using /sys/class/leds/



--=20
Corentin Chary
http://xf.iksaif.net
