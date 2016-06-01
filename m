From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] ideadpad: Runtime check for hw touchpad control
Date: Wed, 1 Jun 2016 07:37:07 +0300
Message-ID: <CAKErNvqfphVV5f6s9zfO-c=e279wQoGQ_Q2Z35qq11fEkdu5_A@mail.gmail.com>
References: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
 <1464736867-6084-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35376 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757189AbcFAEhj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2016 00:37:39 -0400
Received: by mail-lf0-f68.google.com with SMTP id q63so685559lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 May 2016 21:37:38 -0700 (PDT)
In-Reply-To: <1464736867-6084-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

2016-06-01 2:21 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com=
>:
> Check if disabling the i8042 AUX port has any effect on
> VPCCMD_R_TOUCHPAD, and use that information to decide whether or not
> ideapad_sync_touchpad_state() should do something.
>
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 06a837a..08dd487 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -93,6 +93,7 @@ struct ideapad_private {
>         struct dentry *debug;
>         unsigned long cfg;
>         bool has_hw_rfkill_switch;
> +       bool has_hw_tp_ctrl;
>  };
>
>  static bool no_bt_rfkill;
> @@ -773,6 +774,9 @@ static void ideapad_sync_touchpad_state(struct id=
eapad_private *priv)
>  {
>         unsigned long value;
>
> +       if (!priv->has_hw_tp_ctrl)
> +               return;
> +
>         /* Without reading from EC touchpad LED doesn't switch state =
*/
>         if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &val=
ue)) {
>                 /* Some IdeaPads don't really turn off touchpad - the=
y only
> @@ -930,6 +934,18 @@ static const struct dmi_system_id no_hw_rfkill_l=
ist[] =3D {
>         {}
>  };
>
> +static bool ideapad_has_touchpad_ctrl(struct ideapad_private *priv)
> +{
> +       unsigned char param;
> +       unsigned long value_disabled, value_enabled;
> +
> +       i8042_command(&param, I8042_CMD_AUX_DISABLE);
> +       read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_di=
sabled);
> +       i8042_command(&param, I8042_CMD_AUX_ENABLE);
> +       read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_en=
abled);

This should be tested on a device that has touchpad control, but
personally I don't think it will work in that way. As
VPCCMD_R_TOUCHPAD returns different values independently of the actual
touchpad state, but synchronously with the LED state changes, I think
disabling the touchpad by I8042_CMD_AUX_DISABLE will not affect the
value read with VPCCMD_R_TOUCHPAD. So if this code will for some
reason work, we should test it in advance, merging it without prior
testing has a very big chances to break touchpad switching.

> +       return (value_disabled !=3D value_enabled);
> +}
> +
>  static int ideapad_acpi_add(struct platform_device *pdev)
>  {
>         int ret, i;
> @@ -978,6 +994,7 @@ static int ideapad_acpi_add(struct platform_devic=
e *pdev)
>                         ideapad_register_rfkill(priv, i);
>
>         ideapad_sync_rfk_state(priv);
> +       priv->has_hw_tp_ctrl =3D ideapad_has_touchpad_ctrl(priv);
>         ideapad_sync_touchpad_state(priv);
>
>         if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_ven=
dor) {
> --
> 2.5.0
>
