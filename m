From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Tue, 22 May 2012 12:04:39 +0800
Message-ID: <4FBB1057.1050108@canonical.com>
References: <CAKErNvpb==5=__rxjPeP24Oo1SxTBKPdR3TKLmGmHrr3e+xhDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51776 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738Ab2EVEEq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 May 2012 00:04:46 -0400
In-Reply-To: <CAKErNvpb==5=__rxjPeP24Oo1SxTBKPdR3TKLmGmHrr3e+xhDQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?0JzQsNC60YHQuNC8INCc0LjQutC40YLRj9C90YHQutC40Lk=?= <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

This is a quick reply. Will make fully review later.

On 05/21/2012 11:50 PM, =D0=9C=D0=B0=D0=BA=D1=81=D0=B8=D0=BC =D0=9C=D0=B8=
=D0=BA=D0=B8=D1=82=D1=8F=D0=BD=D1=81=D0=BA=D0=B8=D0=B9 wrote:
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
>=20
> The patch adds support for Lenovo IdeaPad Z570 laptop. It makes all s=
pecial
> keys working, adds possibility to control fan like Windows does and c=
ontrols
> Touchpad Disabled LED.
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
> --- linux-source-3.2.0/drivers/platform/x86/ideapad-laptop.c.orig	201=
2-01-05
> 01:55:44.000000000 +0200
> +++ linux-source-3.2.0/drivers/platform/x86/ideapad-laptop.c	2012-05-=
20
> 14:59:45.192052303 +0300
> @@ -62,9 +62,12 @@ enum {
>  	VPCCMD_W_CAMERA,
>  	VPCCMD_R_3G,
>  	VPCCMD_W_3G,
> -	VPCCMD_R_ODD, /* 0x21 */
> -	VPCCMD_R_RF =3D 0x23,
> -	VPCCMD_W_RF,
> +	VPCCMD_R_ODD,
> +	VPCCMD_W_FAN,
> +	VPCCMD_R_RF,
> +	VPCCMD_W_RF, /* 0x24 */
> +	VPCCMD_R_FAN =3D 0x2B,
> +	VPCCMD_R_SPECIAL_BUTTONS =3D 0x31,
>  	VPCCMD_W_BL_POWER =3D 0x33,
>  };
>=20
> @@ -363,8 +366,47 @@ static ssize_t store_ideapad_cam(struct
>=20
>  static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideap=
ad_cam);
>=20
> +static ssize_t show_ideapad_fan(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	unsigned long result;
> +
> +	if (read_ec_data(ideapad_handle, VPCCMD_R_FAN, &result))
> +		return sprintf(buf, "-1\n");
> +	return sprintf(buf, "%lu\n", result);
> +}
> +
> +static ssize_t store_ideapad_fan(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	int ret, state;
> +
> +	if (!count)
> +		return 0;
> +	if (sscanf(buf, "%i", &state) !=3D 1)
> +		return -EINVAL;
> +	/* WARNING: these fan states are not speed
> +	 * so it isn't cooling_device interface
> +	 * 0 =3D super silent mode
> +	 * 1 =3D standard mode
> +	 * 2 =3D dust cleaning
> +	 * 4 =3D efficient thermal dissipation mode
> +	 */
> +	if (state < 0 || state > 4 || state =3D=3D 3)
> +		return -EINVAL;

IIRC 3 is also a valid number.

On your ideapad, what is the response after 3 is written?

> +	ret =3D write_ec_cmd(ideapad_handle, VPCCMD_W_FAN, state);
> +	if (ret < 0)
> +		return ret;
> +	return count;
> +}
> +
> +static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_f=
an);
> +
>  static struct attribute *ideapad_attributes[] =3D {
>  	&dev_attr_camera_power.attr,
> +	&dev_attr_fan_mode.attr,

Please also update Documentation/ABI/testing/sysfs-platform-ideapad-lap=
top

>  	NULL
>  };
>=20
> @@ -379,6 +421,12 @@ static mode_t ideapad_is_visible(struct
>  	if (attr =3D=3D &dev_attr_camera_power.attr)
>  		supported =3D test_bit(CFG_CAMERA_BIT, &(priv->cfg));
>  	else
> +	if (attr =3D=3D &dev_attr_fan_mode.attr)
> +		/* I don't know a way to determine is there fan control
> +		 * on the device or not. For now suppose it is always
> +		 */
> +		supported =3D true;
> +	else

Use VPCCMD_R_FAN maybe a good idea

>  		supported =3D true;
>=20
>  	return supported ? attr->mode : 0;
> @@ -519,9 +567,15 @@ static void ideapad_platform_exit(struct
>   */
>  static const struct key_entry ideapad_keymap[] =3D {
>  	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, 7,  { KEY_CAMERA } },
> +	{ KE_KEY, 11, { KEY_SWITCHVIDEOMODE } },

Actually this is resolution change, I am not 100% comfortable with SWIT=
CHVIDEOMODE.
I do not write it because I dont think we have keycode for resolution c=
hange.

>  	{ KE_KEY, 13, { KEY_WLAN } },
>  	{ KE_KEY, 16, { KEY_PROG1 } },
>  	{ KE_KEY, 17, { KEY_PROG2 } },
> +	{ KE_KEY, 64, { KEY_PROG3 } },
> +	{ KE_KEY, 65, { KEY_PROG4 } },
> +	{ KE_KEY, 66, { KEY_TOUCHPAD_OFF } },
> +	{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
>  	{ KE_END, 0 },
>  };
>=20
> @@ -767,6 +821,25 @@ static int __devexit ideapad_acpi_remove
>  	return 0;
>  }
>=20
> +static void ideapad_check_special_buttons(struct ideapad_private
> *priv, unsigned long state)

line over 80 characters. There are same 9 warnings from checkpatch.pl

> +{
> +	unsigned long bit;
> +	for (bit =3D 0; bit < 16; bit++) {
> +		if (test_bit(bit, &state)) {
> +			switch (bit) {
> +			case 6:
> +				/* Thermal Management button */
> +				ideapad_input_report(priv, 65);
> +				break;
> +			case 1:
> +				/* OneKey Theater button */
> +				ideapad_input_report(priv, 64);
> +				break;
> +			}
> +		}
> +	}
> +}
> +
>  static void ideapad_acpi_notify(struct acpi_device *adevice, u32 eve=
nt)
>  {
>  	struct ideapad_private *priv =3D dev_get_drvdata(&adevice->dev);
> @@ -785,6 +858,19 @@ static void ideapad_acpi_notify(struct a
>  			case 9:
>  				ideapad_sync_rfk_state(priv);
>  				break;
> +			case 5:
> +				{
> +				unsigned long value;
> +				/* DO NOT DELETE: Without reading from EC touchpad LED doesn't
> switch state */
> +				if (!read_ec_data(handle, VPCCMD_R_TOUCHPAD, &value)) {
> +					/* WARNING: IdeaPad doesn't really turn off touchpad -
> +					 * it only switches the LED state. Userspace should
> +					 * turn touchpad off and on. We send KEY_TOUCHPAD_OFF and
> +					 * KEY_TOUCHPAD_ON to not to get out of sync with LED */
> +					ideapad_input_report(priv, value ? 67 : 66);
> +				}
> +				}

On the ideapad I have, its EC to turn off the touchpad and camera, so I=
 choose not
to report the event. How's the situation on your ideapad?

> +				break;
>  			case 4:
>  				ideapad_backlight_notify_brightness(priv);
>  				break;
> @@ -794,6 +880,13 @@ static void ideapad_acpi_notify(struct a
>  			case 2:
>  				ideapad_backlight_notify_power(priv);
>  				break;
> +			case 0:
> +				{
> +				unsigned long value;
> +				read_ec_data(handle, VPCCMD_R_SPECIAL_BUTTONS, &value);
> +				ideapad_check_special_buttons(priv, value);
> +				}
> +				break;
>  			default:
>  				ideapad_input_report(priv, vpc_bit);
>  			}
>=20

And could you also put the acpidump somewhere I can reach?

Many thanks.
