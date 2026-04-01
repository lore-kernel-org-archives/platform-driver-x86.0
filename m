Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1E175A6E
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 19:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071491; cv=none; b=JDk5Mccx74Nt25+YAXQOT1e5djYIF1bBhuP/zEEqiEDJ0vr701N+sMnACw503iWi3k5S942c/Gy1n6KZvLpuzg2qbZ4R+WztZ473OcfCPUplAAvCZVSom0TmYV2Mj+0NvzyxwYe7G+MDxlXmAl1Pyv+tBnUDTSJFOv6w099Qbug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071491; c=relaxed/simple;
	bh=UfMSTOrn8Ux1Q7aCnDO5XbDFuvuJAHecPOCXmt2Z7+A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oEqYsMaX1oDcgZHfZRLzRiHVo6V3tRFxSTBJbgPSa1sOu8hoqKfEMo5uZFnnYjPAcSLwUtUIPqsVRKiwZ9NdCTOx+A9/3gNwUapc3ChcfkIHe8/XhE6WlqtNujAYmQ0nliRn29Kipi+aavXQn8f9eqe9bFHS7XSqvtCq1I5o1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrFHpi3E; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrFHpi3E"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso336614c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 12:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775071489; x=1775676289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VzGTp+UmbQ3kMrIYxOaAGPHiNRsK48au1oWsQg/x0C0=;
        b=jrFHpi3EITzAYmE1tOs6nF9yxC+BGJ2B/dSuI1lNFhh1b6G+b9futLWKMhRm0Iv+lN
         H2L4fYMR0zl0mA9PGCszJzpTypRa/cTBjYsGu9jjWSC/zGYcSpXMzw2o9Nr2rfVqpcAP
         hJmYXxFv8JHouB1/IWlO9G01J9DGrVqzVO+l81mEmDUWgV55KlzpEFVhFUTqk/ZfxbVq
         6wkMmVH6qpY0AO1UYD2nqZdCooJrmEZ5AIdzKaVzwxVujtPw8oPt5jFNoQP1B7tzvXVU
         PSDmkZzvGZv9QK+tqPcKWJP7fDNstW5/7VKQnMT+O5tYIedN78x6avycYIGNMhdCrhg1
         TSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775071489; x=1775676289;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzGTp+UmbQ3kMrIYxOaAGPHiNRsK48au1oWsQg/x0C0=;
        b=Vvc1C09He5BTpB16aAfu1YgSAW1gtnUV0VFVUt3oTBCRQ93MSbSe2mX6LQvBfe/Ik7
         /5pwWetI2clvjNMJnehgW4l5WCztGyapI7OyMvcjvZsD3u3mSH1f1um78T6e2CLsZ/kw
         WuHGUW1Q/u1TpszdV3OEtwte8mDx3Oz7ToJVjiJqDo8ySxlWh2AUV8Ez/nJY7mpEn9Eb
         wXDKQRgucE/+777ywUIDdatLBsGd1QYY+LjD6VNqxtCXTgZV61c0Cz3uqfphlQuTg6XM
         u1dkqibrTKHmcYEn9kXLCkEz/yKgbyUuT+MrO74nno0ADF8oXLBSwZR1la7Zc03jHEaR
         hY0g==
X-Forwarded-Encrypted: i=1; AJvYcCV0R/Ru3sy0HieKjLLV+HV1ErhSjj18VC9AsaCNguzZ4yoooIsO+OIDM37j2RWRPvG8wHFtSp1q7Gq9yL5dKEgOdOl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zmqMVKngrcZuyk9HeNOzlB9YGUdW51sqTIaC5dOcrMjQlRrR
	G4u/Re5qSQeT9sNemOjcKh+OPe6fkWTGAXHbg//grQfGvElv4XefHiz+
X-Gm-Gg: ATEYQzwzwSLOvhr2FnAmS20hX2b5RfgcMEtQWHlBmzR7M6iUFeAicE9Uk8cVS00KCOc
	ATs9Ah6X7tBvWwJvrzlCYtWQ/XqKudZuPh6G1KLiYft0a9HLRaRC6vHX+BfiOGdLTz/aXndmujZ
	ETadgihDzvN7mHkv5dKWAS8RbabUEjeFrmPetpdvuWBzW4+yCjcffMr+8xqXdd2/zkiH1r7du8r
	+U21GybCLSpq2hDrEvwUQCiiHYjY0pESYbLZwhU0w8jAls5TOFFtt0oxOfBz1COSaXVMIiPEubu
	pg3GcM6dQGTkJ0vNI8HixLXNF9Q3psBjye3IkRfjeR+Yb+B+TOJMW7VpMbxVohfEUQ80hlG1UG8
	gWMMse7zQUjpNAllg8kf/wLwdMG/R8qsY5ESiP3OOYAxaqExw22xXYPeYzhNLY8ogKoRlhBztKM
	iCzSAnYyjnGSCeWGpa6SuzXGNjQfdlFefvVbEn5Pk4z56G
X-Received: by 2002:a05:7301:6790:b0:2c8:fe46:eeca with SMTP id 5a478bee46e88-2c9323b7207mr2806612eec.17.1775071488911;
        Wed, 01 Apr 2026 12:24:48 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1beb:4a2a:ac39:c338:9a5a:68b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm956472eec.2.2026.04.01.12.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 12:24:48 -0700 (PDT)
Date: Wed, 01 Apr 2026 12:24:43 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_05/13=5D_platform/x86=3A_lenov?=
 =?US-ASCII?Q?o-wmi-other=3A_Add_lwmi=5Fattr=5Fid=28=29_function?=
User-Agent: Thunderbird for Android
In-Reply-To: <502ca89e011380e3b2b2131c3a3db1b4cc3e6edf.camel@rong.moe>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com> <20260331181208.421552-6-derekjohn.clark@gmail.com> <502ca89e011380e3b2b2131c3a3db1b4cc3e6edf.camel@rong.moe>
Message-ID: <FD7151E7-12D7-4C9A-A021-D38DBD389266@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 1, 2026 11:29:25 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-03-31 at 18:12 +0000, Derek J=2E Clark wrote:
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
>> v6:
>>   - Move lwmi_attr_id to wmi-capdata=2Eh as static inline=2E
>> v5:
>>   - Move references to cv/cd_mode_id to patch 4/8=2E
>>   - Move lwmi_attr_id to wmi-capdata=2Ec and export with namespace=2E
>> v4:
>>   - Switch from macro to static inline to preserve types=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Ec |  8 ++---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh | 20 ++++++++++++
>>  drivers/platform/x86/lenovo/wmi-other=2Ec   | 39 ++++++---------------=
--
>>  3 files changed, 34 insertions(+), 33 deletions(-)
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
>
>Bad rebase? IIUC it is unneeded until patch 13=2E
>
Hi Rong=2E

No, it is needed=2E

>Thanks,
>Rong
>
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

Thermal mode none is referenced here, and now lives in helpers=2Eh

- Derek

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
>> index b24bf98c19ad=2E=2Ed2838ae5934f 100644
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
>> @@ -61,8 +60,6 @@
>> =20
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>> -#define LWMI_TYPE_ID_NONE 0x00
>> -
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> =20
>> @@ -72,10 +69,9 @@
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
>> @@ -714,12 +710,8 @@ static ssize_t attr_capdata01_show(struct kobject =
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
>> @@ -774,7 +766,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>>  	struct capdata01 capdata;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	u32 value;
>>  	int ret;
>> =20
>> @@ -785,13 +776,10 @@ static ssize_t attr_current_value_store(struct ko=
bject *kobj,
>>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>>  		return -EBUSY;
>> =20
>> -	attribute_id =3D
>> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>> -	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>>  	if (ret)
>>  		return ret;
>> =20
>> @@ -802,7 +790,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> -	args=2Earg0 =3D attribute_id;
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -836,7 +823,6 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>>  	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	int retval;
>>  	int ret;
>> =20
>> @@ -844,13 +830,8 @@ static ssize_t attr_current_value_show(struct kobj=
ect *kobj,
>>  	if (ret)
>>  		return ret;
>> =20
>> -	attribute_id =3D
>> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> -
>> -	args=2Earg0 =3D attribute_id;
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),

