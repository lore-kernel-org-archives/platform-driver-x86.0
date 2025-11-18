Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765C327204;
	Tue, 18 Nov 2025 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472987; cv=none; b=D6POEezz1B1NtaOc0U38N1TOdDrPYajA2f1D3QLHLbCRW9rtbNNcI8z3kyKaVu3e2qtSsjkLoNtxp1MZHQU+YZ8l0e1+BBS4VD9os+3dkJjNS3o37PLSD4f0qug8qAAzJY2qXTK70ofyOAkMKAQYdkUVTsyWVm92EFZNXqCgIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472987; c=relaxed/simple;
	bh=KS7yEnaQsVEwQKp75wvIm9FDvcdGaUG+Jc4f76rXV2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzlbB2Ea4FXxk3NI18npnfcz6YcZF1Gi3k8cZZPdhNHx6xd2pELtr+AkXMJFHaIMRl4wpRMetWmy0y699HCbs6dpkvRkx0O6d5H4WxmxipndB6LFYNXbCEOShyVSxMqeAXmx8JYTTATioeWnCyeRWTuWiekPps3v21RWTYvQ3J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SLi9oP2I; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SLi9oP2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763472957; x=1764077757; i=w_armin@gmx.de;
	bh=KS7yEnaQsVEwQKp75wvIm9FDvcdGaUG+Jc4f76rXV2E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SLi9oP2Idp7N8O6ewDeKQtRxbY3P+ckgTj+dF+nSyKRUhGhTdlA4zpI7Edwa3UoX
	 UOP+nn8yc1sYWfehreoaM2WR2TrlP2YrIbNfM80NBVfa1xoDRh08VFTwMfWPUBshN
	 IndwsPk7NiyNL58phoXxxtGsJNtHVXzhjBZIpo9fDirfl3tlHGc81Quht9wjiOU8W
	 rju2GSLKQIZ5Ku8P83gLlt8QO/05zzRTWYHBf4rH1G4ecNRYZp4TvYB2GBtsNEUgf
	 IF54Mn4OyY/onRJES2Y+PDqWW2hsM29dBUOehC81JmUrEfbEB5W2hpQlTaNvq9Wzp
	 UY8ktV+Lgz/OEqwgGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1Obh-1wJcDm0cYN-017N2C; Tue, 18
 Nov 2025 14:35:57 +0100
Message-ID: <318ee1e8-c1b2-4253-8a63-657652bc64fc@gmx.de>
Date: Tue, 18 Nov 2025 14:35:55 +0100
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
 <627e6759-3062-42b1-aaa0-3fe4dbcdf680@gmx.de>
 <dc086fb7-073d-4368-a122-ec4d7cb0da3f@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <dc086fb7-073d-4368-a122-ec4d7cb0da3f@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rZaZgN9hiw3KnByZ0N66NsLsabheIZ8COvBWb2S646igTwesDPt
 /v0ynlzuYbIg5a3vOgXtu1Ck7CKs/ptaeqQDrPzznVg+ATDrVmcUgkzSEh62SWPBklpCU7q
 Hg3BG7SGZ4oxbVmPEQUWZpId8PzdpvAmUZj1XZuIJDFjY8YffwtgmQCz/vLAExyGZI0AtAe
 lhwsYlEcIB6mMVyyoBW8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FpoieC+FH4A=;3QuCM/Y2O/uratc+Rpcr6IBrnKo
 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
 27ug69X2YGJwmXsGsZ3R

Am 18.11.25 um 14:01 schrieb Werner Sembach:

>
> Am 18.11.25 um 12:16 schrieb Armin Wolf:
>> Am 17.11.25 um 14:24 schrieb Werner Sembach:
>>
>>> Move uniwill_dmi_table up and remove __intconst to make it also=20
>>> accessible
>>> in the probe function.
>>
>> NAK, i expect the DMI table to become very large in the future, so=20
>> not marking it
>> as __initconst will waste a sizeable amount of memory.
>>
>> Luckily i am also currently working on extending the DMI table to=20
>> contain additional
>> configuration data like power limits and callbacks for=20
>> device-specific initialization.
>>
>> I can share the patch with you if you want. It would allow us to=20
>> discard the DMI table
>> after module initialization while still allowing for device-specific=20
>> initialization
>> callbacks.
> this callback needs a way to probe for presence of a Nvidia card e.g.=20
> by reading the ec

The patch i am talking about allows DMI table entries to provide a "device=
 descriptor" that
basically is a struct consisting of vendor-specific data and a callback th=
at is executed by
the platform driver when probing the EC. This would allow you to read the =
special register.
Said device descriptor will replace the supported_features variable.

I will send you the patch tomorrow.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 344=20
>>> ++++++++++----------
>>> =C2=A0 1 file changed, 172 insertions(+), 172 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index de3417d9d1ac0..9412783698685 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -1405,178 +1405,7 @@ static int uniwill_ec_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_add_action_or_reset(data->d=
ev,=20
>>> uniwill_disable_manual_control, data);
>>> =C2=A0 }
>>> =C2=A0 -static int uniwill_probe(struct platform_device *pdev)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data;
>>> -=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>>> -=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 handle =3D ACPI_HANDLE(&pdev->dev);
>>> -=C2=A0=C2=A0=C2=A0 if (!handle)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 data =3D devm_kzalloc(&pdev->dev, sizeof(*data), G=
FP_KERNEL);
>>> -=C2=A0=C2=A0=C2=A0 if (!data)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 data->dev =3D &pdev->dev;
>>> -=C2=A0=C2=A0=C2=A0 data->handle =3D handle;
>>> -=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, data);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 regmap =3D devm_regmap_init(&pdev->dev, &uniwill_e=
c_bus, data,=20
>>> &uniwill_ec_config);
>>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(regmap))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(regmap);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 data->regmap =3D regmap;
>>> -=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(&pdev->dev, &data->super_k=
ey_lock);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_ec_init(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_battery_init(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_led_init(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_hwmon_init(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_nvidia_ctgp_init(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return uniwill_input_init(data);
>>> -}
>>> -
>>> -static void uniwill_shutdown(struct platform_device *pdev)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D platform_get_drvdata=
(pdev);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM,=20
>>> ENABLE_MANUAL_CTRL);
>>> -}
>>> -
>>> -static int uniwill_suspend_keyboard(struct uniwill_data *data)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_K=
EY_TOGGLE))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The EC_ADDR_SWITCH_STATUS is marked as vol=
atile, so we have=20
>>> to restore it
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * ourselves.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_SWITCH_ST=
ATUS,=20
>>> &data->last_switch_status);
>>> -}
>>> -
>>> -static int uniwill_suspend_battery(struct uniwill_data *data)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY=
))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current charge limit in order to =
restore it during=20
>>> resume.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot use the regmap code for that sin=
ce this register=20
>>> needs to
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * be declared as volatile due to CHARGE_CTRL=
_REACHED.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_CHARGE_CT=
RL,=20
>>> &data->last_charge_ctrl);
>>> -}
>>> -
>>> -static int uniwill_suspend(struct device *dev)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_keyboard(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_battery(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, true);
>>> -=C2=A0=C2=A0=C2=A0 regcache_mark_dirty(data->regmap);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> -}
>>> -
>>> -static int uniwill_resume_keyboard(struct uniwill_data *data)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_K=
EY_TOGGLE))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_S=
TATUS, &value);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 if ((data->last_switch_status & SUPER_KEY_LOCK_STA=
TUS) =3D=3D=20
>>> (value & SUPER_KEY_LOCK_STATUS))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TRI=
GGER,=20
>>> TRIGGER_SUPER_KEY_LOCK,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>>> -}
>>> -
>>> -static int uniwill_resume_battery(struct uniwill_data *data)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY=
))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_CH=
ARGE_CTRL,=20
>>> CHARGE_CTRL_MASK,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->last_charge_ctrl);
>>> -}
>>> -
>>> -static int uniwill_resume(struct device *dev)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, false);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D regcache_sync(data->regmap);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_keyboard(data);
>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 return uniwill_resume_battery(data);
>>> -}
>>> -
>>> -static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend,=20
>>> uniwill_resume);
>>> -
>>> -/*
>>> - * We only use the DMI table for auoloading because the ACPI device=
=20
>>> itself
>>> - * does not guarantee that the underlying EC implementation is=20
>>> supported.
>>> - */
>>> -static const struct acpi_device_id uniwill_id_table[] =3D {
>>> -=C2=A0=C2=A0=C2=A0 { "INOU0000" },
>>> -=C2=A0=C2=A0=C2=A0 { },
>>> -};
>>> -
>>> -static struct platform_driver uniwill_driver =3D {
>>> -=C2=A0=C2=A0=C2=A0 .driver =3D {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev_groups =3D uniwill_gr=
oups,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe_type =3D PROBE_PREF=
ER_ASYNCHRONOUS,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .acpi_match_table =3D uniw=
ill_id_table,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_sleep_ptr(&uniw=
ill_pm_ops),
>>> -=C2=A0=C2=A0=C2=A0 },
>>> -=C2=A0=C2=A0=C2=A0 .probe =3D uniwill_probe,
>>> -=C2=A0=C2=A0=C2=A0 .shutdown =3D uniwill_shutdown,
>>> -};
>>> -
>>> -static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D=
 {
>>> +static const struct dmi_system_id uniwill_dmi_table[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "XMG=
 FUSION 15",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>> @@ -1936,6 +1765,177 @@ static const struct dmi_system_id=20
>>> uniwill_dmi_table[] __initconst =3D {
>>> =C2=A0 };
>>> =C2=A0 MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>>> =C2=A0 +static int uniwill_probe(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data;
>>> +=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>>> +=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 handle =3D ACPI_HANDLE(&pdev->dev);
>>> +=C2=A0=C2=A0=C2=A0 if (!handle)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data =3D devm_kzalloc(&pdev->dev, sizeof(*data), G=
FP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0 if (!data)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->dev =3D &pdev->dev;
>>> +=C2=A0=C2=A0=C2=A0 data->handle =3D handle;
>>> +=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, data);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regmap =3D devm_regmap_init(&pdev->dev, &uniwill_e=
c_bus, data,=20
>>> &uniwill_ec_config);
>>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(regmap))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(regmap);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->regmap =3D regmap;
>>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(&pdev->dev, &data->super_k=
ey_lock);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_ec_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_battery_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_led_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_hwmon_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_nvidia_ctgp_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return uniwill_input_init(data);
>>> +}
>>> +
>>> +static void uniwill_shutdown(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D platform_get_drvdata=
(pdev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM,=20
>>> ENABLE_MANUAL_CTRL);
>>> +}
>>> +
>>> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_K=
EY_TOGGLE))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The EC_ADDR_SWITCH_STATUS is marked as vol=
atile, so we have=20
>>> to restore it
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * ourselves.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_SWITCH_ST=
ATUS,=20
>>> &data->last_switch_status);
>>> +}
>>> +
>>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY=
))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current charge limit in order to =
restore it during=20
>>> resume.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot use the regmap code for that sin=
ce this register=20
>>> needs to
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * be declared as volatile due to CHARGE_CTRL=
_REACHED.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_CHARGE_CT=
RL,=20
>>> &data->last_charge_ctrl);
>>> +}
>>> +
>>> +static int uniwill_suspend(struct device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_keyboard(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_battery(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, true);
>>> +=C2=A0=C2=A0=C2=A0 regcache_mark_dirty(data->regmap);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int uniwill_resume_keyboard(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_K=
EY_TOGGLE))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_S=
TATUS, &value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if ((data->last_switch_status & SUPER_KEY_LOCK_STA=
TUS) =3D=3D=20
>>> (value & SUPER_KEY_LOCK_STATUS))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TRI=
GGER,=20
>>> TRIGGER_SUPER_KEY_LOCK,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>>> +}
>>> +
>>> +static int uniwill_resume_battery(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY=
))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_CH=
ARGE_CTRL,=20
>>> CHARGE_CTRL_MASK,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->last_charge_ctrl);
>>> +}
>>> +
>>> +static int uniwill_resume(struct device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, false);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regcache_sync(data->regmap);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_keyboard(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return uniwill_resume_battery(data);
>>> +}
>>> +
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend,=20
>>> uniwill_resume);
>>> +
>>> +/*
>>> + * We only use the DMI table for auoloading because the ACPI device=
=20
>>> itself
>>> + * does not guarantee that the underlying EC implementation is=20
>>> supported.
>>> + */
>>> +static const struct acpi_device_id uniwill_id_table[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 { "INOU0000" },
>>> +=C2=A0=C2=A0=C2=A0 { },
>>> +};
>>> +
>>> +static struct platform_driver uniwill_driver =3D {
>>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev_groups =3D uniwill_gr=
oups,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe_type =3D PROBE_PREF=
ER_ASYNCHRONOUS,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .acpi_match_table =3D uniw=
ill_id_table,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_sleep_ptr(&uniw=
ill_pm_ops),
>>> +=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0 .probe =3D uniwill_probe,
>>> +=C2=A0=C2=A0=C2=A0 .shutdown =3D uniwill_shutdown,
>>> +};
>>> +
>>> =C2=A0 static int __init uniwill_init(void)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct dmi_system_id *id;
>
