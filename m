Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F612BEC3B
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156734; cv=none; b=aidC0cXbg1koOAxd94j2JO1xpTzNaLUY1FnJisWMLV7iSM3dK0QKcT08IYwujpfaRHqCg48wlx2PPxSD8yMSZDpe7X6qCtqy4f3f5SaSzSGkIuIRtgNaawOZXHhFATuHEafVrt89WAtRl/O/q7f1fF11vgIO2G8M1ruKTdtHV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156734; c=relaxed/simple;
	bh=ZgPv8aJIUOlC2dqv1/gW0Wqu6XxvJkmqO8m1Gij0+rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMxmf8l0YqJI16RDwlWEycVJ/Vq0Uq/ElJZVYWAg78ZqeIG1GIoljFX5IJh8ZJysO9N1JMwSqLgVJWAM8qW3oR2fGkrC2EiIDO29aVgDXw6WdWsceI7iDg8prSm9LZv5B6n8T3zsy/Plbv92AyQ6uy4mTiuBv6vAL8GZl0fRTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aA3vu5g1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aA3vu5g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747156723; x=1747761523; i=w_armin@gmx.de;
	bh=C7WYxwTikTa+4S9JKA3d/NQdL+ku992HZvSgWFJwVYs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aA3vu5g17+cKt7jUVDAzCitNR474a7xrTtjugj9pVlKw/ZomzpV1GTga4qi9t18n
	 IzYYTNTfM1NBxhpUKYimUizQwJX6zhPmUrBbJCzF/0HDv10b0W3qXaEehADLD1s00
	 7k99s0KFbxWszImE9oXVkeqTYqOWAEZztHS7TetBovZGkfnbIb2j9H2Yn27zehgES
	 qBwsEXYqTlBmub2Bq3iuxrNxJpJskO0BI+Av+FPzRAYfwuaB9Q1DgXoj8gdsai64K
	 osIHwMbJEGcAWPtDri5xBO1TMIsMd8c+xaTm3PziTAmxp5gppNpvC79AdyjY5GvT8
	 Rnt9Qp+LYWKbX7Za8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1uIRm52n1X-002oFR; Tue, 13
 May 2025 19:18:42 +0200
Message-ID: <a1374573-9b27-4fb4-b857-eb4d1eef1800@gmx.de>
Date: Tue, 13 May 2025 19:18:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: ideapad: Expose charge_types
To: Jelle van der Waa <jvanderw@redhat.com>, Ike Panhc <ikepanhc@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20250513083816.461771-1-jvanderw@redhat.com>
 <20250513083816.461771-2-jvanderw@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250513083816.461771-2-jvanderw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ol/S5keNj5RUyPxnlKYQWf/row9dKdApAKEzWIp8VO6DYVQE6Ap
 2YleokQAZOFb/tbDfUKpdfmHbl7BPKzDhZ1/Po+jbrAbhfNha5FCbGC+dyItYahyb4mR2zS
 g1tuKW+sK5k5I00hEOgn6iKE1MZDBr+SNL90EiaI7A+/Pcmd91qOwV4tdBtsKnMy5JooBCn
 KWAQgLFhg0vxbIiA9LDjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NfPG9WnGFsA=;NWB5ySJOZVRCRJBsNf9tyQgpBIy
 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

Am 13.05.25 um 10:38 schrieb Jelle van der Waa:

> From: Jelle van der Waa <jvanderwaa@redhat.com>
>
> Some Ideapad models support a battery conservation mode which limits the
> battery charge threshold for longer battery longevity. This is currently
> exposed via a custom conservation_mode attribute in sysfs.
>
> The newly introduced charge_types sysfs attribute is a standardized
> replacement for laptops with a fixed end charge threshold. Setting it to
> `Long Life` would enable battery conservation mode. The standardized
> user space API would allow applications such as UPower to detect laptops
> which support this battery longevity mode and set it.
>
> Tested on an Lenovo ideapad U330p.

For the code itself:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> ---
>   .../obsolete/sysfs-platform-ideapad-laptop    |   8 ++
>   .../ABI/testing/sysfs-platform-ideapad-laptop |   9 --
>   drivers/platform/x86/Kconfig                  |   1 +
>   drivers/platform/x86/ideapad-laptop.c         | 110 +++++++++++++++++-
>   4 files changed, 116 insertions(+), 12 deletions(-)
>   create mode 100644 Documentation/ABI/obsolete/sysfs-platform-ideapad-l=
aptop
>
> diff --git a/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop b/=
Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop
> new file mode 100644
> index 000000000000..c1dbd19c679c
> --- /dev/null
> +++ b/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop
> @@ -0,0 +1,8 @@
> +What:		/sys/bus/platform/devices/VPC2004:*/conservation_mode
> +Date:		Aug 2017
> +KernelVersion:	4.14
> +Contact:	platform-driver-x86@vger.kernel.org
> +Description:
> +		Controls whether the conservation mode is enabled or not.
> +		This feature limits the maximum battery charge percentage to
> +		around 50-60% in order to prolong the lifetime of the battery.
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/D=
ocumentation/ABI/testing/sysfs-platform-ideapad-laptop
> index 4989ab266682..5ec0dee9e707 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -27,15 +27,6 @@ Description:
>   			* 1 -> Switched On
>   			* 0 -> Switched Off
>  =20
> -What:		/sys/bus/platform/devices/VPC2004:*/conservation_mode
> -Date:		Aug 2017
> -KernelVersion:	4.14
> -Contact:	platform-driver-x86@vger.kernel.org
> -Description:
> -		Controls whether the conservation mode is enabled or not.
> -		This feature limits the maximum battery charge percentage to
> -		around 50-60% in order to prolong the lifetime of the battery.
> -
>   What:		/sys/bus/platform/devices/VPC2004:*/fn_lock
>   Date:		May 2018
>   KernelVersion:	4.18
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..5ea12d6cbb38 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -462,6 +462,7 @@ config IBM_RTL
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> +	depends on ACPI_BATTERY
>   	depends on RFKILL && INPUT
>   	depends on SERIO_I8042
>   	depends on BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x8=
6/ideapad-laptop.c
> index ede483573fe0..21db9646443e 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -27,6 +27,7 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>   #include <linux/rfkill.h>
>   #include <linux/seq_file.h>
>   #include <linux/sysfs.h>
> @@ -34,6 +35,7 @@
>   #include <linux/wmi.h>
>   #include "ideapad-laptop.h"
>  =20
> +#include <acpi/battery.h>
>   #include <acpi/video.h>
>  =20
>   #include <dt-bindings/leds/common.h>
> @@ -162,6 +164,7 @@ struct ideapad_private {
>   	struct backlight_device *blightdev;
>   	struct ideapad_dytc_priv *dytc;
>   	struct dentry *debug;
> +	struct acpi_battery_hook battery_hook;
>   	unsigned long cfg;
>   	unsigned long r_touchpad_val;
>   	struct {
> @@ -589,6 +592,11 @@ static ssize_t camera_power_store(struct device *de=
v,
>  =20
>   static DEVICE_ATTR_RW(camera_power);
>  =20
> +static void show_conservation_mode_deprecation_warning(struct device *d=
ev)
> +{
> +	dev_warn_once(dev, "conservation_mode attribute has been deprecated, s=
ee charge_types.\n");
> +}
> +
>   static ssize_t conservation_mode_show(struct device *dev,
>   				      struct device_attribute *attr,
>   				      char *buf)
> @@ -597,6 +605,8 @@ static ssize_t conservation_mode_show(struct device =
*dev,
>   	unsigned long result;
>   	int err;
>  =20
> +	show_conservation_mode_deprecation_warning(dev);
> +
>   	err =3D eval_gbmd(priv->adev->handle, &result);
>   	if (err)
>   		return err;
> @@ -612,6 +622,8 @@ static ssize_t conservation_mode_store(struct device=
 *dev,
>   	bool state;
>   	int err;
>  =20
> +	show_conservation_mode_deprecation_warning(dev);
> +
>   	err =3D kstrtobool(buf, &state);
>   	if (err)
>   		return err;
> @@ -1973,10 +1985,90 @@ static const struct dmi_system_id ctrl_ps2_aux_p=
ort_list[] =3D {
>   	{}
>   };
>  =20
> -static void ideapad_check_features(struct ideapad_private *priv)
> +static int ideapad_psy_ext_set_prop(struct power_supply *psy,
> +				    const struct power_supply_ext *ext,
> +				    void *ext_data,
> +				    enum power_supply_property psp,
> +				    const union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv =3D ext_data;
> +
> +	switch (val->intval) {
> +	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
> +		return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_ON);
> +	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
> +		return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ideapad_psy_ext_get_prop(struct power_supply *psy,
> +				    const struct power_supply_ext *ext,
> +				    void *ext_data,
> +				    enum power_supply_property psp,
> +				    union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv =3D ext_data;
> +	unsigned long result;
> +	int err;
> +
> +	err =3D eval_gbmd(priv->adev->handle, &result);
> +	if (err)
> +		return err;
> +
> +	if (test_bit(GBMD_CONSERVATION_STATE_BIT, &result))
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +	else
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +
> +	return 0;
> +}
> +
> +static int ideapad_psy_prop_is_writeable(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *data,
> +					 enum power_supply_property psp)
> +{
> +	return true;
> +}
> +
> +static const enum power_supply_property ideapad_power_supply_props[] =
=3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext ideapad_battery_ext =3D {
> +	.name			=3D "ideapad_laptop",
> +	.properties		=3D ideapad_power_supply_props,
> +	.num_properties		=3D ARRAY_SIZE(ideapad_power_supply_props),
> +	.charge_types		=3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> +	.get_property		=3D ideapad_psy_ext_get_prop,
> +	.set_property		=3D ideapad_psy_ext_set_prop,
> +	.property_is_writeable	=3D ideapad_psy_prop_is_writeable,
> +};
> +
> +static int ideapad_battery_add(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> +{
> +	struct ideapad_private *priv =3D container_of(hook, struct ideapad_pri=
vate, battery_hook);
> +
> +	return power_supply_register_extension(battery, &ideapad_battery_ext,
> +					       &priv->platform_device->dev, priv);
> +}
> +
> +static int ideapad_battery_remove(struct power_supply *battery,
> +				  struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &ideapad_battery_ext);
> +
> +	return 0;
> +}
> +
> +static int ideapad_check_features(struct ideapad_private *priv)
>   {
>   	acpi_handle handle =3D priv->adev->handle;
>   	unsigned long val;
> +	int err;
>  =20
>   	priv->features.set_fn_lock_led =3D
>   		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
> @@ -1991,8 +2083,16 @@ static void ideapad_check_features(struct ideapad=
_private *priv)
>   	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>   		priv->features.fan_mode =3D true;
>  =20
> -	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")=
)
> +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")=
) {
>   		priv->features.conservation_mode =3D true;
> +		priv->battery_hook.add_battery =3D ideapad_battery_add;
> +		priv->battery_hook.remove_battery =3D ideapad_battery_remove;
> +		priv->battery_hook.name =3D "Ideapad Battery Extension";
> +
> +		err =3D devm_battery_hook_register(&priv->platform_device->dev, &priv=
->battery_hook);
> +		if (err)
> +			return err;
> +	}
>  =20
>   	if (acpi_has_method(handle, "DYTC"))
>   		priv->features.dytc =3D true;
> @@ -2027,6 +2127,8 @@ static void ideapad_check_features(struct ideapad_=
private *priv)
>   			}
>   		}
>   	}
> +
> +	return 0;
>   }
>  =20
>   #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -2175,7 +2277,9 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
>   	if (err)
>   		return err;
>  =20
> -	ideapad_check_features(priv);
> +	err =3D ideapad_check_features(priv);
> +	if (err)
> +		return err;
>  =20
>   	ideapad_debugfs_init(priv);
>  =20
