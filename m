Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409C1917CD
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004083; cv=none; b=IZNKgT/D0rZpw+KREvMcNayiXb4/MgAhXDOGQEPfC5Fvs4fy8KmmPLbEpcVkfvo5t1JnDo4Q0kOqSlqQ+Tl6rUj6Vohv5i28oBO92JSl6nW9WwGhUhQ4X4np3AuLoT5IZqSPQubqGfzccvy3g9dpz/gszNnHeUR7sF7Amv5zTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004083; c=relaxed/simple;
	bh=Vdpx9H+mCFWzYbA4rdsO0Tr4arlC4QnFW8hRejw3bSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U92Sbl5MCJGc+D8FWHNiAO792kezD1tfo/dJBSGG3b4OTmhA9irk7J8bZRgO47NkWuxK5hWnKbE+LawLbLQ8aI3/2Vtyizjr8zVYC74/JoAWoQzUg4+O4wNpmmCuRlIAblpfwlsYKtrWE1e1xXW8qisCP8XgeHC1BN2M8XGMQjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G800DORt; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G800DORt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747004074; x=1747608874; i=w_armin@gmx.de;
	bh=aJu4PA6WeKUavJ14YD0zwV0jz79YIsysYJ3D3DOLZ5s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G800DORtAyc9ipBiAwZ4S6E7N5A4CGUmBoLnelOealu4ZuhbegAihp2b7eisLCgi
	 sRuRVW2L7SDkwQWFY6OMXOS3XuXnOLBbqIp227NL3JlKDE0vcSI9veSmLyPnw1MnE
	 85K7O7BG+oPZF4yVI3tljPFkVRIu8XpQxT1ZjFqQwL9ItwHGDKNhwZ8OLcoMATycZ
	 tQwIKSXwuv5lH0YADC8PNqHUkDVhCm3iThOhsGTVRYQHkYiyvA388aa3AjE+5VNZi
	 ClLWaWrgtFAsnFF+Od4LL+hz5xbkpxpcMw8e9PRS4+ReVDJfchgyndy23qS82zXDM
	 R/Dqfl/tyXlsAOw68A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1Obh-1uysrK3jkh-012IVo; Mon, 12
 May 2025 00:54:34 +0200
Message-ID: <964a9e0b-8901-4f50-a725-9f841fa6914d@gmx.de>
Date: Mon, 12 May 2025 00:54:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: ideapad: Expose charge_types
To: Jelle van der Waa <jvanderw@redhat.com>, Ike Panhc <ikepanhc@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20250511113012.9251-1-jvanderw@redhat.com>
 <20250511113012.9251-2-jvanderw@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511113012.9251-2-jvanderw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R9xWvO0LLV8e7iY6riK9Nah3HIILYfOtFPZ2M+zkF3o519oTEtS
 U9351vRmlvS7Rl12mMh96lDmO7wRCcqe7DDzpm5GjnWWusIeH3PcyevNCOvJpzag0Armh2r
 GKtWRacpRRi1zQw8yydU+E6gaOihQamSs9+sYwq4QJL5czUy3stxxpzi1HhELLO3jbkO5Q1
 bQLaflIy+hH56M1xGKwLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nYlYdnmhPHA=;ygXZPmrosxMtK4EPesCVFag8apz
 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

Am 11.05.25 um 13:30 schrieb Jelle van der Waa:

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

Hi,

i like the idea behind this patch series, the charge_types attribute is in=
deed
exactly what we need in this case.

>
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> ---
>   .../ABI/testing/sysfs-platform-ideapad-laptop |   2 +
>   drivers/platform/x86/ideapad-laptop.c         | 126 +++++++++++++++++-
>   2 files changed, 125 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/D=
ocumentation/ABI/testing/sysfs-platform-ideapad-laptop
> index 4989ab266682..83eca4c14503 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -32,6 +32,8 @@ Date:		Aug 2017
>   KernelVersion:	4.14
>   Contact:	platform-driver-x86@vger.kernel.org
>   Description:
> +		This interface is deprecated; please use /sys/class/power_supply/*/ch=
arge_types.
> +

Maybe it would make sense to move this attribute to Documentation/ABI/obso=
lete?

>   		Controls whether the conservation mode is enabled or not.
>   		This feature limits the maximum battery charge percentage to
>   		around 50-60% in order to prolong the lifetime of the battery.
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x8=
6/ideapad-laptop.c
> index ede483573fe0..fd9127ffd456 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -34,12 +34,17 @@
>   #include <linux/wmi.h>
>   #include "ideapad-laptop.h"
>  =20
> +#include <linux/power_supply.h>
> +#include <acpi/battery.h>

Please make sure that IDEAPAD_LAPTOP depends on ACPI_BATTERY inside the Kc=
onfig.

>   #include <acpi/video.h>
>  =20
>   #include <dt-bindings/leds/common.h>
>  =20
>   #define IDEAPAD_RFKILL_DEV_NUM	3
>  =20
> +#define IDEAPAD_CHARGE_TYPES		(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD)  =
| \
> +					 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))

This macro is rather small and only used once. Please open-code it.

> +
>   enum {
>   	CFG_CAP_BT_BIT       =3D 16,
>   	CFG_CAP_3G_BIT       =3D 17,
> @@ -162,6 +167,8 @@ struct ideapad_private {
>   	struct backlight_device *blightdev;
>   	struct ideapad_dytc_priv *dytc;
>   	struct dentry *debug;
> +	struct acpi_battery_hook battery_hook;
> +	struct power_supply *hooked_battery;

Unused attribute, please remove.

>   	unsigned long cfg;
>   	unsigned long r_touchpad_val;
>   	struct {
> @@ -589,6 +596,11 @@ static ssize_t camera_power_store(struct device *de=
v,
>  =20
>   static DEVICE_ATTR_RW(camera_power);
>  =20
> +static void show_deprecation_warning(struct device *dev)
> +{
> +	dev_warn_once(dev, "conservation_mode attribute has been deprecated, s=
ee charge_types.\n");
> +}
> +
>   static ssize_t conservation_mode_show(struct device *dev,
>   				      struct device_attribute *attr,
>   				      char *buf)
> @@ -597,6 +609,8 @@ static ssize_t conservation_mode_show(struct device =
*dev,
>   	unsigned long result;
>   	int err;
>  =20
> +	show_deprecation_warning(dev);
> +
>   	err =3D eval_gbmd(priv->adev->handle, &result);
>   	if (err)
>   		return err;
> @@ -612,6 +626,8 @@ static ssize_t conservation_mode_store(struct device=
 *dev,
>   	bool state;
>   	int err;
>  =20
> +	show_deprecation_warning(dev);
> +
>   	err =3D kstrtobool(buf, &state);
>   	if (err)
>   		return err;
> @@ -1973,10 +1989,99 @@ static const struct dmi_system_id ctrl_ps2_aux_p=
ort_list[] =3D {
>   	{}
>   };
>  =20
> -static void ideapad_check_features(struct ideapad_private *priv)
> +static int ideapad_psy_ext_set_prop(struct power_supply *psy,
> +				       const struct power_supply_ext *ext,

Alignment should match open parenthesis.

> +				       void *ext_data,
> +				       enum power_supply_property psp,
> +				       const union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv =3D ext_data;
> +	int err;
> +
> +	if (psp !=3D POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return -EINVAL;
> +
> +	err =3D exec_sbmc(priv->adev->handle,
> +			(val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE ?
> +			 SBMC_CONSERVATION_ON : SBMC_CONSERVATION_OFF));

AFAIK the power supply core does not check if val->intval holds a supporte=
d charge type value.
Please use a switch case to return -EINVAL in such cases.

> +	if (err)
> +		return err;

Please directly return the result of exec_sbmc() here.

> +
> +	return 0;
> +}
> +
> +static int ideapad_psy_ext_get_prop(struct power_supply *psy,
> +				       const struct power_supply_ext *ext,

Alignment should match open parenthesis.

> +				       void *ext_data,
> +				       enum power_supply_property psp,
> +				       union power_supply_propval *val)
> +{
> +	struct ideapad_private *priv =3D ext_data;
> +	unsigned long result;
> +	int err;
> +
> +	if (psp !=3D POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return -EINVAL;
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
> +					    const struct power_supply_ext *ext,

Alignment should match open parenthesis.

> +					    void *data,
> +					    enum power_supply_property psp)
> +{
> +	if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_TYPES)
> +		return true;
> +
> +	return false;
> +}
> +
> +static const enum power_supply_property ideapad_power_supply_props[] =
=3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext ideapad_battery_ext =3D {
> +	.name			=3D "ideapad",

Maybe using a more specific name like "ideapad_laptop"/"ideapad_acpi" woul=
d be better here?

> +	.properties		=3D ideapad_power_supply_props,
> +	.num_properties		=3D ARRAY_SIZE(ideapad_power_supply_props),
> +	.charge_types		=3D IDEAPAD_CHARGE_TYPES,
> +	.get_property		=3D ideapad_psy_ext_get_prop,
> +	.set_property		=3D ideapad_psy_ext_set_prop,
> +	.property_is_writeable	=3D ideapad_psy_prop_is_writeable,
> +};
> +
> +static int ideapad_battery_add(struct power_supply *battery,
> +			       struct acpi_battery_hook *hook)
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
> @@ -1991,8 +2096,19 @@ static void ideapad_check_features(struct ideapad=
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
> +		if (err) {
> +			dev_dbg(&priv->platform_device->dev,
> +				"failed to register battery hook: %d\n", err);

I think this error message is unnecessary. Please remove it.

Thanks,
Armin Wolf

> +			return err;
> +		}
> +	}
>  =20
>   	if (acpi_has_method(handle, "DYTC"))
>   		priv->features.dytc =3D true;
> @@ -2027,6 +2143,8 @@ static void ideapad_check_features(struct ideapad_=
private *priv)
>   			}
>   		}
>   	}
> +
> +	return 0;
>   }
>  =20
>   #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -2175,7 +2293,9 @@ static int ideapad_acpi_add(struct platform_device=
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
