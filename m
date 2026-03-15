Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AF07080D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773546758; cv=none; b=HS9JiWuaFLGjNKqvfuEUs7VPS019j7GO4OuKpKau0UGlq8xglE7eErBiW7Kw7JMQaI+vdmwsouwPR3eDwWzGkpjK2NeNPUCR7D7VbFVbF/NFoLZO3MJdMdYmoqPLnLfEHe3Xl6QzMdscndWZdih5LSXRybV7+0Q6O+v7mg/RUZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773546758; c=relaxed/simple;
	bh=Sz7XZ7CkW+GdIKJHPZbj9p1tW3DtdxY8NhkDhWrH5RI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=foLdsck/5Fi8rDEtnEOTR5dEa+4REjtkf2WbN9GzDQnkeLjllXAG3K/3zIL8XhmhMJb3UOhsAt19nC34vm6xHW+lJZR/OJUMs4VI9CwqiePnTnsmAEwVFUzhSb3Ouhy6dVsyedCoeO3KQ5914E+Gt9LwsGEeCXVtkVSOU7tpB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5lbyoJZ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5lbyoJZ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2beab594d8eso3941743eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 20:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773546756; x=1774151556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/DSYQUJNZGRYhOTe7D1R5yd/3eGCA8HFq/TJjVAa25w=;
        b=O5lbyoJZ45xYRuu4msh303mYXOcPm/b1mzrPB9y7XNcOGC71qNpo4YlRP+Nx/v1/t8
         F5ywt+U9YO9S0zYu8w+eP2DHIBPRDW/BZ3xIhPx/q1ix8DFYjy8eGq//AROBCsSeeRXI
         KkbDLP6cVrgF5b6yketT6sTkRVuE+o8MYlD46donhI7MiEngFL+668aT/QOU4MFGaAUz
         XMNBjumwXVKPtOfb4dL4BHanrXU8VjX27qQMO7HSPRvkGPWbT6zAnZh85FdYIzX//mD+
         NFKCINYTq5vXd1b1SRyabNFYL1cQfU9rg2qH29xOqeACaqPLh7GbQ8wEKYcDfcX+b4+q
         dQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773546756; x=1774151556;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DSYQUJNZGRYhOTe7D1R5yd/3eGCA8HFq/TJjVAa25w=;
        b=oIq+zoLtolevHTQBPsToeKHM7t/mqugr2C3KAu9MILpIstqQFxzZqHyDoJw8h2IOY4
         +PoFg2C8gsB5a9HXhfpwA5KhmZDL83zoRl9k2vP3ASeqxV7QqijrcgusakJ1QiniJdgK
         11HUIM6GTDphONmXo2aQG8WLhFbZAkc8xBZ6pt37/XimVIat99E6XQzb0WyYiuNl4y1P
         t0WtGfV0RSdxchY4p7egAGl6tqwx/GQIG0MLyJ041iQnFfkefo0YLV9kCc3KKh7B3UMA
         MC3gR0PJsGBaifBbWUK3PyL9s5NfyH9XsSu2pWPT/UI4Iudr8J9NfoSsaUDyxnHCDnEe
         sjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs9mFu1e2rQpE5GpiAWxnZRSC5g4P44FDa7i2Ohcn6cIh09EPchBA0ZjXiHtDvGDzcKw8esIPLAM1fV77y64SacRmL@vger.kernel.org
X-Gm-Message-State: AOJu0YxXyRjuF3R3dmEa2Uf6X491Yl8trlw/yiIJUpkO3lC31rTg+QWj
	H5nXu+rtppZwcLzcgdymqtTd2Kz0exAusbWKxD4VzXQQ/KrNo0YxIQCk
X-Gm-Gg: ATEYQzzqvv7yoj3T/7tigwpnWoFFuY02uesV/cpp/WtZuzf2wWz07z/hMu64nv+4ezD
	iJed5pKPoV7ztGNCDJEtEx3ApQdGwmhWWeFPMXMwl7z4GfqDJC1DglOXz0qHpphc+482pxHTtvo
	zNMGSvVY3qs6GfKL8Zmt0FV/165hWuUUHIlFGZUOsWQ/gsTIyvbkCbSI/QZQZF3xcrY4+EZFs/5
	3PpTBCEASGYs1OZh6G9xMWfDSkGtcg+Ax6BO2V0BznuiOiBlGW77jiBIvErkhMdSw51hT9yle6m
	94qb34cXMsbi9I6ynWJrH75+57OOhItzPmUpC402zzEDbZZvikeoJKggRNUf4Ugckm2WFB2drKc
	9iyV0vaHuhAlpMICDrJ0lm0MZI5/2WxZ1Q/JOzTLsO56SKw19wML6c1pkKrjDIwembaVpnLrXtF
	OgPLMIZqUvu2fnUTIDN7Gv5NNlI9FKPpzXOnYw91NKB8Fb3xrLeYXT04cQtGfNzVGwTWyedob8p
	j5Err+E2pBywykOLlmCkQ==
X-Received: by 2002:a05:7300:fd0b:b0:2be:e8d:a34 with SMTP id 5a478bee46e88-2bea54c26fdmr4185165eec.17.1773546755617;
        Sat, 14 Mar 2026 20:52:35 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab57b2b2sm8887281eec.33.2026.03.14.20.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 20:52:35 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:52:35 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_8/8=5D_platform/x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Add_WMI_battery_charge_limiting?=
User-Agent: Thunderbird for Android
In-Reply-To: <df37fc895fab7702bcf0cfd0db6c65eb6cb3b2e3.camel@rong.moe>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com> <20260312031032.3467565-9-derekjohn.clark@gmail.com> <df37fc895fab7702bcf0cfd0db6c65eb6cb3b2e3.camel@rong.moe>
Message-ID: <B2D22F6E-672C-46F5-B264-AC70C6DD26A4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 14, 2026 7:00:20 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Thu, 2026-03-12 at 03:10 +0000, Derek J=2E Clark wrote:
>> Add charge-type power supply extension for devices that support WMI bas=
ed
>> charge enable/disable=2E
>>=20
>> Lenovo Legion devices that implement WMI function and capdata ID
>> 0x03010001 in their BIOS are able to enable or disable charging at 80%
>> through the lenovo-wmi-other interface=2E Add a charge_type power suppl=
y
>> extension to expose this capability to the sysfs=2E
>>=20
>> The ideapad_laptop driver can also provide the charge_type attribute=2E=
 To
>> avoid conflicts between the drivers, get the acpi_handle and do the sam=
e
>> check that ideapad_laptop does when it enables the feature=2E If the
>> feature is supported in ideapad_laptop, abort adding the extension from
>> lenovo-wmi-other=2E The ACPI method is more reliable when both are
>> present, from my testing, so we can prefer that implementation and do
>> not need to worry about de-conflicting from inside that driver=2E A new
>> module parameter, force_load_psy_ext, is provided to bypass this ACPI
>> check, if desired=2E
>>=20
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v4:
>>   - Remove unused defines=2E
>>   - Disambiguate charging defines by renaming them to be more consisten=
t
>>     with the kernel modes they represent=2E
>>   - Add module parameter to ignore ACPI checks=2E
>>   - Don't fail if the ACPI handle isn't found, skip the ACPI check
>>     instead=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh |   1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec   | 234 ++++++++++++++++++++=
+-
>>  2 files changed, 234 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index 196481b1ce17=2E=2Ecc0d1c176c2f 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -20,6 +20,7 @@
>>  enum lwmi_device_id {
>>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>>  	LWMI_DEVICE_ID_GPU =3D 0x02,
>> +	LWMI_DEVICE_ID_PSU =3D 0x03,
>>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>>  };
>> =20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 61ac9bee352f=2E=2Ecab9ae6bd811 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -43,9 +43,12 @@
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
>> @@ -79,10 +82,12 @@ enum lwmi_feature_id_gpu {
>>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>>  };
>> =20
>> -#define LWMI_FEATURE_ID_FAN_RPM 0x03
>> +#define LWMI_FEATURE_ID_FAN_RPM		0x03
>> +#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
>> =20
>>  #define LWMI_TYPE_ID_NONE	0x00
>>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
>> +#define LWMI_TYPE_ID_PSU_AC	0x01
>> =20
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> @@ -93,6 +98,9 @@ enum lwmi_feature_id_gpu {
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> +#define LWMI_CHARGE_TYPE_STANDARD	0x00
>> +#define LWMI_CHARGE_TYPE_LONGLIFE	0x01
>> +
>>  /**
>>   * lwmi_attr_id() - Formats a capability data attribute ID
>>   * @dev_id: The u8 corresponding to the device ID=2E
>> @@ -114,6 +122,10 @@ static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 =
mode_id, u8 type_id)
>>  	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>> +#define LWMI_ATTR_ID_PSU(feat, type)			\
>> +	lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,		\
>> +		     LWMI_GZ_THERMAL_MODE_NONE, type)
>> +
>>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> =20
>> @@ -155,6 +167,8 @@ struct lwmi_om_priv {
>>  		bool capdata00_collected : 1;
>>  		bool capdata_fan_collected : 1;
>>  	} fan_flags;
>> +
>> +	struct acpi_battery_hook battery_hook;
>>  };
>> =20
>>  /*
>> @@ -579,6 +593,223 @@ static void lwmi_om_fan_info_collect_cd_fan(struc=
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
>> +	args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWM=
I_TYPE_ID_PSU_AC);
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
>
>%#x
>
>> +
>> +	if (retval =3D=3D LWMI_CHARGE_TYPE_LONGLIFE)
>> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
>> +	else
>> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>
>I'd suggest using a switch statement here with a default path to
>dev_err() unexpected retval=2E
>

I'll give it a shot=2E I recall there being some unexplained issues when I=
 tried that originally, though I can't recall the specifics other than it s=
eemed to trigger false negative outcomes for some reason=2E I'll let you kn=
ow if I run into it again with more details so we can agree on a way forwar=
d if it becomes a problem=2E

Thanks again,
- Derek

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
>> +	args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWM=
I_TYPE_ID_PSU_AC);
>> +	if (val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
>> +		args=2Earg1 =3D LWMI_CHARGE_TYPE_LONGLIFE;
>> +	else
>> +		args=2Earg1 =3D LWMI_CHARGE_TYPE_STANDARD;
>
>Ditto=2E
>
>> +
>> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x to=
 %x\n",
>
>%#010x and %#x
>
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
>> +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE=
, LWMI_TYPE_ID_PSU_AC);
>> +	int ret;
>> +
>> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return false;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support level:=
 %x\n",
>
>Ditto=2E
>
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
>
>Update Kconfig with `depends on ACPI_BATTERY' like other drivers did=2E
>
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
>> +	acpi_handle *ahand =3D context;
>> +
>> +	if (!handle)
>> +		return AE_OK;
>> +
>> +	*ahand =3D handle;
>> +
>> +	return AE_CTRL_TERMINATE;
>> +}
>> +
>> +static bool force_load_psy_ext;
>> +module_param(force_load_psy_ext, bool, 0444);
>> +MODULE_PARM_DESC(force_load_psy_ext,
>> +	"This option will skip checking if the ideapad_laptop driver will con=
flict "
>> +	"with adding an extension to set the battery charge type=2E It is rec=
ommended "
>> +	"to blacklist the ideapad driver before using this option=2E");
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
>
>Skip it in the force_load_psy_ext=3DY case=2E=20
>
>> +	if (ret)
>> +		return;
>> +
>> +	if (handle && !force_load_psy_ext) {
>> +		if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC=
")) {
>
>Connect them with `&&' to prevent unnecessary indents and=2E=2E=2E
>
>> +			dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery fo=
r device=2E\n");
>
>=2E=2E=2Eline length exceeding 100=2E
>
>Thanks,
>Rong
>
>> +			return;
>> +		}
>> +	}
>> +
>> +	/* Add battery hooks */
>> +	priv->battery_hook=2Eadd_battery =3D lwmi_add_battery;
>> +	priv->battery_hook=2Eremove_battery =3D lwmi_remove_battery;
>> +	priv->battery_hook=2Ename =3D "Lenovo WMI Other Battery Extension";
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
>> @@ -1334,6 +1565,7 @@ static int lwmi_om_master_bind(struct device *dev=
)
>>  		return -ENODEV;
>> =20
>>  	lwmi_om_fan_info_collect_cd00(priv);
>> +	lwmi_om_ps_ext_init(priv);
>> =20
>>  	return lwmi_om_fw_attr_add(priv);
>>  }

