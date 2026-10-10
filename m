Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6543AFCFA;
	Sat, 10 Oct 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631623; cv=pass; b=hcyXDNFS9brzzf0h55Ji87Z3nXiN+4exgW6J+LoGH975+dmk9jk96TtbWouleD977D9KyfVtcZQfvScGDWLQNX1EeficoYuZupyDHeoJLIBOPWbhU+amgs9zOWWNqxJiC7YwReYzgXSS1lVxwzJjO/f0kS+86Ot8Ly3MBIEsfBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631623; c=relaxed/simple;
	bh=U8Pz5fV6ML46pcKXRreGb2DOinm4nSi8n0TuyBHLshA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uOmagfOKrXVLnnEAq9rHd17b2fh49Up+We77qhQPiLYVsQEpyl1a8Ut6j1KTW+dHagMKkfOX26JrsHplbU4EsJA8GXyQL+Nbg8OAS8aWuVffYyDD8MMMXa2G/doN/Q12Zthe35ujbG88VcSADeb3P1qMdm8uu5nZij+xMVHB1XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Pi4SBvql; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Pi4SBvql"
ARC-Seal: i=1; a=rsa-sha256; t=1791631613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kLxbHs/c0uun4nI1fuu5m8hq3QJN+7DCumXJXTidS9Uy6g8wKodFcEme075Bjr3v7XpNnhpm/h66AMPmEWzSKZ1QlANUyQNYzrrCTFkQUiBhuGAszfsFxObs+5nDfRKckwX17mwuNejna78Xm37eS3rOgru35bOkCUD+Qiz844U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791631613; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o+O9lRyIGiOwrk1A/BMT7Cx9GIUtxfcVS8n/WN+Z490=; 
	b=irbprASIRwWOa0yY6on1/hacnBhGxk3L/PlWSx8StL7QN1ppowYWETDvZDYUm5XtHmCkxXA3RqW6kX4zn3nsJhVSNFyGBxlEIjkJCMStHZd8MHiYhxzpIHgGVqACD4lNZ6aBXSfRcnQLz+EE6eb3WpNbP73JoZ/R4Y4dLrgkobQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791631613;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=o+O9lRyIGiOwrk1A/BMT7Cx9GIUtxfcVS8n/WN+Z490=;
	b=Pi4SBvqluxWX7tT/jPT8S7MkOP82w0XZOZheikG1e5zW4FnNMgyPiHsXPYRLZJLz
	ZDuNx4t0f10M+0yS2sov+bXBr9p6B2sDTdV60D6DJZq3rdvxuVIc0APAZTKTUJvFtZX
	s/5kaKh0OKjzQHXXbA2mvJ5Moie5egvskL5QsIsZ85o/Vci02moTsT/uGFZ+ozTafID
	qQw9ziEl8HAYABsnmWf7Rk0aFAqTxjFUQ6ICXRmOsW5eWdlMdsaKLS5mvEfZzQkDi/A
	9RYLd8BJcP6ltecyib7cqT4Tr77LxRBG3Nl0ckANv2VwKm7ntw15qyDkdZArmLx+w7Q
	t2U0pM+RgA==
Received: by smtp.zohomail.com with SMTPS id 17916316133141009.311224728631;
	Sat, 10 Oct 2026 04:26:53 -0700 (PDT)
Message-ID: <035799dd461fe0e7a60564e11f10fd23eb3daabf.camel@rong.moe>
Subject: Re: [PATCH v2 2/5] platform/x86: uniwill-laptop: Implement rainbow
 animation as trigger
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <20261007144101.323289-3-W_Armin@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
	 <20261007144101.323289-3-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 19:20:50 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin,

On Wed, 2026-10-07 at 16:38 +0200, Armin Wolf wrote:
> It turns out that some models require the lightbar to be activated
> in order to display the rainbow animation, so users have to access
> both the "rainbow_animation" sysfs attribute and the LED sysfs
> interface when enabling the rainbow animation. This can cause short
> glitches when the lightbar was previously disabled.
>=20
> Fix this by replacing the sysfs attribute with a custom LED trigger
> called "uniwill-rainbow". Selecting this trigger will atomically
> activate the lightbar and enable the rainbow animation mode. This
> can potentially break userspace applications using the old sysfs
> attribute, but so far no such application is known to exist (yet).
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 ++
>  .../ABI/testing/sysfs-driver-uniwill-laptop   |  11 --
>  .../admin-guide/laptops/uniwill-laptop.rst    |   5 +-
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/uniwill/Kconfig          |   1 +
>  drivers/platform/x86/uniwill/uniwill-acpi.c   | 133 +++++++++++-------
>  6 files changed, 95 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>=20
> diff --git a/Documentation/ABI/removed/sysfs-driver-uniwill-laptop b/Docu=
mentation/ABI/removed/sysfs-driver-uniwill-laptop
> new file mode 100644
> index 000000000000..c226efc23b59
> --- /dev/null
> +++ b/Documentation/ABI/removed/sysfs-driver-uniwill-laptop
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
> +Date:		November 2025
> +KernelVersion:	6.19
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:
> +		Forces the integrated lightbar to display a rainbow animation when the=
 machine
> +		is not suspended. Writing "1"/"0" into this file enables/disables this
> +		functionality.
> +
> +		Reading this file returns the current status of the rainbow animation =
functionality.

It'd be more helpful by documenting the removal date, version and what
has replaced it.

> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docu=
mentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 943f92c6b561..b9b9feebe2ed 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -29,17 +29,6 @@ Description:
>  		Reading this file returns the current enable status of the touchpad to=
ggle
>  		functionality.
> =20
> -What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
> -Date:		November 2025
> -KernelVersion:	6.19
> -Contact:	Armin Wolf <W_Armin@gmx.de>
> -Description:
> -		Forces the integrated lightbar to display a rainbow animation when the=
 machine
> -		is not suspended. Writing "1"/"0" into this file enables/disables this
> -		functionality.
> -
> -		Reading this file returns the current status of the rainbow animation =
functionality.
> -
>  What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
>  Date:		November 2025
>  KernelVersion:	6.19
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docum=
entation/admin-guide/laptops/uniwill-laptop.rst
> index be50b45b82ef..aaf50e3074c1 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -74,8 +74,9 @@ Lightbar
>  The ``uniwill-laptop`` driver exposes the lightbar found on some models =
as a standard multicolor
>  LED class device. The default name of this LED class device is ``uniwill=
:multicolor:status``.
> =20
> -See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on=
 how to control the various
> -animation modes of the lightbar.
> +The lightbar supports a separate rainbow animation mode that can be enab=
led by selecting the
> +`uniwill-rainbow` LED trigger. To enable a breathing animation during su=
spend, see
> +Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
> =20
>  Keyboard Backlight
>  ------------------
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa0571a5e479..f9dd979d0fa7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28106,6 +28106,7 @@ UNIWILL LAPTOP DRIVER
>  M:	Armin Wolf <W_Armin@gmx.de>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>  F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>  F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
>  F:	Documentation/wmi/devices/uniwill-laptop.rst
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/=
uniwill/Kconfig
> index d07cc8440188..f80794bdfaef 100644
> --- a/drivers/platform/x86/uniwill/Kconfig
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -28,6 +28,7 @@ config UNIWILL_LAPTOP
>  	depends on DMI
>  	select REGMAP
>  	select INPUT_SPARSEKMAP
> +	select LEDS_TRIGGERS
>  	help
>  	  This driver adds support for various extra features found on Uniwill =
laptops,
>  	  like the lightbar, hwmon sensors and hotkeys. It also supports many O=
EM laptops
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 788bf4064d34..0fb0d267664a 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -900,51 +900,6 @@ static ssize_t touchpad_toggle_enable_show(struct de=
vice *dev, struct device_att
> =20
>  static DEVICE_ATTR_RW(touchpad_toggle_enable);
> =20
> -static ssize_t rainbow_animation_store(struct device *dev, struct device=
_attribute *attr,
> -				       const char *buf, size_t count)
> -{
> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
> -	unsigned int value;
> -	bool enable;
> -	int ret;
> -
> -	ret =3D kstrtobool(buf, &enable);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (enable)
> -		value =3D LIGHTBAR_WELCOME;
> -	else
> -		value =3D 0;
> -
> -	guard(mutex)(&data->led_lock);
> -
> -	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGH=
TBAR_WELCOME, value);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIG=
HTBAR_WELCOME, value);
> -	if (ret < 0)
> -		return ret;
> -
> -	return count;
> -}
> -
> -static ssize_t rainbow_animation_show(struct device *dev, struct device_=
attribute *attr, char *buf)
> -{
> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
> -	unsigned int value;
> -	int ret;
> -
> -	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
> -	if (ret < 0)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
> -}
> -
> -static DEVICE_ATTR_RW(rainbow_animation);
> -
>  static ssize_t breathing_in_suspend_store(struct device *dev, struct dev=
ice_attribute *attr,
>  					  const char *buf, size_t count)
>  {
> @@ -1258,7 +1213,6 @@ static struct attribute *uniwill_attrs[] =3D {
>  	&dev_attr_super_key_enable.attr,
>  	&dev_attr_touchpad_toggle_enable.attr,
>  	/* Lightbar-related */
> -	&dev_attr_rainbow_animation.attr,
>  	&dev_attr_breathing_in_suspend.attr,
>  	/* Power-management-related */
>  	&dev_attr_ctgp_offset.attr,
> @@ -1288,8 +1242,7 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
>  			return attr->mode;
>  	}
> =20
> -	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
> -	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> +	if (attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>  		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>  			return attr->mode;

It'd be better to convert breathing_in_suspend into an LED device
attribute. See led_classdev->groups.

>  	}
> @@ -1537,6 +1490,59 @@ static int uniwill_led_brightness_set(struct led_c=
lassdev *led_cdev, enum led_br
>  	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_S0_OFF, value);
>  }
> =20
> +static int uniwill_led_hw_control_set(struct led_classdev *led_cdev, uns=
igned long flags)
> +{
> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill_=
data, led_mc_cdev);
> +	unsigned int value;
> +	int ret;
> +
> +	guard(mutex)(&data->led_lock);
> +
> +	if (flags)
> +		value =3D LIGHTBAR_WELCOME;
> +	else
> +		value =3D LIGHTBAR_S0_OFF;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
> +				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL,
> +				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The LED is always on during hw control */
> +	led_cdev->brightness =3D flags;
> +
> +	return 0;
> +}
> +
> +static int uniwill_lightbar_trigger_activate(struct led_classdev *led_cd=
ev)
> +{
> +	return led_cdev->hw_control_set(led_cdev, 1);
> +}
> +
> +static void uniwill_lightbar_trigger_deactivate(struct led_classdev *led=
_cdev)
> +{
> +	int ret;
> +
> +	ret =3D led_cdev->hw_control_set(led_cdev, 0);
> +	if (ret < 0)
> +		dev_err(led_cdev->dev, "Failed to stop rainbow animation: %d\n", ret);
> +}
> +
> +static struct led_hw_trigger_type uniwill_lightbar_trigger_type;
> +
> +static struct led_trigger uniwill_lightbar_trigger =3D {
> +	.name =3D "uniwill-rainbow",
> +	.activate =3D uniwill_lightbar_trigger_activate,
> +	.deactivate =3D uniwill_lightbar_trigger_deactivate,
> +	.trigger_type =3D &uniwill_lightbar_trigger_type,
> +};
> +
>  #define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_=
S3_OFF | LIGHTBAR_WELCOME)
> =20
>  static int uniwill_led_init(struct uniwill_data *data)
> @@ -1587,12 +1593,18 @@ static int uniwill_led_init(struct uniwill_data *=
data)
>  	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
>  	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>  	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brig=
htness_set;
> +	data->led_mc_cdev.led_cdev.trigger_type =3D &uniwill_lightbar_trigger_t=
ype;
> +	data->led_mc_cdev.led_cdev.hw_control_trigger =3D uniwill_lightbar_trig=
ger.name;
> +	data->led_mc_cdev.led_cdev.hw_control_set =3D uniwill_led_hw_control_se=
t;

A private trigger does not need hw_control_set, which is only meant to
coordinate between different drivers, i.e., in the case when the LED
device and the hardware control trigger are located at different drivers.

I've also updated the documentation in commit 8e04e5382aa9 ("leds:
trigger: Add hw_offloaded() callback and provide
trigger_may_offload_to_hw attribute"), quoted below:

   Alternatively, a private trigger can be implemented along with the LED
   driver if the LED's hardware control doesn't fit any generic trigger. To
   associate the private trigger with the LED classdev, their `trigger_type=
`
   must be the same. To declare that the private trigger provides hardware
   control for the associated LED classdev, set the `hw_control_trigger`
   string to the trigger's name. Since both the LED classdev and the privat=
e
   trigger are in the same LED driver, it's not necessary for them to
   coordinate via `hw_control_*` callbacks.

I'd suggest calling uniwill_led_hw_control_set() directly from the
trigger's [de]activate callbacks, just like other drivers.

> =20
>  	if (value & LIGHTBAR_S0_OFF)
>  		data->led_mc_cdev.led_cdev.brightness =3D 0;
>  	else
>  		data->led_mc_cdev.led_cdev.brightness =3D 1;
> =20
> +	if (value & LIGHTBAR_WELCOME)

Check !LIGHTBAR_S0_OFF too?

If the last state is LIGHTBAR_S0_OFF|LIGHTBAR_WELCOME (probably caused by
an outdated driver without this patch), the trigger's activate callback
will be called on probe, lighting up the previously off LED. Is this
intentional?

Thanks,
Rong

> +		data->led_mc_cdev.led_cdev.default_trigger =3D uniwill_lightbar_trigge=
r.name;
> +
>  	for (int i =3D 0; i < LED_CHANNELS; i++) {
>  		data->led_mc_subled_info[i].color_index =3D color_indices[i];
> =20
> @@ -3540,17 +3552,31 @@ static int __init uniwill_init(void)
>  		pr_warn("Enabling potentially unsupported features\n");
>  	}
> =20
> -	ret =3D platform_driver_register(&uniwill_driver);
> +	/*
> +	 * We cannot register the trigger inside the .probe callback of the
> +	 * platform driver, because each trigger needs a unique name.
> +	 */
> +	ret =3D led_trigger_register(&uniwill_lightbar_trigger);
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D platform_driver_register(&uniwill_driver);
> +	if (ret < 0)
> +		goto err_platform;
> +
>  	ret =3D uniwill_wmi_register_driver();
> -	if (ret < 0) {
> -		platform_driver_unregister(&uniwill_driver);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto err_wmi;
> =20
>  	return 0;
> +
> +err_wmi:
> +	platform_driver_unregister(&uniwill_driver);
> +
> +err_platform:
> +	led_trigger_unregister(&uniwill_lightbar_trigger);
> +
> +	return ret;
>  }
>  module_init(uniwill_init);
> =20
> @@ -3558,6 +3584,7 @@ static void __exit uniwill_exit(void)
>  {
>  	uniwill_wmi_unregister_driver();
>  	platform_driver_unregister(&uniwill_driver);
> +	led_trigger_unregister(&uniwill_lightbar_trigger);
>  }
>  module_exit(uniwill_exit);
> =20
