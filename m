From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/7] asus-wmi: Create quirk for airplane_mode LED
Date: Sun, 19 Jun 2016 09:13:41 +0200
Message-ID: <CAHR064in5G2Cs-CcXbj+3QswtzyJpsQC98HMzOc+m1ZddiSnSA@mail.gmail.com>
References: <1465851456-1421-1-git-send-email-jprvita@endlessm.com> <1465851456-1421-3-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34138 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478AbcFSHNn convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 03:13:43 -0400
In-Reply-To: <1465851456-1421-3-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Mon, Jun 13, 2016 at 10:57 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
>
> Some Asus laptops that have an airplane-mode indicator LED, also have
> the WMI WLAN user bit set, and the following bits in their DSDT:
>
> Scope (_SB)
> {
>   (...)
>   Device (ATKD)
>   {
>     (...)
>     Method (WMNB, 3, Serialized)
>     {
>       (...)
>       If (LEqual (IIA0, 0x00010002))
>       {
>         OWGD (IIA1)
>         Return (One)
>       }
>     }
>   }
> }
>
> So when asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store t=
he
> wlan state, it drives the airplane-mode indicator LED (through the ca=
ll
> to OWGD) in an inverted fashion: the LED is ON when airplane mode is =
OFF
> (since wlan is ON), and vice-versa.

Have you tried check the values of SFUN for these laptops ? It's
supposed to have 1 bit per "feature"
maybe there is a bit that we could use to enable this quirk (this can
clearly be done after this whole series).

>
> This commit creates a quirk to not register a RFKill switch at all fo=
r
> these laptops, to allow the asus-wireless driver to drive the airplan=
e
> mode LED correctly through the ASHS ACPI device. It also adds a match=
 to
> that quirk for the Asus X555UB, which is affected by this problem.
>
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  8 +++++---
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> index 091ca7a..90c8f41 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -78,6 +78,10 @@ static struct quirk_entry quirk_asus_x200ca =3D {
>         .wapf =3D 2,
>  };
>
> +static struct quirk_entry quirk_no_rfkill =3D {
> +       .no_rfkill =3D true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>         quirks =3D dmi->driver_data;
> @@ -306,6 +310,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
>                 },
>                 .driver_data =3D &quirk_asus_x200ca,
>         },
> +       {
> +               .callback =3D dmi_matched,
> +               .ident =3D "ASUSTeK COMPUTER INC. X555UB",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER I=
NC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "X555UB"),
> +               },
> +               .driver_data =3D &quirk_no_rfkill,
> +       },
>         {},
>  };
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index a26dca3..7c093a0 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2069,9 +2069,11 @@ static int asus_wmi_add(struct platform_device=
 *pdev)
>         if (err)
>                 goto fail_leds;
>
> -       err =3D asus_wmi_rfkill_init(asus);
> -       if (err)
> -               goto fail_rfkill;
> +       if (!asus->driver->quirks->no_rfkill) {
> +               err =3D asus_wmi_rfkill_init(asus);
> +               if (err)
> +                       goto fail_rfkill;
> +       }
>
>         /* Some Asus desktop boards export an acpi-video backlight in=
terface,
>            stop this from showing up */
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index 4da4c8b..5de1df5 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -38,6 +38,7 @@ struct key_entry;
>  struct asus_wmi;
>
>  struct quirk_entry {
> +       bool no_rfkill;
>         bool hotplug_wireless;
>         bool scalar_panel_brightness;
>         bool store_backlight_power;
> --
> 2.5.0
>



--=20
Corentin Chary
http://xf.iksaif.net
