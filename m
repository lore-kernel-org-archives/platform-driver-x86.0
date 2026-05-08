Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170B3ED124
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252914; cv=none; b=Vq0PIBlxLL8EudDtQ9buaSJxwrP9Zdp3Dtdz4Zua+Q0sizoZp6xpztEw0IqQRqLnQjCDJassWJaWUbQ6mddBbbLaJNUeaDupsWmavZ9uwaoaRnWDUUllA6UiiBsiv4Y/dgb8EUBle7q691cQuxtVF83ENY/frTVEoQuM/OEV0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252914; c=relaxed/simple;
	bh=w0CIcj8HVh97CHSNTq33Bhww4SBxGPL6ctasWXfXeU4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JMCaiDffP27+aLh/ProTZ1Tjr7fqewfCs3Q9ED5/uiORVGnjjUAMEB5WlOk2qx/CDenyn9adMIFiAcSFp+DKMIeG7u5xe9FgvhOTOONXctPFpeJHnitg8eMaKIos+pyTqAcOdyluTg00pu1CWcu8aB3v3d33vbeA3/RBJqCOkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW5ODRQD; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW5ODRQD"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2838609eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252911; x=1778857711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XY1ixbsfYYLOx6O8gMjDS4rNMSPxPNDRNaVYJxHxiz8=;
        b=nW5ODRQDHGdOGnHZx843A4r1L5qH97qUVStz56awUz71cLmhxlCUzhJp9L1OvY4R0W
         Kdv8u3ZdhF4Yokz6rTyWC/SkD9uspvNQzoKR+KD+0uHKHJeOQlDXXXHs8rTXplJuNF3e
         8th5FN02C0E64782f7VbkLyKmR+H5MDfpPh+DxKJnVMXo2KwPUD2PrWZPDpMlsjlEsGj
         mp24o/i65pt/9qTaFQFzqqtw6nOmkYW1buSznG0zdc0n4j+YmeWyYqFoCYhO5M5NKZ8U
         0iyScWuUkLZmO5CjZAY602h3kduSRYPK5pblrWkkeUvpFF7AfhnAsbZUlavk++kWX82c
         RuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252911; x=1778857711;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XY1ixbsfYYLOx6O8gMjDS4rNMSPxPNDRNaVYJxHxiz8=;
        b=BogZ0VNCGyKVuPZiQp10P5n0aR0j2LILgoDnFT4+7Otq+wqGTsrxFRhWONemfCS36r
         1XGZr3kYs0vOp4wtqdYnaSHevymqAdJvUPfFHSuHI+wrHSOYfpHja4sIeHg6+CS22Mh4
         cXevF3ucQF+0W8gq0MjwIVDlTb8aHpDdLyA/T+wyhJLZsoDFXeoxn8r5w2rIDBq9xeLi
         N5bYl2hqyFYZKZWqgj5f5UggUiaULOdBxe6pwcYxg1heespfR2NK31W3xxovNwbfcg+N
         s3IDKe6v9f7Kw3ev91H1eub2jVa/GsghiyeJn6XxTtgagIOytZsymJN92o9kp63l2tTT
         aX+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/+MxkHP7/aXP/DRO7aSY3ITdGgdOkHt+UVfIIfwn/Sh3az4IUXtosA6Cycd++B4QTRcepg3lO5pT1+Kqs0t8Is6/0k@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmgFVoTs002V+psvnHOPkz0LCLwNZvb6mwKaquxcc+Duo7UqF
	C+xTGKMZRnPwfBWWnCztSeW+ClLDkHOw9aH7XKUSMrXU7qCWgIl3qtE7
X-Gm-Gg: AeBDieuUPzdr+urauvftJSwhxNUb811jIJtRJT5dcnjpnpWfVRR/6BR8I7kxN9UKYF0
	6A7wzxWhZgOwKGtzUl02yjRZ32UG+G2qhMMZowGv4soDuwbISlrjbW6MRp2rAdKsauHCwDcVD3o
	3RQcP5hYViDW0FPzVgVyMAUgNzONrb81/Y7Blxyl+4V1UDYzIl1RQm2FW66kvTpLOxmt0agSKua
	3COIbjseck3g4X6/TP0KOYR68RhTchFRYQNWw+Yac5dNVKkfxqrGxTWXN/M0uuJCrcpJKuTG4pS
	QhfJjg6hClR2LXRJQ2Xtz3irhEtjcLbGWrbu4g3efvSm+BiYYj/fVoFfMMCUkmkev9CCtn3Ky0D
	xfF7U97RCPfolSlOyYLAEjKyNm5dxYnyqxRqK3/iEhXee79ydQUENC/t99u9fvcrkxvB0S3TrlL
	OKaYKSUjYkEl7F1EBWYChEhhEzN+6cUyoEJsYWnuelX6dI
X-Received: by 2002:a05:7022:6986:b0:128:d450:bc76 with SMTP id a92af1059eb24-1319cf558b9mr6156710c88.26.1778252911000;
        Fri, 08 May 2026 08:08:31 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1bc2:493c:ac39:c332:9a80:788a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ffb9sm3393881c88.2.2026.05.08.08.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 08:08:30 -0700 (PDT)
Date: Fri, 08 May 2026 08:08:29 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 =?ISO-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_13/15=5D_platform/x86=3A_lenovo?=
 =?US-ASCII?Q?-wmi-other=3A_Add_WMI_battery_charge_limiting?=
User-Agent: Thunderbird for Android
In-Reply-To: <9b51fdc2-5429-9fb8-830b-6e20fd27e3b2@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-14-derekjohn.clark@gmail.com> <9b51fdc2-5429-9fb8-830b-6e20fd27e3b2@linux.intel.com>
Message-ID: <A1CD0F5E-6675-4C97-B6B7-DE77817AC5C0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 8, 2026 7:52:45 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linux=
=2Eintel=2Ecom> wrote:
>On Thu, 7 May 2026, Derek J=2E Clark wrote:
>
>> Add charge_behaviour and charge_control_end_threshold attributes throug=
h
>> a power supply extension for devices that support WMI based charge enab=
le
>> & disable=2E
>>=20
>> Lenovo Legion devices that implement WMI function and capdata ID
>> 0x03010001 in their BIOS are able to enable or disable charging at 80%
>> through the lenovo-wmi-other interface=2E Add a charge_control_end_thre=
shold
>> attribute for BATX devices to expose this capability=2E The GET method =
for
>> this attribute is bugged=2E After analyzing the DSDT and some testing i=
t
>> appears the method grabs bit(3) instead of bit(4) from the EC register
>> that stores the current status, and will only report if charging has
>> been inhibited or not=2E To work around this, store and report the last
>> setting written to the attribute=2E
>>=20
>> Additionally, devices that support WMI function and capdata ID 0x030200=
00
>> are able to force discharge of the battery=2E Expose this capability wi=
th
>> a charge_behaviour attribute in the power supply extension, with the
>> AUTO and FORCE_DISCHARGE behaviors enabled=2E
>>=20
>> As some devices only expose one attribute or the other, a bitmask is
>> added with a lookup table and some helper macros to select the correct
>> configuration for the hardware at runtime=2E
>>=20
>> The ideapad_laptop driver provides the charge_type attribute to provide
>> similar functionality=2E When the WMI method is set this can corrupt th=
e
>> ACPI method return and cause hardware and driver errors=2E To avoid
>> conflicts between the drivers, we get the acpi_handle and do the same
>> check that ideapad_laptop does when it enables the feature=2E If the
>> feature is supported in ideapad_laptop, abort adding the extension from
>> lenovo-wmi-other=2E The ACPI method is more reliable when both are
>> present, from my testing, so we can prefer that implementation and do
>> not need to worry about de-conflicting from inside that driver=2E A new
>> module parameter, force_load_psy_ext, is provided to bypass this ACPI
>> check, as well as feature supported checks, if desired=2E
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v11:
>>   - Refactor to use charge_behaviour and charge_control_end_threshold,
>>     per the class documentation=2E The ideapad_laptop driver will be fi=
xed
>>     in a separate patch series=2E
>>   - Due to the extensive refactoring, I have removed the reviewed-by
>>     tags from Rong and Mark to allow them to recertify the code in its
>>     current state=2E
>> v7:
>>   - Use devm_battery_hook_register, manually unregister during unbind=
=2E
>> v6:
>>   - Check feature flags to determine if the extension should be loaded
>>     and if it is writable=2E
>>   - Zero initialize wmi_method_args_32=2E
>>   - Fix formatting=2E
>> v5:
>>   - Use switch statement instead of if for battery charge state set/get=
=2E
>>   - use force_load_psy_ext to skip all ACPI interactions=2E
>>   - Various formatting fixes=2E
>> v4:
>>   - Remove unused defines=2E
>>   - Disambiguate charging defines by renaming them to be more consisten=
t
>>     with the kernel modes they represent=2E
>>   - Add module parameter to ignore ACPI checks=2E
>>   - Don't fail if the ACPI handle isn't found, skip the ACPI check
>>     instead=2E
>> ---
>>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh |   1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec   | 401 ++++++++++++++++++++=
++
>>  3 files changed, 403 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
>> index 09b1b055d2e0=2E=2Eb9a5d18caa1e 100644
>> --- a/drivers/platform/x86/lenovo/Kconfig
>> +++ b/drivers/platform/x86/lenovo/Kconfig
>> @@ -262,6 +262,7 @@ config LENOVO_WMI_GAMEZONE
>>  config LENOVO_WMI_TUNING
>>  	tristate "Lenovo Other Mode WMI Driver"
>>  	depends on ACPI_WMI
>> +	depends on ACPI_BATTERY
>>  	select HWMON
>>  	select FW_ATTR_CLASS
>>  	select LENOVO_WMI_CAPDATA
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index 891b12ca1db6=2E=2Ee0a30f2c0c87 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -21,6 +21,7 @@
>>  enum lwmi_device_id {
>>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>>  	LWMI_DEVICE_ID_GPU =3D 0x02,
>> +	LWMI_DEVICE_ID_PSU =3D 0x03,
>>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>>  };
>> =20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index fb301c54d26d=2E=2E4939a71e8fca 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -41,9 +41,12 @@
>>  #include <linux/limits=2Eh>
>>  #include <linux/module=2Eh>
>>  #include <linux/platform_profile=2Eh>
>> +#include <linux/power_supply=2Eh>
>>  #include <linux/types=2Eh>
>>  #include <linux/wmi=2Eh>
>> =20
>> +#include <acpi/battery=2Eh>
>> +
>>  #include "wmi-capdata=2Eh"
>>  #include "wmi-events=2Eh"
>>  #include "wmi-helpers=2Eh"
>> @@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
>>  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>>  };
>> =20
>> +enum lwmi_feature_id_psu {
>> +	LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD =3D	0x01,
>> +	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR =3D		0x02,
>> +};
>> +
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
>> +#define LWMI_TYPE_ID_PSU_AC	0x01
>> =20
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> @@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> +#define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
>> +#define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
>> +#define LWMI_CHARGE_END_100		0x00
>> +#define LWMI_CHARGE_END_80		0x01
>> +
>>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
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
>> @@ -131,6 +149,11 @@ struct lwmi_om_priv {
>>  		bool capdata00_collected : 1;
>>  		bool capdata_fan_collected : 1;
>>  	} fan_flags;
>> +
>> +	enum power_supply_charge_behaviour charge_behaviour;
>> +	const struct power_supply_ext *battery_ext;
>> +	struct acpi_battery_hook battery_hook;
>> +	bool bh_registered;
>>  };
>> =20
>>  /*
>> @@ -555,6 +578,381 @@ static void lwmi_om_fan_info_collect_cd_fan(struc=
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
>> + * @ext_data: Pointer to the lwmi_om_priv drvdata
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
>> +	struct wmi_method_args_32 args =3D {};
>> +	u32 retval;
>> +	int ret;
>> +
>> +	switch (prop) {
>> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>> +		/* Reading from BIOS reads the wrong bit=2E Use cached value */
>> +		val->intval =3D priv->charge_behaviour;
>> +		return 0;
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +		args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRE=
SHOLD,
>> +					     LWMI_TYPE_ID_PSU_AC);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>> +				    (unsigned char *)&args, sizeof(args),
>> +				    &retval);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\n", =
retval, prop);
>> +
>> +	switch (retval) {
>> +	case LWMI_CHARGE_END_80:
>> +		val->intval =3D 80;
>> +		break;
>> +	case LWMI_CHARGE_END_100:
>> +		val->intval =3D 100;
>> +		break;
>> +	default:
>> +		dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n", r=
etval);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
>> + * @ps: The battery that was extended
>> + * @ext: The extension
>> + * @ext_data: Pointer to the lwmi_om_priv drvdata
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
>> +	struct wmi_method_args_32 args =3D {};
>> +
>> +	switch (prop) {
>> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>> +		args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR=
,
>> +					     LWMI_TYPE_ID_NONE);
>> +		switch (val->intval) {
>> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
>> +			args=2Earg1 =3D LWMI_CHARGE_BEHAVIOR_AUTO;
>> +			break;
>> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
>> +			args=2Earg1 =3D LWMI_CHARGE_BEHAVIOR_DISCHARGE;
>> +			break;
>> +		default:
>> +			dev_err(&priv->wdev->dev, "Got invalid charge behavior value: %#x\n=
",
>> +				val->intval);
>> +			return -EINVAL;
>> +		}
>> +		priv->charge_behaviour =3D val->intval;
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +		args=2Earg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THRE=
SHOLD,
>> +					     LWMI_TYPE_ID_PSU_AC);
>> +		switch (val->intval) {
>> +		case 0 =2E=2E=2E 80:
>> +			args=2Earg1 =3D LWMI_CHARGE_END_80;
>> +			break;
>> +		case 81 =2E=2E=2E 100:
>> +			args=2Earg1 =3D LWMI_CHARGE_END_100;
>> +			break;
>> +		default:
>> +			dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n",
>> +				val->intval);
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x =
to %#x\n",
>> +		args=2Earg0, prop, args=2Earg1);
>> +
>> +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
>> +				     (unsigned char *)&args, sizeof(args), NULL);
>
>unsigned char * is for real "text", u8 * is the correct type for anything=
=20
>that is binary data=2E
>
>I've apparently missed it earlier and you don't necessarily need to fix=
=20
>this in the context of this series (I'd prefer to finally be able to move=
=20
>on from this series) but the distinction between two types is good to kee=
p=20
>in mind=2E
>
>> +}
>> +
>> +/**
>> + * lwmi_psy_prop_is_suppported() - Determine if the property is suppor=
ted
>> + * @priv: Pointer to the lwmi_om_priv drvdata
>> + * @prop: The power supply property to be evaluated
>> + *
>> + * Checks capdata 00 to determine if the property is supported=2E
>> + *
>> + * Return: true if readable, or false
>> + */
>> +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum=
 power_supply_property prop)
>> +{
>> +	struct capdata00 capdata;
>> +	u32 attribute_id;
>> +	int ret;
>> +
>> +	switch (prop) {
>> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIO=
R,
>> +						LWMI_TYPE_ID_NONE);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THR=
ESHOLD,
>> +						LWMI_TYPE_ID_PSU_AC);
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return false;
>> +
>> +	dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) support le=
vel: %#x\n",
>> +		attribute_id, capdata=2Esupported);
>> +
>> +	return ((capdata=2Esupported & LWMI_SUPP_VALID) && (capdata=2Esupport=
ed & LWMI_SUPP_GET));
>
>The outer parenthesis seem unnecessary=2E
>
>> +}
>> +
>> +/**
>> + * lwmi_psy_prop_is_writeable() - Determine if the property is writeab=
le
>> + * @ps: The battery that was extended
>> + * @ext: The extension
>> + * @ext_data: Pointer the lwmi_om_priv drvdata
>> + * @prop: The property to check
>> + *
>> + * Checks capdata 00 to determine if the property is writable=2E
>> + *
>> + * Return: true if writable, or false
>> + */
>> +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
>> +				      const struct power_supply_ext *ext,
>> +				      void *ext_data,
>> +				      enum power_supply_property prop)
>> +{
>> +	struct lwmi_om_priv *priv =3D ext_data;
>> +	struct capdata00 capdata;
>> +	u32 attribute_id;
>> +	int ret;
>> +
>> +	switch (prop) {
>> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIO=
R,
>> +						LWMI_TYPE_ID_NONE);
>> +		break;
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +		attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_THR=
ESHOLD,
>> +						LWMI_TYPE_ID_PSU_AC);
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return false;
>> +
>> +	return !!(capdata=2Esupported & LWMI_SUPP_SET);
>> +}
>> +
>> +static const enum power_supply_property lwmi_psy_ext_props_all[] =3D {
>> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
>> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +};
>> +
>> +static const enum power_supply_property lwmi_psy_ext_props_threshold[]=
 =3D {
>> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +};
>> +
>> +static const enum power_supply_property lwmi_psy_ext_props_behaviour[]=
 =3D {
>> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
>> +};
>> +
>> +#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours)=
	\
>> +	static const struct power_supply_ext _name =3D {			\
>> +		=2Ename			=3D LWMI_OM_SYSFS_NAME,		\
>> +		=2Eproperties		=3D _props,			\
>> +		=2Enum_properties		=3D ARRAY_SIZE(_props),		\
>> +		=2Echarge_behaviours	=3D _behaviours,			\
>> +		=2Eget_property		=3D lwmi_psy_ext_get_prop,	\
>> +		=2Eset_property		=3D lwmi_psy_ext_set_prop,	\
>> +		=2Eproperty_is_writeable	=3D lwmi_psy_prop_is_writeable,	\
>> +	}
>> +
>> +#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO=
) | \
>> +				BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE))
>> +
>> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_prop=
s_all,
>> +				   LWMI_CHARGE_BEHAVIOURS);
>> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_threshold,
>> +				   lwmi_psy_ext_props_threshold, 0);
>> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour,
>> +				   lwmi_psy_ext_props_behaviour,
>> +				   LWMI_CHARGE_BEHAVIOURS);
>> +
>> +#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
>> +#define LWMI_PSY_PROP_THRESHOLD BIT(1)
>> +
>> +static const struct power_supply_ext *lwmi_psy_exts[] =3D {
>> +	[LWMI_PSY_PROP_BEHAVIOUR] =3D				&lwmi_psy_ext_behaviour,
>> +	[LWMI_PSY_PROP_THRESHOLD] =3D				&lwmi_psy_ext_threshold,
>> +	[LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD] =3D	&lwmi_psy_ext=
_all,
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
>> +	return power_supply_register_extension(battery, priv->battery_ext, &p=
riv->wdev->dev, priv);
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
>> +	struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_priv,=
 battery_hook);
>> +
>> +	power_supply_unregister_extension(battery, priv->battery_ext);
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
>
>What is the usecase for this parameter from ordinary user's perspective?
>

It would mostly be for advanced users to test hardware support/behavior if=
 either the capdata is malformed while the functions are usable, or if the =
ideapad_laptop implementation wasn't working on a specific BIOS=2E

Thinking further, it should probably also cause is_writable to return true=
 always when set (assuming you want to keep it)=2E

>Usually module params are near the top of file (it seems that only a very=
=20
>few drivers have one midfile, some had it near the end)=2E
>

I can move it to live with the rest of the params=2E They appeared to be n=
ext to the implementation functions for hwmon, soni followed that pattern=
=2E

- Derek
>--
> i=2E
>
>> +
>> +/**
>> + * lwmi_om_psy_ext_init() - Hooks power supply extension to device bat=
tery
>> + * @priv: Pointer to the lwmi_om_priv drvdata=2E
>> + *
>> + * Checks if the ideapad_laptop driver is going to manage charge attri=
butes first,
>> + * then if not, hooks the battery to our WMI methods if they are suppo=
rted=2E
>> + */
>> +static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
>> +{
>> +	static const char * const ideapad_hid =3D "VPC2004";
>> +	acpi_handle handle =3D NULL;
>> +	unsigned int props =3D 0;
>> +	int ret;
>> +
>> +	priv->bh_registered =3D false;
>> +
>> +	/* Deconflict ideapad_laptop driver */
>> +	if (force_load_psy_ext) {
>> +		props =3D LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD;
>> +		goto load_psy_ext;
>> +	}
>> +
>> +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL)=
;
>> +	if (ret)
>> +		return;
>> +
>> +	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(hand=
le, "SBMC")) {
>> +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for=
 device\n");
>> +		return;
>> +	}
>> +
>> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIO=
UR))
>> +		props |=3D LWMI_PSY_PROP_BEHAVIOUR;
>> +	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_CONTROL=
_END_THRESHOLD))
>> +		props |=3D LWMI_PSY_PROP_THRESHOLD;
>> +	if (!props)
>> +		return;
>> +
>> +load_psy_ext:
>> +	/* Add battery hooks */
>> +	priv->battery_ext =3D lwmi_psy_exts[props];
>> +	priv->battery_hook=2Eadd_battery =3D lwmi_add_battery;
>> +	priv->battery_hook=2Eremove_battery =3D lwmi_remove_battery;
>> +	priv->battery_hook=2Ename =3D "Lenovo WMI Other Battery Extension";
>> +	priv->bh_registered =3D true;
>> +
>> +	battery_hook_register(&priv->battery_hook);
>> +}
>> +
>> +/**
>> + * lwmi_om_psy_remove() - Unregister battery hook
>> + * @priv: Driver private data
>> + *
>> + * Unregisters the battery hook if applicable=2E
>> + */
>> +static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
>> +{
>> +	if (!priv->bh_registered)
>> +		return;
>> +
>> +	battery_hook_unregister(&priv->battery_hook);
>> +	priv->bh_registered =3D false;
>> +}
>> +
>>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capda=
ta 01) =3D=3D=3D=3D=3D=3D=3D=3D */
>> =20
>>  struct tunable_attr_01 {
>> @@ -1235,6 +1633,7 @@ static int lwmi_om_master_bind(struct device *dev=
)
>>  	}
>> =20
>>  	lwmi_om_fan_info_collect_cd00(priv);
>> +	lwmi_om_psy_ext_init(priv);
>> =20
>>  	lwmi_om_fw_attr_add(priv);
>> =20
>> @@ -1257,6 +1656,8 @@ static void lwmi_om_master_unbind(struct device *=
dev)
>> =20
>>  	lwmi_om_hwmon_remove(priv);
>> =20
>> +	lwmi_om_psy_remove(priv);
>> +
>>  	component_unbind_all(dev, NULL);
>>  }
>> =20
>>=20

