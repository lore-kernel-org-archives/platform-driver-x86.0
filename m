Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7E2D6401
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042662; cv=none; b=hhoEpQicp9T09YWE7UojEoup0EdcQ0KuZsRxHApoNziR95zTtpabccK+yacrzIHMiBgqD+eY7gPdoS57ELCKEl54uB7psEPZ9p9PHJ6uUaKBb9uTajAy8eOQhLmGxfKbofEWf1j7e15d+AFr5vPJnQ7oWdIXwKEUUfMRPG/UCnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042662; c=relaxed/simple;
	bh=1eokuNsrPO2N76+moecddQPp7jPuxYnZkYDKOEps2dE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PXEMP80yNsRs5lybTIKj80FJjbf4Nq+tDSEvXur0COiHDm6LhizrnL9XRXeJ4AOxOTz22CMrs6W+RCiegtIAYL3TKlc10WpoiTUP+FVd+JfEJFF/wmoK+NHQZ/7PktAkY3xD2TdwKEM3KasgPkYqhQQvtDzExgmxlmHArI39Ilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnbf7fTD; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnbf7fTD"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4b77adso8624368c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042659; x=1772647459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zFpaFm2htFz9WFNXus4H8nNERF6Ws1wcK/8+TQToiUA=;
        b=Fnbf7fTD7wPKMWJGn62+WzTg6sJa2p0sisVxyI9VT7inw7xIwxj20PlFSAGoa8+tRW
         Tk/D+t7fXE9IDYHeX9KL4LuVyKWf1e5e8f+cTBjrviRGEW3YaXvlaEF+zXmgbWlyQcWD
         wvmF8JYvA8XD1JUy0TTOtCAoQfLwyR+CFpCdXl7zzCxCEA/1WwzYLXhmkiY/wA3fSNFY
         eYEbGU05jH09nrXw4Fbn/S3yJz2WRPlW4h/7jUkjs2JqC9DL9p9fN6tTgGPMUHlAmjVL
         ydiw07e/zU1ZmJ/bawwiOYuXjhKZPCvuzWuQcxVnUPy7wkyRuitBUIhw/Dy9KdmWB60y
         Rhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042659; x=1772647459;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFpaFm2htFz9WFNXus4H8nNERF6Ws1wcK/8+TQToiUA=;
        b=D1uwMHcxqjLiKBFqiCWggs6Okd8yhxD/k0hrawnkmbRO3az7gpzH6NBjQ0vu/WZceQ
         /vrcJUqWsM04M6MrTXpIIYb7DXyVHSBo6y/TMA5iqKhsdp9TWmvP7+405EZ/3iFUtc0W
         dGmRGhYkbQsCzV8Nf7pP4amR3M41hNwGjmoSmTMHKCdb8dSndpwdfs30rRIA+4nGJqDI
         /WcFhC2Mu7QvcyJ6ALHfJ66hHEbNzrDh//Tsrhte0/IvKc3bZi1EDAiCgP2A6bIwlBUE
         M+zgZRBCCEMCY7tYm48U5hCqhFpkhR16oAcy3gQ6edol+UI5od2rgcXXRoa7iDuaJUPM
         NlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMx/P5ABIzy0SQbtPwW9T0gcz5aiti1wJmdQHU+KVVQFkeTRMZC8XM6ufrosiVxuE5ZQJEXqMwpR66camWhqMLyId@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwn11iNSSMbl9FCOEw08EA2NTQVh1jiwWnNZ6m6yAZl808+QJA
	TmxNNbj3B0zt6OHnkJZKCfapenRJiKVFMvzt9+Zr7c++Z6JfI/6cYroBBGbYvA==
X-Gm-Gg: ATEYQzwRyatf6WmPQnvbOWfeEzJHl5lwrRaoW0rD3NclQqq3hG9KDPeKkKuaY9DIyQB
	TIgIzyx0QtdQP6bfBAlmeblJMyvjXz4ztnVX/4Ncc8zVfgAZQRhm7HB0NpWvfp0dIqoes5BWqHa
	c7Mv+27FpITvQ2t9RelgklgaT0ef9Yh4ZHxr9BbAygnWSHj+WAxcA6xcEZEB+h3e7WA0aD9ijhP
	ppm+hpeUzYEHvQt4STEEcEBZ3T+fwwlByGpYhVM754QSSczKwT89JLyf2ZBrrBOtIHZP3hT19hQ
	COq8mKhXj/Z+UGKVWQ++ppPPNArvagZIWJutXFTCaZjbnlTyXwq3Dvnvp65fKpE0uzuKzUgatmw
	u1HzqZUprmSOV8zhAr9MJeg7xPj5tuYoqg4xEp05d4xyZappPaZCaOG8A4Yx+miahulNnPGQKj+
	50zhi0agIy6M/Q+j57vwPq7OpEd2GQxmS4PWeZF24aywgxjJfL2/eY+jBMfSy+T+feT5KI2LMYk
	TienklN52K086ZtNEOHCw==
X-Received: by 2002:a05:7022:68a2:b0:119:e56c:189c with SMTP id a92af1059eb24-1276acb5b44mr5086249c88.4.1772042658468;
        Wed, 25 Feb 2026 10:04:18 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc169e2sm10433777eec.29.2026.02.25.10.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:04:18 -0800 (PST)
Date: Wed, 25 Feb 2026 10:04:19 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_6/6=5D_platform/x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Add_WMI_battery_charge_limiting=2E?=
User-Agent: Thunderbird for Android
In-Reply-To: <8376b311-a436-7cc6-b8eb-ffb15bc3349a@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-7-derekjohn.clark@gmail.com> <8376b311-a436-7cc6-b8eb-ffb15bc3349a@linux.intel.com>
Message-ID: <2841A281-592A-4DDF-8E6F-E068B8DF1543@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 24, 2026 1:05:06 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@=
linux=2Eintel=2Ecom> wrote:
>On Tue, 24 Feb 2026, Derek J=2E Clark wrote:
>
>> Add charge-type power supply extension for devices that support WMI bas=
ed
>> charge enable/disable=2E Lenovo Legion devices that implement function =
ID
>> and capdata 00 ID 0x03010001 are able to enable or disable charging
>> through the lenovo-wmi-other interface=2E The ideapad_laptop driver
>> conflicts with this if it can also provide the attribute, so we have to
>> get the acpi_handle and check for the same ACPI methods that enable the
>> feature in that driver=2E The ACPI method is more reliable from my test=
ing
>> when both are present, so there is no need to modify the ideapad_laptop
>> driver instead=2E
>>=20
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
>Align=2E
>
>> +};
>> +
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>>  #define LWMI_TYPE_ID_NONE 0x00
>>  #define LWMI_TYPE_ID_CROSSLOAD 0x01
>> +#define LWMI_TYPE_ID_PSU_AC 0x01
>> +#define LWMI_TYPE_ID_PSU_PD 0x02
>
>These should be aligned as well but that will impact more than this patch=
=20
>to avoid back and forth changes within the series=2E

I can start aligning them in the CPU attrs patch that adds crossload and k=
eep that spacing here since it's longer=2E

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
>
>IIRC, 0x should be included into the length of of the field, so perhaps=
=20
>%#10x for full u32 but it's long time ago I've used that formatting for=
=20
>anything so I might be wrong=2E

I got here after some trial and error, seems to print alright=2E

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
>
>Please don't declare variable mid-function (except cleanup=2Eh related=20
>variables which is why it had to be allowed so compiler won't anymore=20
>complain about it)=2E
>
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
>
>????
>
>Use semicolons to separate statements=2E
>
>And those tabs look odd too (not even aligning the lines), I'd prefer=20
>just using just normal single space as aligning with tabs will cause=20
>churn if adding new fields that need adjusting alignment of all the=20
>members=2E
>
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
>>=20
>

