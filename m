From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad: DMI quirk for touchpad control
Date: Wed, 8 Jun 2016 15:15:13 -0700
Message-ID: <20160608221513.GK28348@f23x64.localdomain>
References: <1465230324-18035-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33617 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161205AbcFHWPO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 18:15:14 -0400
Content-Disposition: inline
In-Reply-To: <1465230324-18035-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, Christian Hesse <list@eworm.de>, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Mon, Jun 06, 2016 at 12:25:24PM -0400, Jo=E3o Paulo Rechi Vita wrote=
:
> Don't try to control the touchpad on laptops that do not support it, =
as
> it leads to sending wrong KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF events t=
o
> userspace.
>=20
> Signed-off-by: Jo=E3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 26 +++++++++++++++++++++++++=
+
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 06a837a..6270948 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -93,6 +93,7 @@ struct ideapad_private {
>  	struct dentry *debug;
>  	unsigned long cfg;
>  	bool has_hw_rfkill_switch;
> +	bool has_tp_ctrl;
>  };
> =20
>  static bool no_bt_rfkill;
> @@ -773,6 +774,9 @@ static void ideapad_sync_touchpad_state(struct id=
eapad_private *priv)
>  {
>  	unsigned long value;
> =20
> +	if (!priv->has_tp_ctrl)
> +		return;
> +
>  	/* Without reading from EC touchpad LED doesn't switch state */
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
>  		/* Some IdeaPads don't really turn off touchpad - they only
> @@ -930,6 +934,27 @@ static const struct dmi_system_id no_hw_rfkill_l=
ist[] =3D {
>  	{}
>  };
> =20
> +/*
> + * Avoid sending wrong KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF events to =
userspace.
> + */
> +static const struct dmi_system_id no_tp_ctrl_list[] =3D {
> +	{
> +		.ident =3D "Lenovo 80HE", /* Yoga 3 Pro 2 */
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "80HE"),
> +		},
> +	},
> +	{
> +		.ident =3D "Lenovo 80MK", /* Yoga 900 */
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "80MK"),
> +		},

Upon closer inspection, is there a reason you chose to match on PRODUCT=
_NAME
instead of PRODUCT_VERSION like the no_hw_rfkill_list? The PRODUCT_VERS=
ION tends
to have the user recognizable name which you placed in a comment instea=
d of in
the .ident. For both consistency and legibility, it seems like it would=
 be better to
match on DMI_PRODUCT_VERSION and use that in the .ident.

--=20
Darren Hart
Intel Open Source Technology Center
