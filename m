Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA592F2918;
	Tue, 18 Nov 2025 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464630; cv=none; b=ipQ0D2C/OuN9r/qyhm0Z4DJc9VfGgeUt9AIWW77AVCbcLn23R5BmVUaSFgI86h4+YMW4SwHtphWIlCkXmXF7GfqdnrfzTPgMiQWHlzjoD9cuPTIDu0VzkFkq84i0t7pYlwQ3CFLoPZCFiRC2LZCgmWRig0wCFUiRvXTEHFKwV7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464630; c=relaxed/simple;
	bh=aOA2P0jfZ5x/6n4cd5j2UnXx0VbojsMd6TxnGfJyffg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFjeMNnniGb1Dun4msyxzXPT0xmEWBvnNcAQ89vybdZi0Or67YjHVVaPC04ANjhBHJ1LAPZ5n0lrYfAKKRvJecarG9tJLzmK+g4erus+gGTr3eo8yq9S2XGS6e1/nRR5OgA94h1ieD62JK9I4NcoNQ0h8Rdy2alcSuVAZwzBcD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tA1ffU7t; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tA1ffU7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763464602; x=1764069402; i=w_armin@gmx.de;
	bh=EdFeciP99+7gXGIpHUAlaJ+iGy3TccVbg5P3EawNWR0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tA1ffU7tUhopJF6Suwjl2NMVD18PzGgqj9+40F57qNPIX209qcQloi4asa45uoes
	 B23nQkpKq5mYo7/G836Yl71/dUy9kJgExKS29o+196rWz9/ftKjXtifjWkLkUf6OS
	 NbD2myxcsmq97kdux6dD4kSuYQadJe44PwAIMkeF06u1Kjyyv8dpMJAwh4BIKijp4
	 AXNSAPHWAgCLs+iTwQTrdyPEA+u+WZYAcxAu1vrycDX9LVjmJ+y9qMBpJBT6kKrcq
	 pI9YH1hxwHo/iTlUipOkKG7XklE33wR8TvZhKjP5VeJ3+ckfBpAzXXLg+o6RRStRd
	 AtHdTHlgnt3VEzNXVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNtP-1w0Soe3b0n-00p9px; Tue, 18
 Nov 2025 12:16:42 +0100
Message-ID: <627e6759-3062-42b1-aaa0-3fe4dbcdf680@gmx.de>
Date: Tue, 18 Nov 2025 12:16:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] platform/x86/uniwill: Make uniwill_dmi_table
 accessible in probe
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-5-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251117132530.32460-5-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:olfToziyu1OW5Ly8ijF6LiMOZnvXdjV2DSU44IXK/uwN4J8rNLz
 ea7gTvqnoao0zs1j14mbKTI8zxNtb4L59r4ZT3+armWz7zn4OiJKSW6UZMKlwL7QrxRGyfG
 x5l6oDNaHW/F/qdmNNY8V07IrsX/kLtZMXRou3wxyW1cxL+2AFIfYelWglV5tYNfjQkkr0V
 bQL7c3Ey+9w272ZjK8fvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5J5uek757B0=;Wpvo0N6zXM7Dt8l0hwvUeg8F7E9
 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
 2SC7bFcVyYeZHwHTdtt0Rq8Loo+Zr

Am 17.11.25 um 14:24 schrieb Werner Sembach:

> Move uniwill_dmi_table up and remove __intconst to make it also accessib=
le
> in the probe function.

NAK, i expect the DMI table to become very large in the future, so not mar=
king it
as __initconst will waste a sizeable amount of memory.

Luckily i am also currently working on extending the DMI table to contain =
additional
configuration data like power limits and callbacks for device-specific ini=
tialization.

I can share the patch with you if you want. It would allow us to discard t=
he DMI table
after module initialization while still allowing for device-specific initi=
alization
callbacks.

Thanks,
Armin Wolf

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 344 ++++++++++----------
>   1 file changed, 172 insertions(+), 172 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index de3417d9d1ac0..9412783698685 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1405,178 +1405,7 @@ static int uniwill_ec_init(struct uniwill_data *=
data)
>   	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_con=
trol, data);
>   }
>  =20
> -static int uniwill_probe(struct platform_device *pdev)
> -{
> -	struct uniwill_data *data;
> -	struct regmap *regmap;
> -	acpi_handle handle;
> -	int ret;
> -
> -	handle =3D ACPI_HANDLE(&pdev->dev);
> -	if (!handle)
> -		return -ENODEV;
> -
> -	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	data->dev =3D &pdev->dev;
> -	data->handle =3D handle;
> -	platform_set_drvdata(pdev, data);
> -
> -	regmap =3D devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwil=
l_ec_config);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	data->regmap =3D regmap;
> -	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_ec_init(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_battery_init(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_led_init(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_hwmon_init(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_nvidia_ctgp_init(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	return uniwill_input_init(data);
> -}
> -
> -static void uniwill_shutdown(struct platform_device *pdev)
> -{
> -	struct uniwill_data *data =3D platform_get_drvdata(pdev);
> -
> -	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> -}
> -
> -static int uniwill_suspend_keyboard(struct uniwill_data *data)
> -{
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> -		return 0;
> -
> -	/*
> -	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to rest=
ore it
> -	 * ourselves.
> -	 */
> -	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_sw=
itch_status);
> -}
> -
> -static int uniwill_suspend_battery(struct uniwill_data *data)
> -{
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> -		return 0;
> -
> -	/*
> -	 * Save the current charge limit in order to restore it during resume.
> -	 * We cannot use the regmap code for that since this register needs to
> -	 * be declared as volatile due to CHARGE_CTRL_REACHED.
> -	 */
> -	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_char=
ge_ctrl);
> -}
> -
> -static int uniwill_suspend(struct device *dev)
> -{
> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret =3D uniwill_suspend_keyboard(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_suspend_battery(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	regcache_cache_only(data->regmap, true);
> -	regcache_mark_dirty(data->regmap);
> -
> -	return 0;
> -}
> -
> -static int uniwill_resume_keyboard(struct uniwill_data *data)
> -{
> -	unsigned int value;
> -	int ret;
> -
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> -		return 0;
> -
> -	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> -	if (ret < 0)
> -		return ret;
> -
> -	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value &=
 SUPER_KEY_LOCK_STATUS))
> -		return 0;
> -
> -	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_=
KEY_LOCK,
> -				 TRIGGER_SUPER_KEY_LOCK);
> -}
> -
> -static int uniwill_resume_battery(struct uniwill_data *data)
> -{
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> -		return 0;
> -
> -	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CT=
RL_MASK,
> -				  data->last_charge_ctrl);
> -}
> -
> -static int uniwill_resume(struct device *dev)
> -{
> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
> -	int ret;
> -
> -	regcache_cache_only(data->regmap, false);
> -
> -	ret =3D regcache_sync(data->regmap);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret =3D uniwill_resume_keyboard(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	return uniwill_resume_battery(data);
> -}
> -
> -static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwil=
l_resume);
> -
> -/*
> - * We only use the DMI table for auoloading because the ACPI device its=
elf
> - * does not guarantee that the underlying EC implementation is supporte=
d.
> - */
> -static const struct acpi_device_id uniwill_id_table[] =3D {
> -	{ "INOU0000" },
> -	{ },
> -};
> -
> -static struct platform_driver uniwill_driver =3D {
> -	.driver =3D {
> -		.name =3D DRIVER_NAME,
> -		.dev_groups =3D uniwill_groups,
> -		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> -		.acpi_match_table =3D uniwill_id_table,
> -		.pm =3D pm_sleep_ptr(&uniwill_pm_ops),
> -	},
> -	.probe =3D uniwill_probe,
> -	.shutdown =3D uniwill_shutdown,
> -};
> -
> -static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
> +static const struct dmi_system_id uniwill_dmi_table[] =3D {
>   	{
>   		.ident =3D "XMG FUSION 15",
>   		.matches =3D {
> @@ -1936,6 +1765,177 @@ static const struct dmi_system_id uniwill_dmi_ta=
ble[] __initconst =3D {
>   };
>   MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>  =20
> +static int uniwill_probe(struct platform_device *pdev)
> +{
> +	struct uniwill_data *data;
> +	struct regmap *regmap;
> +	acpi_handle handle;
> +	int ret;
> +
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev =3D &pdev->dev;
> +	data->handle =3D handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	regmap =3D devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwil=
l_ec_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data->regmap =3D regmap;
> +	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_ec_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_battery_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_led_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_hwmon_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_nvidia_ctgp_init(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_input_init(data);
> +}
> +
> +static void uniwill_shutdown(struct platform_device *pdev)
> +{
> +	struct uniwill_data *data =3D platform_get_drvdata(pdev);
> +
> +	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
> +}
> +
> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +		return 0;
> +
> +	/*
> +	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to rest=
ore it
> +	 * ourselves.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_sw=
itch_status);
> +}
> +
> +static int uniwill_suspend_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	/*
> +	 * Save the current charge limit in order to restore it during resume.
> +	 * We cannot use the regmap code for that since this register needs to
> +	 * be declared as volatile due to CHARGE_CTRL_REACHED.
> +	 */
> +	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_char=
ge_ctrl);
> +}
> +
> +static int uniwill_suspend(struct device *dev)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D uniwill_suspend_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_suspend_battery(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	regcache_cache_only(data->regmap, true);
> +	regcache_mark_dirty(data->regmap);
> +
> +	return 0;
> +}
> +
> +static int uniwill_resume_keyboard(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +		return 0;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value &=
 SUPER_KEY_LOCK_STATUS))
> +		return 0;
> +
> +	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_=
KEY_LOCK,
> +				 TRIGGER_SUPER_KEY_LOCK);
> +}
> +
> +static int uniwill_resume_battery(struct uniwill_data *data)
> +{
> +	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +		return 0;
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CT=
RL_MASK,
> +				  data->last_charge_ctrl);
> +}
> +
> +static int uniwill_resume(struct device *dev)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(data->regmap, false);
> +
> +	ret =3D regcache_sync(data->regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D uniwill_resume_keyboard(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_battery(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwil=
l_resume);
> +
> +/*
> + * We only use the DMI table for auoloading because the ACPI device its=
elf
> + * does not guarantee that the underlying EC implementation is supporte=
d.
> + */
> +static const struct acpi_device_id uniwill_id_table[] =3D {
> +	{ "INOU0000" },
> +	{ },
> +};
> +
> +static struct platform_driver uniwill_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.dev_groups =3D uniwill_groups,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +		.acpi_match_table =3D uniwill_id_table,
> +		.pm =3D pm_sleep_ptr(&uniwill_pm_ops),
> +	},
> +	.probe =3D uniwill_probe,
> +	.shutdown =3D uniwill_shutdown,
> +};
> +
>   static int __init uniwill_init(void)
>   {
>   	const struct dmi_system_id *id;
