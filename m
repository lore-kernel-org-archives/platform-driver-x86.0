From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Add touchscreen platform data for the Schneider SCT101CTM
 tablet
Date: Wed, 23 Oct 2019 18:08:21 +0200
Message-ID: <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
References: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Gorbea Ainz <danielgorbea@hotmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 23-10-2019 17:23, Daniel Gorbea Ainz wrote:
> Add touchscreen platform data for the Schneider SCT101CTM tablet
>=20
> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Daniel, I received your patch just fine, shall I resend
it to the list for you ?

Regards,

Hans




> ---
>   drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x8=
6/touchscreen_dmi.c
> index 1c7d8324f..8baaf0dfa 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -498,6 +498,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p10=
06w_v10_data =3D {
>   =09.properties=09=3D pov_mobii_wintab_p1006w_v10_props,
>   };
>  =20
> +static const struct property_entry schneider_sct101ctm_props[] =3D {
> +=09PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
> +=09PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +=09PROPERTY_ENTRY_STRING("firmware-name",
> +=09=09=09      "gsl1680-schneider-sct101ctm.fw"),
> +=09PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +=09PROPERTY_ENTRY_BOOL("silead,home-button"),
> +=09{ }
> +};
> +
> +static const struct ts_dmi_data schneider_sct101ctm_data =3D {
> +=09.acpi_name=09=3D "MSSL1680:00",
> +=09.properties=09=3D schneider_sct101ctm_props,
> +};
> +
>   static const struct property_entry teclast_x3_plus_props[] =3D {
>   =09PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>   =09PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -908,6 +926,14 @@ static const struct dmi_system_id touchscreen_dmi_ta=
ble[] =3D {
>   =09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>   =09=09},
>   =09},
> +=09{
> +=09=09/* Schneider SCT101CTM */
> +=09=09.driver_data =3D (void *)&schneider_sct101ctm_data,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
> +=09=09},
> +=09},
>   =09{
>   =09=09/* Teclast X3 Plus */
>   =09=09.driver_data =3D (void *)&teclast_x3_plus_data,
>=20
