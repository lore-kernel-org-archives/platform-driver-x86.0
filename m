Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB331B810
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462569; cv=none; b=DTNMGhECFMkmqgWSiSVDfbiP2uPxUKJ8phtEZw5o8j+B/DBl2iyPeU/6lhJPwR41LiH13mYVknxy6IkEwrZMpRS92U9trG8WYFyBZfNtqU1030cW/GbNlyxpQihF+m6sLyk1nSfoNL3kLUmovO1M7GwwJqhLgQj7V/0rKuWNwsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462569; c=relaxed/simple;
	bh=zp0KIERlnaVvPkq1+PGR5MlHfRgPaT1dAAKSgY8vobk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=B7g86wyjwW4OL2CipNlezRSAWbuYaSigcIHokAr0sg2nspWn8NLR9mETxUxlgkfxnF9DAUSvLUHrkkxoAotqDwEpZU7XoJipqGkrbZWb7Ek7ndLw1Ki3hLMR0CMEnSC5GGRloZqeYMDh6YV1JV3KrcvZlc+I3VwPmyrCyh+94Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuSh9QTM; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuSh9QTM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12732e6a123so299830c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462559; x=1775067359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uvAWPrFt62SkosiXY3UuKLgEsKGClJU0Wz6z9GrW3Vo=;
        b=IuSh9QTM7R5/+FpHFq0rEuqfXumNsKgnU6DXfhzQCAelMeLai6sI32Jx9G4n3+qJhl
         6WilfsrPMPaTJTiTIzzrJsZg+ndAaU59EvaYRGMBNF04cqrWg6RbZRRyxwhykk4fPX3F
         5C8aCZPOTE3gRWDd2kRFmz2sMGyWeebOkdHxe9/m2QY+TFU76sjOD9iE3W8TtWGb2ZKb
         IXSEg/KkjyzCTqXMJa/6U5zWppoQVFIVNM0IBYw4VGI4MYeg22F1/ekcc/hrCSoi9jf1
         YG2K8lA0WmEMw4QcqzdEUu8uR7zz13Keq7hsP11rsFp+KqobcMVR166hvR/nhMsW2Qxf
         OrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462559; x=1775067359;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvAWPrFt62SkosiXY3UuKLgEsKGClJU0Wz6z9GrW3Vo=;
        b=DklcVjOGZr1D0d8j5M+RFb0rdYdOKUFiVaAk21ADH+bRp12ICs4/zqwnmQbGRkesCq
         Qyoul25ernJJtxhJbjjssRe0B/mHOQye7gQTYuMhYBInyVqNjRwXRnTewsM/Ec+SdTWy
         5MJlrSqDgJ8+k5vtOYFxJ3RVMeWG0HkgyGpkFFxwGFkyVSM1DhY21MLZ/iuYbRkguZRO
         HHA3spyB1aB7CIydwXVGtTbXFW3+/l9VFTSBwcizFBS3bpYit5bV2hmqUrKJuz7MM5c9
         3+Vx/qiu+dIGByAXI9kkHOXRErbm1qq/EvsVkFAq1uS5+o8HtL94LOEUINP0DghqdoMU
         aIRw==
X-Forwarded-Encrypted: i=1; AJvYcCWW89B+4RKjSqR3h5Tes1Tojffx2RbcOWhW3wPMDVZF1NE4oKKGbMR+QQb7+meMjAxUDb2C4OgdCSJPlSpy41CZkg28@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+MLMhlsuMnYN3rf7cVi/eWaGDGDM1jngdNfMgwRruNef4aBb
	pk0h42GcK672PNnjsPjfgUYu0GPuNzSbpNpfLoTXLke+JFV752/d+mDK
X-Gm-Gg: ATEYQzwzuragmn0AKUVyhw1q0N2A5v1ilfqmjhV64GN/QSTUiaNT+zKtm0jbMHwe/57
	G/QMBXFVit9H+PRj6YcIhNlBwQeaoG3hzRz3alhOxmNvS80gO4lqAw+SiYbxKFkFx88TZp7tinP
	04+iiWK6qlT4hEMSdEIHSTwASHg9J4aOGZ4X9QXNMMnUeiPtG4Di8almRDXYW97G+3BxUmCPZug
	ZOpoY/ocH3+9qA+qQEjmr8EbMAse488L7sHOZpciLktXuslYMiJBDFrDABmVjblgTkBDj85v1e5
	xNj+AJCWalnqI6enSdViXMXJ6uHlXgITtBut3qWFs8HQAJkSag7EBz6Gp7y358dYTUdei2zJS9C
	OmiRaMxiGTUJQ/dHbHX8Mi1VvDew60/JfE3cQ/KpxOB9uNUmhjgtcf+PA1tsxA+YeTCGyoJQs1q
	f7uF8PWltFZY2pGfkysHsBu3n0iCqVX8YlEAFFhfkRpqMnCSo9EohTIkJE5M0EmcE9skNlOCLzz
	OqT2jYcadIx33SouIPjPi4VrjKeeWai
X-Received: by 2002:a05:7300:e208:b0:2c0:c8c0:cd3e with SMTP id 5a478bee46e88-2c15d384183mr2430127eec.21.1774462558580;
        Wed, 25 Mar 2026 11:15:58 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec7f9c9sm555789eec.12.2026.03.25.11.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:15:58 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:15:57 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/8=5D_platform/x86=3A_lenovo?=
 =?US-ASCII?Q?-wmi-other=3A_Add_lwmi=5Fattr=5Fid=28=29_function?=
User-Agent: Thunderbird for Android
In-Reply-To: <95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com> <20260324221032.1333636-4-derekjohn.clark@gmail.com> <95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe>
Message-ID: <4CA98A2A-25F2-42D4-9282-D798A92CEABC@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 25, 2026 10:54:49 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-03-24 at 22:10 +0000, Derek J=2E Clark wrote:
>> Adds lwmi_attr_id() function=2E In the same vein as LWMI_ATTR_ID_FAN_RP=
M(),
>> but as a generic, to de-duplicate attribute_id assignment biolerplate=
=2E
>>=20
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v5:
>>   - Move references to cv/cd_mode_id to patch 4/8=2E
>>   - Move lwmi_attr_id to wmi-capdata=2Ec and export with namespace=2E
>> v4:
>>   - Switch from macro to static inline to preserve types=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Ec  | 25 ++++++++++++--
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh  |  3 ++
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh |  1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec    | 39 ++++++--------------=
--
>>  4 files changed, 36 insertions(+), 32 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Ec
>> index ee1fb02d8e31=2E=2E6cb3665e9399 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> @@ -48,6 +48,7 @@
>>  #include <linux/wmi=2Eh>
>> =20
>>  #include "wmi-capdata=2Eh"
>> +#include "wmi-gamezone=2Eh"
>> =20
>>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5=
BB300E"
>>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
>> @@ -58,9 +59,27 @@
>> =20
>>  #define LWMI_FEATURE_ID_FAN_TEST 0x05
>> =20
>> -#define LWMI_ATTR_ID_FAN_TEST							\
>> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
>> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
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
>> +u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
>> +{
>> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_attr_id, "LENOVO_WMI_CAPDATA");
>> +
>> +#define LWMI_ATTR_ID_FAN_TEST                                      \
>> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
>> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
>
>I don't really love the idea of exporting a very simple function instead
>of providing a static inline equivalent in the corresponding header=2E
>
>Compilers are smart=2E For example, they are capable to convert
>LWMI_ATTR_ID_FAN_RPM(x) into `0x04030000 | (x + 1)', as long as the
>function body is accessible=2E
>
>By implementing and exporting it in wmi-capdata=2Ec, wmi-other=2Ec can no
>longer access the function body so no optimization can be done there
>(note that LTO has nothing to do when both are compiled as modules)=2E
>Hence, the compiler has no choice but to emit a function call to
>lwmi_attr_id()=2E
>
>Moreover, your following patches have a lot of
>lwmi_attr_id(tunable_attr->*_id, =2E=2E=2E) patterns in wmi-other=2Ec=2E =
Outlining
>a simple function usually has higher overhead than inlining it (hence
>worse performance)=2E The calling convention also increases register
>pressure, resulting in a bloated code size:
>
>PATCH v5 (whole series):
>
>   text    data     bss     dec     hex filename
>   6465    1832       0    8297    2069 lenovo-wmi-capdata=2Eko
>  43132    9153       3   52288    cc40 lenovo-wmi-other=2Eko
>
>Inlining lwmi_attr_id():
>
>   text    data     bss     dec     hex filename
>   6325    1832       0    8157    1fdd lenovo-wmi-capdata=2Eko
>  41070    9153       3   50226    c432 lenovo-wmi-other=2Eko
>
>52288 - 50226 ~=3D 2KiB, which is quite a lot=2E
>
>So please move it to capdata=2Eh and make it a static inline function=2E
>


>> =20
>>  enum lwmi_cd_type {
>>  	LENOVO_CAPABILITY_DATA_00,
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index 8c1df3efcc55=2E=2Eb5b6d0305b6a 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -19,6 +19,8 @@
>> =20
>>  #define LWMI_DEVICE_ID_FAN	0x04
>> =20
>> +#define LWMI_TYPE_ID_NONE 0x00
>> +
>>  struct component_match;
>>  struct device;
>>  struct cd_list;
>> @@ -57,6 +59,7 @@ struct lwmi_cd_binder {
>>  	cd_list_cb_t cd_fan_list_cb;
>>  };
>> =20
>> +u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id);
>>  void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
>>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata00 *output);
>>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output);
>> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone=2Eh b/drivers/pla=
tform/x86/lenovo/wmi-gamezone=2Eh
>> index 6b163a5eeb95=2E=2Eddb919cf6c36 100644
>> --- a/drivers/platform/x86/lenovo/wmi-gamezone=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-gamezone=2Eh
>> @@ -10,6 +10,7 @@ enum gamezone_events_type {
>>  };
>> =20
>>  enum thermal_mode {
>> +	LWMI_GZ_THERMAL_MODE_NONE =3D	   0x00,
>>  	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
>>  	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
>>  	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index c1728c7c2957=2E=2E7aa512ff1446 100644
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
>> @@ -62,8 +61,6 @@
>> =20
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>> -#define LWMI_TYPE_ID_NONE 0x00
>> -
>>  #define LWMI_FEATURE_VALUE_GET 17
>>  #define LWMI_FEATURE_VALUE_SET 18
>> =20
>> @@ -73,10 +70,9 @@
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
>> @@ -715,12 +711,8 @@ static ssize_t attr_capdata01_show(struct kobject =
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
>> @@ -775,7 +767,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	struct wmi_method_args_32 args;
>>  	struct capdata01 capdata;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	u32 value;
>>  	int ret;
>> =20
>> @@ -786,13 +777,10 @@ static ssize_t attr_current_value_store(struct ko=
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
>> @@ -803,7 +791,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> -	args=2Earg0 =3D attribute_id;
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -837,7 +824,6 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>>  	struct wmi_method_args_32 args;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	int retval;
>>  	int ret;
>> =20
>> @@ -845,13 +831,8 @@ static ssize_t attr_current_value_show(struct kobj=
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
>
>IIUC args=2Earg1 contains uninitialized data and will be passed to
>firmware=2E Since you are revising its assignment, let's zero-initialize
>`args' when declaring it too=2E
>
Hi Rong,

Sure, I can do those=2E

Derek
>Thanks,
>Rong
>
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),

