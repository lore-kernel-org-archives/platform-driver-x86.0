From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 7/7] asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus
 X456UA
Date: Fri, 1 Jul 2016 16:07:48 -0700
Message-ID: <20160701230748.GH60048@f23x64.localdomain>
References: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
 <1465851456-1421-8-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465851456-1421-8-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 13, 2016 at 04:57:36PM -0400, Jo=E3o Paulo Rechi Vita wrote=
:
> The Asus X456UA has an airplane-mode indicator LED and the WMI WLAN u=
ser
> bit set, so asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to sto=
re
> the wlan state, which has a side-effect of driving the airplane mode
> indicator LED in an inverted fashion.
>=20
> quirk_no_rfkill prevents asus-wmi from registering RFKill switches at
> all for this laptop and allows asus-wireless to drive the LED through
> the ASHS ACPI device.  This laptop already has a quirk for setting
> WAPF=3D4, so this commit creates a new quirk, quirk_no_rfkill_wapf4, =
which
> both disables rfkill and sets WAPF=3D4.

Corrected this last bit of the comment to say "use" instead of "creates=
 a new
quirk" since that was done in 6/7.

Otherwise, all is well, and thank you for sticking with this and seeing=
 it
through Jo=E3o, much appreciated. Queued to testing for 4.8.

>=20
> Signed-off-by: Jo=E3o Paulo Rechi Vita <jprvita@endlessm.com>
> Reported-by: Angela Traeger <angie@endlessm.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> index 87cd60b..87d618f 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -142,7 +142,7 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
>  		},
> -		.driver_data =3D &quirk_asus_wapf4,
> +		.driver_data =3D &quirk_no_rfkill_wapf4,
>  	},
>  	{
>  		.callback =3D dmi_matched,
> --=20
> 2.5.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Darren Hart
Intel Open Source Technology Center
