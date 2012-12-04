From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v2 4/8] msi-laptop: Add MSI Wind U90/U100 support
Date: Wed, 05 Dec 2012 07:06:58 +0800
Message-ID: <1354662418.21227.1422.camel@linux-s257.site>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	 <1354291477-8788-5-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:37292 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751444Ab2LDXIS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 Dec 2012 18:08:18 -0500
In-Reply-To: <1354291477-8788-5-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E4=BA=94=EF=BC=8C2012-11-30 =E6=96=BC 18:04 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Add MSI Wind U90/U100 to DMI table and add some missing EC features
> support such as basic fan control, turbo and ECO modes and touchpad
> state. Tested on MSI Wind U100.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks for your patch!
Joey Lee

> ---
> Comparing to the previous series, I dropped 0xE4 and 0x64 scan codes
> filtering. It was needed to filter out touchpad toggle key and send
> only separate touchpad on/off keys. It was bad solution because 0xE4
> and 0x64 are extended scan codes following after 0xE0. We can't filte=
r
> 0xE0 when 0xE4/0x64 is arrived because we already passed 0xE0.
> Filtering only 0xE4/0x64 resulted in having '0xE0, 0xE0' in stream an=
d
> it caused kernel warnings about unknown key.
>=20
> The solution is to edit default udev keymap rules that remap 0xE4 sca=
n
> code to F21 key.
>=20
>  drivers/platform/x86/msi-laptop.c | 123 ++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 121 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 0bf94b5..28bcbb2 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -82,8 +82,19 @@
>  #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS	0x2d
>  #define MSI_STANDARD_EC_SCM_LOAD_MASK		(1 << 0)
> =20
> -#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS	0xe4
> +#define MSI_STANDARD_EC_FUNCTIONS_ADDRESS	0xe4
> +/* Power LED is orange - Turbo mode */
> +#define MSI_STANDARD_EC_TURBO_MASK		(1 << 1)
> +/* Power LED is green - ECO mode */
> +#define MSI_STANDARD_EC_ECO_MASK		(1 << 3)
> +/* Touchpad is turned on */
>  #define MSI_STANDARD_EC_TOUCHPAD_MASK		(1 << 4)
> +/* If this bit !=3D bit 1, turbo mode can't be toggled */
> +#define MSI_STANDARD_EC_TURBO_COOLDOWN_MASK	(1 << 7)
> +
> +#define MSI_STANDARD_EC_FAN_ADDRESS		0x33
> +/* If zero, fan rotates at maximal speed */
> +#define MSI_STANDARD_EC_AUTOFAN_MASK		(1 << 0)
> =20
>  #ifdef CONFIG_PM_SLEEP
>  static int msi_laptop_resume(struct device *device);
> @@ -435,18 +446,115 @@ static ssize_t store_auto_brightness(struct de=
vice *dev,
>  	return count;
>  }
> =20
> +static ssize_t show_touchpad(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +
> +	u8 rdata;
> +	int result;
> +
> +	result =3D ec_read(MSI_STANDARD_EC_FUNCTIONS_ADDRESS, &rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCHPAD_MAS=
K));
> +}
> +
> +static ssize_t show_turbo(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +
> +	u8 rdata;
> +	int result;
> +
> +	result =3D ec_read(MSI_STANDARD_EC_FUNCTIONS_ADDRESS, &rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TURBO_MASK))=
;
> +}
> +
> +static ssize_t show_eco(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +
> +	u8 rdata;
> +	int result;
> +
> +	result =3D ec_read(MSI_STANDARD_EC_FUNCTIONS_ADDRESS, &rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_ECO_MASK));
> +}
> +
> +static ssize_t show_turbo_cooldown(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +
> +	u8 rdata;
> +	int result;
> +
> +	result =3D ec_read(MSI_STANDARD_EC_FUNCTIONS_ADDRESS, &rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sprintf(buf, "%i\n", (!!(rdata & MSI_STANDARD_EC_TURBO_MASK)=
) |
> +		(!!(rdata & MSI_STANDARD_EC_TURBO_COOLDOWN_MASK) << 1));
> +}
> +
> +static ssize_t show_auto_fan(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +
> +	u8 rdata;
> +	int result;
> +
> +	result =3D ec_read(MSI_STANDARD_EC_FAN_ADDRESS, &rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_AUTOFAN_MASK=
));
> +}
> +
> +static ssize_t store_auto_fan(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +
> +	int enable, result;
> +
> +	if (sscanf(buf, "%i", &enable) !=3D 1 || (enable !=3D (enable & 1))=
)
> +		return -EINVAL;
> +
> +	result =3D ec_write(MSI_STANDARD_EC_FAN_ADDRESS, enable);
> +	if (result < 0)
> +		return result;
> +
> +	return count;
> +}
> +
>  static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level)=
;
>  static DEVICE_ATTR(auto_brightness, 0644, show_auto_brightness,
>  		   store_auto_brightness);
>  static DEVICE_ATTR(bluetooth, 0444, show_bluetooth, NULL);
>  static DEVICE_ATTR(wlan, 0444, show_wlan, NULL);
>  static DEVICE_ATTR(threeg, 0444, show_threeg, NULL);
> +static DEVICE_ATTR(touchpad, 0444, show_touchpad, NULL);
> +static DEVICE_ATTR(turbo_mode, 0444, show_turbo, NULL);
> +static DEVICE_ATTR(eco_mode, 0444, show_eco, NULL);
> +static DEVICE_ATTR(turbo_cooldown, 0444, show_turbo_cooldown, NULL);
> +static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
> =20
>  static struct attribute *msipf_attributes[] =3D {
>  	&dev_attr_lcd_level.attr,
>  	&dev_attr_auto_brightness.attr,
>  	&dev_attr_bluetooth.attr,
>  	&dev_attr_wlan.attr,
> +	&dev_attr_touchpad.attr,
> +	&dev_attr_turbo_mode.attr,
> +	&dev_attr_eco_mode.attr,
> +	&dev_attr_turbo_cooldown.attr,
> +	&dev_attr_auto_fan.attr,
>  	NULL
>  };
> =20
> @@ -590,6 +698,16 @@ static struct dmi_system_id __initdata msi_dmi_t=
able[] =3D {
>  		.driver_data =3D &quirk_load_scm_model,
>  		.callback =3D dmi_check_cb
>  	},
> +	{
> +		.ident =3D "MSI U90/U100",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR,
> +				"MICRO-STAR INTERNATIONAL CO., LTD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "U90/U100"),
> +		},
> +		.driver_data =3D &quirk_load_scm_ro_model,
> +		.callback =3D dmi_check_cb
> +	},
>  	{ }
>  };
> =20
> @@ -679,7 +797,7 @@ static void msi_send_touchpad_key(struct work_str=
uct *ignored)
>  	u8 rdata;
>  	int result;
> =20
> -	result =3D ec_read(MSI_STANDARD_EC_TOUCHPAD_ADDRESS, &rdata);
> +	result =3D ec_read(MSI_STANDARD_EC_FUNCTIONS_ADDRESS, &rdata);
>  	if (result < 0)
>  		return;
> =20
> @@ -1069,3 +1187,4 @@ MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*=
:pnMS-N051:*");
>  MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
>  MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
>  MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
> +MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnU90/U100:*");
