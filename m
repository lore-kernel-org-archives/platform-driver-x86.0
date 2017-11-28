From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen info for
 SurfTab twin 10.1
Date: Tue, 28 Nov 2017 19:44:59 +0200
Message-ID: <CAHp75Vfd60tMzUHFQft+L0c_-nECatfi1Q_H77pK5p20PnTeZg@mail.gmail.com>
References: <20171126183258.10758-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:43095 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753433AbdK1RpA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 12:45:00 -0500
In-Reply-To: <20171126183258.10758-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>

On Sun, Nov 26, 2017 at 8:32 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> From: Bernhard =C3=9Cbelacker <bernhardu@mailbox.org>
>
> Add touchscreen info for the Trekstor SurfTab twin 10.1 ST10432-8
> tablet. Resolution based on output of evemu-record.
>

Pushed to review and testing queue, thanks!

> Signed-off-by: Bernhard =C3=9Cbelacker <bernhardu@mailbox.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/sil=
ead_dmi.c
> index 266535c2a72f..9a3da53202cb 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -67,6 +67,21 @@ static const struct silead_ts_dmi_data dexp_ursus_7w_d=
ata =3D {
>         .properties     =3D dexp_ursus_7w_props,
>  };
>
> +static const struct property_entry surftab_twin_10_1_st10432_8_props[] =
=3D {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1900),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +       PROPERTY_ENTRY_U32("touchscreen-inverted-y", 1),
> +       PROPERTY_ENTRY_STRING("firmware-name",
> +                             "gsl3670-surftab-twin-10-1-st10432-8.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       { }
> +};
> +
> +static const struct silead_ts_dmi_data surftab_twin_10_1_st10432_8_data =
=3D {
> +       .acpi_name      =3D "MSSL1680:00",
> +       .properties     =3D surftab_twin_10_1_st10432_8_props,
> +};
> +
>  static const struct property_entry surftab_wintron70_st70416_6_props[] =
=3D {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
> @@ -198,6 +213,14 @@ static const struct dmi_system_id silead_ts_dmi_tabl=
e[] =3D {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
>                 },
>         },
> +       {
> +               /* TrekStor SurfTab twin 10.1 ST10432-8 */
> +               .driver_data =3D (void *)&surftab_twin_10_1_st10432_8_dat=
a,
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab twin 10.1"),
> +               },
> +       },
>         {
>                 /* Trekstor Surftab Wintron 7.0 ST70416-6 */
>                 .driver_data =3D (void *)&surftab_wintron70_st70416_6_dat=
a,
> --
> 2.14.3
>



--=20
With Best Regards,
Andy Shevchenko
