Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3835AC16
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775689411; cv=none; b=NpOynbPQRCyc+yy1qnRgxEeAtkJCxLn6lvK+8OMky/rKGhLmRYYhbI/c3N4uxnaN4F1CSYjmLktY4oMCDyQw/wARF5aoB+uAsNk/IFQe5Ry4HpGtZ2AsgMNYQsoNRhw/qcwvJmVZQlKfASKZudQ/VLzkvvk5K6VWYNblFABBQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775689411; c=relaxed/simple;
	bh=R4TkwF9yZgzRZRN9sJCi2CrYPzg/Wkn2JZ6InejqBNI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TKW7NpJgCkXCT4/EDvKQ1RwVB9ID1F271hvBEuDYpMjtlfU3GEW0oxMyytsQ7/m3YQ+FLHEEdxvEUeucooXjWqJGoSP0LJwN80lmTsQwlAil6SQU9gMwcsarPYH+n5DWlqkFeDRff8qp9c0IMkU37CgTAp6B4U5i9fqLGm4LiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQo5FIKs; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQo5FIKs"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c15414820so81644c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775689409; x=1776294209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=63/KvCSvbI3PSLxRwrmLKFIpq8cQmq02Uouqsb5SeG0=;
        b=sQo5FIKsjb7LBPbYDrxiKP55yv7KjTheinYe8HCDaIWrE/9zKEZDMSuwH5v7+V6OWY
         1XZkCUczwQtwosYCLGbauTAQRrvTXgyY4lJVNyORQ+OSEoxroIdujSiGDKG0EnoVrfF6
         nDUdhvUy+ru3gtwTJpbXELZWhl6vzO2cDoofWbqhlMAnLKAXfbf++puOPFd6osHosL/3
         EVhbukmTEnB7ms8eUjMbUtRhagUjt/xFtBOAQCSYAsR9Sqd6EUiMTnvwaz6TWTHhsJx8
         2V1brW2Xx8SSQQqmzgOtDG6EgPfa5DekhTGtaAoAYN7V5l1Hdkq6DhBKDum/IqIueYOK
         hIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775689409; x=1776294209;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63/KvCSvbI3PSLxRwrmLKFIpq8cQmq02Uouqsb5SeG0=;
        b=rTOG7/CJoekNOAHsBdFeu/GBjhQ0PqgbCeJgYQyX75jZcqTSVTfRRGy/uTVy4Cb078
         2TTQu6O7bHiWTBAkwLIKfc3Aooh3pHTq/jyt0/maNiwQbbGxC5O0o9NGfZNC4nix+I0I
         fTLfcZ5L7ceI1IQKZujDJaVjB2sHExPt4E6d9Z4TIKTU7QqI0+A6Etfph2iSpaqliXOi
         8e5DqF5lRxgbBPZWnVWlh8y4HVtltnb3jV5UFd+YJtdEw+dFCvbH3+fuxHzS2L2w/dfz
         +s88KK4cHzotfnPNl8cRx0rMoNnnXFcVRGVZToNWTGAhY6QqmOj4pWo3U2TDHfUSmdhu
         xg9g==
X-Forwarded-Encrypted: i=1; AJvYcCXCFdnWfg18Lz/HCP7DcA4qcakQ58RBMBbORW8mlqs3gMbM5cvyA7aCHOj23O0WbSDIM3rS2q5bEm7fokJRkLFR46Zk@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbW+xiERI+uVkTvZqrVtXXt1Iy+f5L0o/oBdWsM6JjRXMc3XI
	0Xezdio3tqVh+mZ0LwDhxx55ZmsU5RD7w8vqXmcvXdd1h8Dtqpi+Jz75
X-Gm-Gg: AeBDietdLiCtq/cJ9bBJZNZSlHbkd+CGaX9ca67rj6qUyH3ltfcPmPVhz/NXYHmwqJm
	x5jAvh7JA1p8B0/k9fy5HkXtc1G7Zs80Y2OuzkTFDC6sBosFazz2SyMV3wj/7emee0/prrpSzkw
	0QOm48vCXO4/FCJTAcrOBgZAXartjj/hBp/8VmiMYCf0HZkMBl7iZSGtkFvJQuDy9emDOuJs5xC
	JctS7y8W+17etopiFavG0AeuwiPM003EXsbDwqXpsSPE7P9FfuI8la886QhLC3bzoVDwZOcpwA+
	Ck3dd8EPckhFd0hhLKu/vhtvLO39moiRay73ig/siyn7B0xmdUdgITyrLAxephI85/ITepwuq4c
	qp/jqoXZ1b3KCdB1peEDLY8V4jsDcPp4fJP7d2tWz6Ky1PsAg+bLRPGG9wxz/w9mJfFS3y2q0VH
	531kJ0vA46BEWl2SyLgkzBgLILuHl5H5UMVL4FCoNVkiFS6dx7Et/ofV2nO2QCN5FxMNTI9QPm1
	BtGg+xgRxk6MlaIkOmG5Q==
X-Received: by 2002:a05:7022:68a2:b0:12b:ebf6:a3bc with SMTP id a92af1059eb24-12c28bfb92dmr551977c88.3.1775689408409;
        Wed, 08 Apr 2026 16:03:28 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm26685836c88.10.2026.04.08.16.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 16:03:28 -0700 (PDT)
Date: Wed, 08 Apr 2026 16:03:26 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_10/16=5D_platform/x86=3A_lenov?=
 =?US-ASCII?Q?o-wmi-other=3A_Add_lwmi=5Fattr=5Fid=28=29_function?=
User-Agent: Thunderbird for Android
In-Reply-To: <672641d5618e117600ec423e2e5910f63bad0369.camel@rong.moe>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com> <20260406201400.438221-11-derekjohn.clark@gmail.com> <672641d5618e117600ec423e2e5910f63bad0369.camel@rong.moe>
Message-ID: <FCBA1EEF-2F2A-4691-994E-320E37E7104F@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 8, 2026 8:48:21 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Mon, 2026-04-06 at 20:13 +0000, Derek J=2E Clark wrote:
>> Adds lwmi_attr_id() function=2E In the same vein as LWMI_ATTR_ID_FAN_RP=
M(),
>> but as a generic, to de-duplicate attribute_id assignment biolerplate=
=2E
>>=20
>> Reviewed-by: Rong Zhang <i@rong=2Emoe>
>> Tested-by: Rong Zhang <i@rong=2Emoe>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v7:
>>   - Incorporate additional replacements in lwmi_attr_01_is_supported
>>     after moving the patch that adds it to earlier in the series=2E
>> v6:
>>   - Move lwmi_attr_id to wmi-capdata=2Eh as static inline=2E
>> v5:
>>   - Move references to cv/cd_mode_id to patch 4/8=2E
>>   - Move lwmi_attr_id to wmi-capdata=2Ec and export with namespace=2E
>> v4:
>>   - Switch from macro to static inline to preserve types=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Ec |  8 ++--
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh | 20 ++++++++
>>  drivers/platform/x86/lenovo/wmi-other=2Ec   | 56 ++++++++-------------=
--
>>  3 files changed, 43 insertions(+), 41 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Ec
>> index ee1fb02d8e31=2E=2E169665be4dcf 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> @@ -27,7 +27,6 @@
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> =20
>>  #include <linux/acpi=2Eh>
>> -#include <linux/bitfield=2Eh>
>>  #include <linux/bug=2Eh>
>>  #include <linux/cleanup=2Eh>
>>  #include <linux/component=2Eh>
>> @@ -48,6 +47,7 @@
>>  #include <linux/wmi=2Eh>
>> =20
>>  #include "wmi-capdata=2Eh"
>> +#include "wmi-helpers=2Eh"
>> =20
>>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5=
BB300E"
>>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
>> @@ -58,9 +58,9 @@
>> =20
>>  #define LWMI_FEATURE_ID_FAN_TEST 0x05
>> =20
>> -#define LWMI_ATTR_ID_FAN_TEST							\
>> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
>> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
>> +#define LWMI_ATTR_ID_FAN_TEST                                      \
>> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
>> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
>> =20
>>  enum lwmi_cd_type {
>>  	LENOVO_CAPABILITY_DATA_00,
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index 8c1df3efcc55=2E=2E1388eaf4ab4a 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -6,6 +6,7 @@
>>  #define _LENOVO_WMI_CAPDATA_H_
>> =20
>>  #include <linux/bits=2Eh>
>> +#include <linux/bitfield=2Eh>
>>  #include <linux/types=2Eh>
>> =20
>>  #define LWMI_SUPP_VALID		BIT(0)
>> @@ -19,6 +20,8 @@
>> =20
>>  #define LWMI_DEVICE_ID_FAN	0x04
>> =20
>> +#define LWMI_TYPE_ID_NONE 0x00
>> +
>>  struct component_match;
>>  struct device;
>>  struct cd_list;
>> @@ -57,6 +60,23 @@ struct lwmi_cd_binder {
>>  	cd_list_cb_t cd_fan_list_cb;
>>  };
>> =20
>> +/**
>> + * lwmi_attr_id() - Formats a capability data attribute ID
>> + * @dev_id: The u8 corresponding to the device ID=2E
>> + * @feat_id: The u8 corresponding to the feature ID on the device=2E
>> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get=
=2E
>> + * @type_id: The u8 corresponding to the sub-device=2E
>> + *
>> + * Return: u32=2E
>> + */
>> +static inline u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 t=
ype_id)
>> +{
>> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
>> +}
>> +
>>  void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
>>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata00 *output);
>>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output);
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 25ddfd54f692=2E=2E19a072bea2d4 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -27,7 +27,6 @@
>>   */
>> =20
>>  #include <linux/acpi=2Eh>
>> -#include <linux/bitfield=2Eh>
>>  #include <linux/cleanup=2Eh>
>>  #include <linux/component=2Eh>
>>  #include <linux/container_of=2Eh>
>> @@ -59,8 +58,6 @@
>> =20
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>> -#define LWMI_TYPE_ID_NONE 0x00
>> -
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> =20
>> @@ -70,10 +67,9 @@
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
>> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
>> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
>> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
>> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> @@ -616,12 +612,8 @@ static ssize_t attr_capdata01_show(struct kobject =
*kobj,
>>  	u32 attribute_id;
>>  	int value, ret;
>> =20
>> -	attribute_id =3D
>> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
>> -			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
>> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	attribute_id =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>>  	if (ret)
>> @@ -686,10 +678,8 @@ static ssize_t attr_current_value_store(struct kob=
ject *kobj,
>>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>>  		return -EBUSY;
>> =20
>> -	args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
>> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) |
>> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>>  	if (ret)
>> @@ -702,10 +692,8 @@ static ssize_t attr_current_value_store(struct kob=
ject *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> -	args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
>> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) |
>> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -750,10 +738,8 @@ static ssize_t attr_current_value_show(struct kobj=
ect *kobj,
>>  	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>>  		mode =3D tunable_attr->cv_mode_id;
>> =20
>> -	args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
>> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>
>Bad rebase?
>
>s/tunable_attr->cv_mode_id/mode/
>
>I don't have further comments on the whole series=2E
>
>Thanks,
>Rong
>
Hi Rong,
Yeah, uhg=2E Thanks, I'll fix=2E
- Derek
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),
>> @@ -794,10 +780,8 @@ static bool lwmi_attr_01_is_supported(struct tunab=
le_attr_01 *tunable_attr)
>> =20
>>  	/* Determine tunable_attr->cd_mode_id*/
>>  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>> -		args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devi=
ce_id) |
>> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
>> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +		args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +					 modes[i], tunable_attr->type_id);
>> =20
>>  		ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>>  		if (ret || !capdata=2Esupported)
>> @@ -810,15 +794,10 @@ static bool lwmi_attr_01_is_supported(struct tuna=
ble_attr_01 *tunable_attr)
>>  	if (!cd_mode_found)
>>  		return cd_mode_found;
>> =20
>> -	dev_dbg(tunable_attr->dev,
>> -		"cd_mode_id: %#010x\n", args=2Earg0);
>> -
>>  	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
>>  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>> -		args=2Earg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devi=
ce_id) |
>> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
>> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +		args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +					 modes[i], tunable_attr->type_id);
>> =20
>>  		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GE=
T,
>>  					    (unsigned char *)&args, sizeof(args),
>> @@ -833,7 +812,10 @@ static bool lwmi_attr_01_is_supported(struct tunab=
le_attr_01 *tunable_attr)
>>  	if (!cv_mode_found)
>>  		return cv_mode_found;
>> =20
>> -	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support lev=
el: %#010x\n",
>> +	dev_dbg(tunable_attr->dev,
>> +		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: %#=
010x\n",
>> +		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
>> +			     tunable_attr->cd_mode_id, tunable_attr->type_id),
>>  		args=2Earg0, capdata=2Esupported);
>> =20
>>  	return capdata=2Esupported > 0 ? true : false;

