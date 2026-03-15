Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674637080D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 03:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773546569; cv=none; b=rxD2NrJ/tuZHFGF2ZTK/356vpTF4ZPPVNN+qz4AYtVQU6wWnmbQJitSxMLkkWS1Brx2CTmJg5eNUnoZlPZxbrRsuXcdhpJzB41ucJKz4uDnAeWY7OtQVlIAsBpNBSefamsJCWk3NARErS13NhHhW3iCnOoh6Gyij/4G9nDahywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773546569; c=relaxed/simple;
	bh=DWmvO0n6uQxalLWR3d53bNCn+z/xn5lf3tCB5KPiLYY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eGVoxgqcmwAgUeiLVNzgHZlKYQRRXl42f0IzYWhHfdPbIQN5nXoKTd4j9xtsLb2kcVoyHeT9ShDwF7HPLt8dPlKXsNgfgbZFOIZl9UWtU5XoKvQG25uDXnR3eOYWLTFYJkO4vHk7CoM2Pj60JpVDvdFSgF/ceWenx7t91kPaYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP8MF1mg; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP8MF1mg"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so4465994c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773546566; x=1774151366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZU9nWpVZsDjH/4ZFq/SHhtUIo0Ljcnxp6MMvWDE03Yk=;
        b=nP8MF1mgYWyGJ+tIR8JvRQPJFh2D3rSYADUjuD86hHY1QRrQgxlssdXVOGg0rfu3Ac
         iXYZMa7fapTo9RaKo8z54KQPa/WWUt6KjhnMuvarUQAvV9V07XWvN8WHNN2n6XIUJ7IS
         32xcY16P8Hkd6UhBxT8ChURR1Mu8hXJurcv4dw8eYXfGSXGvljsHRN/bgZ+i2qTr0K5r
         onzVUCrgsOATSbq5oEJFnGPBghztZs88q+MVum09SAOSScoPnsiYLWuxH53/GzHWU+LW
         ZYQa7ynboOcGw65h8rpVwrbmL3HC8lEeiflxxjFCGnlzFZXIa5QN/3nZ44LpWvsEH4ow
         8S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773546566; x=1774151366;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU9nWpVZsDjH/4ZFq/SHhtUIo0Ljcnxp6MMvWDE03Yk=;
        b=qa3xnK33zqhJxLAj9MJTDHf5fnneEKhrQOIF7TU/tDRKQC71Fd0Yb+fN12yhKrfLJY
         jx8VFoEPR4w47R0B0VvAWgDY8I8Nzp+5Ed1iAuPdKEydMTtAEiXkO2Vm3f/wX0Sy6PcR
         mYe60OzcTNME+F5iHOX3BitrkhvjPxk1ziq5qe24b+LWQXC1UnXspgCkgu891CxQcke4
         puiUkdW2wLVPS+8s4KsSzhQh96ObZZquUuOfue86aEFejGfRe9xsxD1O8LzgTnSoDSF4
         lrKSxq09VV4zfStUQZsZFnH/iZeNGCHBbBA3mToDlwFsm0HzYEYv0qnzzaD43u6dyqQX
         ZqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6t/I08gDmMsUbh8qNIZPyjEB9l+FEEbY8J0Na40O3+OeWcxeZvkR8sKJonJl/FuC8OoAjAuOfrrL/3m5df4GDAATz@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGIiQ8jBQSusbWPjH2AxGTwRVchhbe+1bE/kkmXiZpwJdxJCe
	lNXdPJVQaW84tZSwu2rit3mvqCkxK3mYF9SY+ooC9E1PPdtcXR7bp5RS
X-Gm-Gg: ATEYQzzALAQtBBmuKjZB3A235vb4pOrOiICRVc3qJq7fMsDyG6QinhxBgkKOZDbIZn8
	bVvakGW8B2lDQResMamyAIcB0UGA5RFgYXjaSuusgF0aHWAcOIbcQpEY+Iq5GSwjWt1rUrTe8ow
	9KqTKERGODANM34m+sPyxmWL6sGe1wXRSGBknuMiXVF7IYuvliJwIRsD1hiO73bJQCqVRh27bwT
	2m9eQ1dW8I7MEkGm6u6rLhAvb6u1mhaHiTZFY3s7x6PJtr47FwdGh+stxPJeOsOT77KwRBhncIT
	ItKszMEhuYDNXCTvIFgm+c6O/uQcK8v9RRbZYus6ZPPzT3/FqdY/SWF1sLdBDdUvbEszqOqXT0A
	NkURMsCJDnrKqNBO4rxqwCKFC2wDgpIvICHc6w4JkT5jpc8mZRjPA8/gd+tVIoW2Cs6sVILfJ85
	FzEGHoZ3+6CnXJU42c4ZgvfEl1Vs5NWXqgLExN9d55V4aI5HX+iH0QGZnLm5ZlOfU31niRGDk8s
	NM1Q/+rQIbfSOewrEcLFA==
X-Received: by 2002:a05:7022:793:b0:11b:923d:7753 with SMTP id a92af1059eb24-128f3d6eca9mr4076401c88.3.1773546566426;
        Sat, 14 Mar 2026 20:49:26 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62b01eesm8830660c88.7.2026.03.14.20.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 20:49:26 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:49:26 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/8=5D_platform/x86=3A_lenovo?=
 =?US-ASCII?Q?-wmi-other=3A_Add_lwmi=5Fattr=5Fid=28=29_function?=
User-Agent: Thunderbird for Android
In-Reply-To: <ba6cc9d717923b4ad6bc906971aff1ee802ee282.camel@rong.moe>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com> <20260312031032.3467565-4-derekjohn.clark@gmail.com> <ba6cc9d717923b4ad6bc906971aff1ee802ee282.camel@rong.moe>
Message-ID: <01E4C08A-8258-4FB4-9308-6F3796E70087@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 14, 2026 6:32:51 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Thu, 2026-03-12 at 03:10 +0000, Derek J=2E Clark wrote:
>> Adds lwmi_attr_id() function=2E In the same vein as LWMI_ATTR_ID_FAN_RP=
M(),
>> but as a generic, to de-duplicate attribute_id assignment biolerplate=
=2E
>>=20
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v4:
>>   - Switch from macro to static inline to preserve types=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh |  1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec    | 59 +++++++++++++-------=
--
>>  2 files changed, 35 insertions(+), 25 deletions(-)
>>=20
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
>> index c1728c7c2957=2E=2E9fff9c1f768c 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -73,10 +73,26 @@
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
>> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
>> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
>> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
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
>> +static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
>> +{
>> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
>> +}
>
>Hmm, I'd suggest adding them to wmi-capdata=2Eh so that you can refactor
>LWMI_ATTR_ID_FAN_TEST in wmi-capdata=2Ec too=2E
>
>Thanks,
>Rong
>
Can do=2E I was trying to avoid logic in the headers (despite Ilpo saying =
it was alright in this case) but that's a valid reason to move it=2E

Thanks,
- Derek=20
>> +
>> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> @@ -550,6 +566,8 @@ struct tunable_attr_01 {
>>  	u8 feature_id;
>>  	u8 device_id;
>>  	u8 type_id;
>> +	u8 cd_mode_id; /* mode arg for searching capdata */
>> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>>  };
>> =20
>>  static struct tunable_attr_01 ppt_pl1_spl =3D {
>> @@ -715,12 +733,8 @@ static ssize_t attr_capdata01_show(struct kobject =
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
>> @@ -775,7 +789,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	struct wmi_method_args_32 args;
>>  	struct capdata01 capdata;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	u32 value;
>>  	int ret;
>> =20
>> @@ -786,13 +799,10 @@ static ssize_t attr_current_value_store(struct ko=
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
>> @@ -803,7 +813,8 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> -	args=2Earg0 =3D attribute_id;
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -837,7 +848,6 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>>  	struct wmi_method_args_32 args;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	int retval;
>>  	int ret;
>> =20
>> @@ -845,13 +855,12 @@ static ssize_t attr_current_value_show(struct kob=
ject *kobj,
>>  	if (ret)
>>  		return ret;
>> =20
>> -	attribute_id =3D
>> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	/* If "no-mode" is the supported mode, ensure we never send current m=
ode */
>> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>> +		mode =3D tunable_attr->cv_mode_id;
>> =20
>> -	args=2Earg0 =3D attribute_id;
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),

