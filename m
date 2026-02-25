Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365D277026
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043823; cv=none; b=doSI52bvd1xR7r0n6w3drIHhuRgIag/xVQ9PS/AC4CSRJNVldZqdJ3uKK4APRIA+AGqb2gaj/fNmQXS5pEu0z/sP50ZFasYtNNZatEk6pJRNOp1Cz92OfJx4vjZrFVofDBHKG75EGVSrjwTRQvk6MBXViR7gVy1h0vxnTrPu4/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043823; c=relaxed/simple;
	bh=neXJ2P5nrEqGg1oIrc4fnPALOrQIjBPSsr5hmDuZedM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=I2EPuPvIxNhLWfK7Yc/ZAuG5JpAUSyldKGM5pU/oGI72D+GznoxIK9+HEpKglRLK2+xJZsb9jKU4X7LR4p31cnCrI/6rbQLNc4fe1TJHfbBZSK7GzRW5pwDJMitwHfAVakDeo9WZBVnttULxCnLaiuIJLhjMKWaOQCkoTWYKNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/Ar+EKa; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/Ar+EKa"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdbd13ca01so2806159eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043821; x=1772648621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MSZ5Lac5Qha5eoVR2OvD4Cps84q/S3JUf96fLFshFyQ=;
        b=k/Ar+EKad41YhLF3QMDIC4C5DwkOAm/w8Aeo6EPAs8lfH1R2x2u5unoJkiBFKRvqmK
         So1+P8HnK+rOBUr1Q7+XWhiKEZlDXid+63X3+Oct/1/GDUSizgRmMjDmYDbK5kr5jRei
         tkw07KPwcJoRXpScXGvTuUtsfePtsOZ+arF8XUW+iqIge0CmddhgPmHTrzQNS0Bt6r2h
         +2UJiOq+6R5XR1vhU8EklO8rsU8cZ+iJlKah+sB1ofFc49tH/wH82cC3paiAcPMRL+XB
         FH4RQQNmHQs6/MVU1PwmHFkHzQ5Hqopcp/BJ282EN+OlRZKXpK52OGydNZoJTFZYsLOx
         RztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043821; x=1772648621;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSZ5Lac5Qha5eoVR2OvD4Cps84q/S3JUf96fLFshFyQ=;
        b=GjZGST4tg4vEk38gIhBEEdEeeXLw9SfpOdMxaSpUKruitN+dvB7EK8AYuCosFrlDte
         G2kVIHp1c0b2wLHfFFAnMH/knTIPr4ErK/aKD10TksvxZOndxH34EpztvSBcAJnmsMS7
         M3nrYLVnd66RpV5gAJ/R5MdbEXynv6p0KuG8438m1NAbCZkIH2N8h+cfXjfHwFMpKlMk
         BCpOkfeufOdT2ocJETx+QZv6VWjn1tLqEGuEQxfPOLcZvCHfiJLFrdkLD5jj+cUbgnpB
         bqoulQXG7Fq4apfYiiEsCNETaaDlizc1sySClaYhiAdGX9FiWze602T+B4crmTFZ8le8
         lUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUaXtn1i0iyr0FsgKHuDOX3afzjK68CEEf2YJRp9ymFk8luN9p84+OQSmYCipljh3ZH4KdXqyEai4nDdsrf6gCAeRio@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Aga4YK/llQubxOoCWFQA6xqiMtw9vbfitnjTzzzHtGxkf1G5
	2v/uUN7TVyVHITxc8L6iqpVDwSq+rRmjvqX37hS8Dz5z9mKHDAMbHx1F
X-Gm-Gg: ATEYQzxoY8ureQohwkhw5XZUD3UfXkatPwBZN3WPXCkDq8/0GuBwI4E84JcA6o9IC3D
	mwbInjHYS2JU5CTcm7y24XLbocy3kK7MTaoXDTYilXQsD7bVePsQj2l2J6akSNOXuM0XtJC/M2e
	4zmXPiGpAMI7AVMx7lesNIKK/RoarcmnQh1tEjqKKRozrvV1hqwi3qZNEgzRb9zwtneubZrIexm
	bnARwMpIW5gdGVyq9qlc5+eeK04Q7/AVCnx06CZtIsnpKbxU9rb0aVTVuDbq3XljPtcHQWl1rXi
	HaBU42f9k0QuKMOj0Isb6hXFRLECGK84iLmq2cpJH9MWjKGJKlumtBzh898eKuSCpSo7pe6z5eQ
	PopEf9ZrqT/wVb9IKiRZAv4uIJXefZnBpUAJXI3FPkwTYpufXiTyve0ju1s9HSNy+z70Ot0/oUB
	5XlYNgQgM1Vr5hihNxXTfoPNZa3Cv42HZBmixHZz45xPR6cp/aTnWU6Vt8Rc2TVOEt14l3jqbLr
	oPnWAMlRcn1rUQpIv8gAA==
X-Received: by 2002:a05:7300:c608:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2bdcc0585edmr622781eec.24.1772043821227;
        Wed, 25 Feb 2026 10:23:41 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa37e9sm9373105eec.11.2026.02.25.10.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:23:40 -0800 (PST)
Date: Wed, 25 Feb 2026 10:23:41 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_6/6=5D_platform/x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Add_WMI_battery_charge_limiting=2E?=
User-Agent: Thunderbird for Android
In-Reply-To: <222fa8dd3e465aaea2f3ca7ff91bf7ff224278d7.camel@rong.moe>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-7-derekjohn.clark@gmail.com> <222fa8dd3e465aaea2f3ca7ff91bf7ff224278d7.camel@rong.moe>
Message-ID: <DC0A1067-42C8-4514-8546-A6E13F54CEA6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 25, 2026 9:55:40 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>There is an extra dot (period) in the title=2E Please remove it=2E
>
>On Tue, 2026-02-24 at 04:32 +0000, Derek J=2E Clark wrote:
>> Add charge-type power supply extension for devices that support WMI bas=
ed
>> charge enable/disable=2E Lenovo Legion devices that implement function =
ID
>> and capdata 00 ID 0x03010001 are able to enable or disable charging
>> through the lenovo-wmi-other interface=2E
>
>"disable charging"=2E=2E=2E
>
>I'd expect it pauses charging immediately and unconditionally instead
>of setting a threshold, especially considering the its name
>"INSTANT_MODE"=2E If this is the case, I don't think it fits the
>definition of POWER_SUPPLY_CHARGE_TYPE_LONGLIFE=2E It'd better to use
>POWER_SUPPLY_CHARGE_TYPE_NONE=2E

It really just sets a charge threshold of 80% and lowers the charge speed =
a bit=2E I'll come up with a better name than the one Lenovo uses in their =
docs=2E

>> The ideapad_laptop driver
>> conflicts with this if it can also provide the attribute, so we have to
>> get the acpi_handle and check for the same ACPI methods that enable the
>> feature in that driver=2E The ACPI method is more reliable from my test=
ing
>> when both are present, so there is no need to modify the ideapad_laptop
>> driver instead=2E
>
>When ideapad-laptop is blacklisted, there should be no conflict=2E I
>would suggest adding a module parameter to force wmi-other to register
>psy_ext anyway so that users can have their own choice=2E
>

That should be fine=2E I've found the WMI interface is a little buggy on d=
evices that support the ACPI method=2E I=2Ee=2E on the Go S and Go 2 it alw=
ays reports the "Enabled" status, but changing it shows the ACPI method rep=
orting the correct value=2E (I used a different attr name to test this)

>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh |   1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec   | 230 ++++++++++++++++++++=
++
>>  2 files changed, 231 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index b7f9ee7b301a=2E=2E00471551e7d6 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -26,6 +26,7 @@
>>  enum lwmi_device_id {
>>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>>  	LWMI_DEVICE_ID_GPU =3D 0x02,
>> +	LWMI_DEVICE_ID_PSU =3D 0x03,
>>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>>  };
>> =20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 7f0d5a17b44f=2E=2Eb2daff1b45c2 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -42,9 +42,12 @@
>>  #include <linux/module=2Eh>
>>  #include <linux/notifier=2Eh>
>>  #include <linux/platform_profile=2Eh>
>> +#include <linux/power_supply=2Eh>
>>  #include <linux/types=2Eh>
>>  #include <linux/wmi=2Eh>
>> =20
>> +#include <acpi/battery=2Eh>
>> +
>>  #include "wmi-capdata=2Eh"
>>  #include "wmi-events=2Eh"
>>  #include "wmi-gamezone=2Eh"
>> @@ -78,10 +81,17 @@ enum lwmi_feature_id_gpu {
>>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D 0x0b,
>>  };
>> =20
>> +enum lwmi_feature_id_psu {
>> +	LWMI_FEATURE_ID_PSU_INSTANT_MODE =3D 0x01,
>> +	LWMI_FEATURE_ID_PSU_CHARGE_MODE =3D 0x02,
>
>I see no code referencing LWMI_FEATURE_ID_PSU_CHARGE_MODE=2E What's the
>mode for?

It's another option exposed by some BIOS that is supposed to have similar =
functionality=2E None of my devices support it properly so I removed it but=
 forgot to clean up this define=2E

>> +};
>> +
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>>  #define LWMI_TYPE_ID_NONE 0x00
>>  #define LWMI_TYPE_ID_CROSSLOAD 0x01
>> +#define LWMI_TYPE_ID_PSU_AC 0x01
>> +#define LWMI_TYPE_ID_PSU_PD 0x02
>> =20
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> @@ -92,10 +102,17 @@ enum lwmi_feature_id_gpu {
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> +#define LWMI_CHARGE_MODE_ENABLED	0x00
>> +#define LWMI_CHARGE_MODE_DISABLED	0x01
>> +
>>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>> +#define LWMI_ATTR_ID_PSU(feat, type)		\
>> +	LWMI_ATTR_ID(LWMI_DEVICE_ID_PSU, feat,		\
>> +		     LWMI_GZ_THERMAL_MODE_NONE, type)
>> +
>
>Unaligned backslashes=2E
>
>>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> =20
>> @@ -137,6 +154,8 @@ struct lwmi_om_priv {
>>  		bool capdata00_collected : 1;
>>  		bool capdata_fan_collected : 1;
>>  	} fan_flags;
>> +
>> +	struct acpi_battery_hook battery_hook;
>>  };
>> =20
>>  /*
>> @@ -561,6 +580,216 @@ static void lwmi_om_fan_info_collect_cd_fan(struc=
t device *dev, struct cd_list *
>>  	lwmi_om_hwmon_add(priv);
>>  }
>> =20
>> +/* =3D=3D=3D=3D=3D=3D=3D=3D Power Supply Extension (component: lenovo-=
wmi-capdata 00) =3D=3D=3D=3D=3D=3D=3D=3D */
>> +
>> +/**
>> + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
>> + * @ps: The battery that was extended
>> + * @ext: The extension
>> + * @ext_data: Pointer the lwmi_om_priv drvdata
>> + * @prop: The property to read
>> + * @val: The value to return
>> + *
>> + * Writes the given value to the power_supply_ext property
>> + *
>> + * Return: 0 on success, or an error
>> + */
>> +static int lwmi_psy_ext_get_prop(struct power_supply *ps,
>> +				 const struct power_supply_ext *ext,
>> +				 void *ext_data,
>> +				 enum power_supply_property prop,
>> +				 union power_supply_propval *val)
>> +{
>> +	struct lwmi_om_priv *priv =3D ext_data;
>> +	struct wmi_method_args_32 args;
>> +	u32 retval;
>> +	int ret;
>> +
>> +	args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LW=
MI_TYPE_ID_PSU_AC);
>> +
>> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>> +				    (unsigned char *)&args, sizeof(args),
>> +				    &retval);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", re=
tval, prop);
>> +
>> +	if (retval =3D=3D LWMI_CHARGE_MODE_DISABLED)
>> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
>> +	else
>> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
>> + * @ps: The battery that was extended
>> + * @ext: The extension
>> + * @ext_data: Pointer the lwmi_om_priv drvdata
>> + * @prop: The property to write
>> + * @val: The value to write
>> + *
>> + * Writes the given value to the power_supply_ext property
>> + *
>> + * Return: 0 on success, or an error
>> + */
>> +static int lwmi_psy_ext_set_prop(struct power_supply *ps,
>> +				 const struct power_supply_ext *ext,
>> +				 void *ext_data,
>> +				 enum power_supply_property prop,
>> +				 const union power_supply_propval *val)
>> +{
>> +	struct lwmi_om_priv *priv =3D ext_data;
>> +	struct wmi_method_args_32 args;
>> +
>> +	args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LW=
MI_TYPE_ID_PSU_AC);
>> +	if (val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
>> +		args=2Earg1 =3D LWMI_CHARGE_MODE_DISABLED;
>> +	else
>> +		args=2Earg1 =3D LWMI_CHARGE_MODE_ENABLED;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x to=
 %x\n",
>> +		args=2Earg0, prop, args=2Earg1);
>> +
>> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
>> +				     (unsigned char *)&args, sizeof(args), NULL);
>> +}
>> +
>> +/**
>> + * lwmi_psy_prop_is_writeable() - Determine if the property is support=
ed
>> + * @ps: The battery that was extended
>> + * @ext: The extension
>> + * @ext_data: Pointer the lwmi_om_priv drvdata
>> + * @prop: The property to check
>> + *
>> + * Checks capdata 00 to determine if the property is supported=2E
>> + *
>> + * Return: Support level, or false
>> + */
>> +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
>> +				      const struct power_supply_ext *ext,
>> +				      void *ext_data,
>> +				      enum power_supply_property prop)
>> +{
>> +	struct lwmi_om_priv *priv =3D ext_data;
>> +	struct capdata00 capdata;
>> +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MOD=
E, LWMI_TYPE_ID_PSU_AC);
>> +	int ret;
>> +
>> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return false;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support level:=
 %x\n",
>> +		attribute_id, capdata=2Esupported);
>> +
>> +	return capdata=2Esupported;
>> +}
>> +
>> +static const enum power_supply_property lwmi_psy_ext_props[] =3D {
>> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
>> +};
>> +
>> +static const struct power_supply_ext lwmi_psy_ext =3D {
>> +	=2Ename			=3D LWMI_OM_SYSFS_NAME,
>> +	=2Eproperties		=3D lwmi_psy_ext_props,
>> +	=2Enum_properties		=3D ARRAY_SIZE(lwmi_psy_ext_props),
>> +	=2Echarge_types		=3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
>> +	=2Eget_property		=3D lwmi_psy_ext_get_prop,
>> +	=2Eset_property		=3D lwmi_psy_ext_set_prop,
>> +	=2Eproperty_is_writeable	=3D lwmi_psy_prop_is_writeable,
>> +};
>> +
>> +/**
>> + * lwmi_add_battery() - Connect the power_supply_ext
>> + * @battery: The battery to extend
>> + * @hook: The driver hook used to extend the battery
>> + *
>> + * Return: 0 on success, or an error=2E
>> + */
>> +static int lwmi_add_battery(struct power_supply *battery, struct acpi_=
battery_hook *hook)
>> +{
>> +	struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_priv,=
 battery_hook);
>> +
>> +	return power_supply_register_extension(battery, &lwmi_psy_ext, &priv-=
>wdev->dev, priv);
>> +}
>> +
>> +/**
>> + * lwmi_remove_battery() - Disconnect the power_supply_ext
>> + * @battery: The battery that was extended
>> + * @hook: The driver hook used to extend the battery
>> + *
>> + * Return: 0 on success, or an error=2E
>> + */
>> +static int lwmi_remove_battery(struct power_supply *battery, struct ac=
pi_battery_hook *hook)
>> +{
>> +	power_supply_unregister_extension(battery, &lwmi_psy_ext);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
>> + * @handle: The ACPI handle that manages battery charging
>> + * @lvl: Unused
>> + * @context: Void pointer to the acpi_handle object to return
>> + * @retval: Unused
>> + *
>> + * Checks if the ideapad_laptop driver is going to manage charge_type =
first,
>> + * then if not, hooks the battery to our WMI methods=2E
>> + *
>> + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found=2E
>> + */
>> +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
>> +				   void *context, void **retval)
>> +{
>> +	if (!handle)
>> +		return AE_OK;
>> +
>> +	acpi_handle *ahand =3D context;
>> +	*ahand =3D handle;
>> +
>> +	return AE_CTRL_TERMINATE;
>> +}
>> +
>> +/**
>> + * lwmi_om_ps_ext_init() - Hooks power supply extension to device batt=
ery
>> + * @priv: Driver private data
>> + *
>> + * Checks if the ideapad_laptop driver is going to manage charge_type =
first,
>> + * then if not, hooks the battery to our WMI methods=2E
>> + */
>> +static void lwmi_om_ps_ext_init(struct lwmi_om_priv *priv)
>> +{
>> +	static const char * const ideapad_hid =3D "VPC2004";
>> +	acpi_handle handle =3D NULL;
>> +	int ret;
>> +
>> +	/* Deconflict ideapad_laptop driver */
>> +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL)=
;
>> +	if (ret)
>> +		return;
>> +
>> +	if (!handle)
>> +		return;
>
>I am a bit confused here=2E If VPC2004 is not found, handle should remain
>NULL=2E In this case we have no conflict, right?
>
>Thanks,
>Rong
>
>> +
>> +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"=
)) {
>> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for=
 device=2E\n");
>> +		return;
>> +	}
>> +
>> +	/* Add battery hooks */
>> +	priv->battery_hook=2Eadd_battery	=3D lwmi_add_battery,
>> +	priv->battery_hook=2Eremove_battery	=3D lwmi_remove_battery,
>> +	priv->battery_hook=2Ename		=3D "Lenovo WMI Other Battery Extension",
>> +
>> +	ret =3D devm_battery_hook_register(&priv->wdev->dev, &priv->battery_h=
ook);
>> +	if (ret)
>> +		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
>> +}
>> +
>>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capda=
ta 01) =3D=3D=3D=3D=3D=3D=3D=3D */
>> =20
>>  struct tunable_attr_01 {
>> @@ -1325,6 +1554,7 @@ static int lwmi_om_master_bind(struct device *dev=
)
>>  		return -ENODEV;
>> =20
>>  	lwmi_om_fan_info_collect_cd00(priv);
>> +	lwmi_om_ps_ext_init(priv);
>> =20
>>  	return lwmi_om_fw_attr_add(priv);
>>  }

