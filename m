Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7543E959C
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 17:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041934; cv=none; b=IUqhytRfZF+T/Xe5oQqlmka9Hpl0oFsqkbrEJknnd5NBmczUauhnUormJoJmkJY0czHMps/LIdX7Rkh2ZRcJEU5lau1FyRiMGycQAqV9GG35C2c15MgnZcWC2Nj6ON0T6BI7YouY2PJZS3RFci6iJWJQpYVbz+F8hm35foUs6Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041934; c=relaxed/simple;
	bh=XlnMN/BvusIRHv+qxvj32udh9lwovX7f10p877C+p7k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VKnwODSJWDvptR7i3ms/DHaXr1WLtFjcFMr9PIxhGVLDUvuK35kmHQyk6IvKTBLupHlCCr+xSyRXJPNuJI8nBGt56NmuJVOeF3LiTgX+UO/2Sl7HtBSKq5EpmwOAQDMct5a/sspyDqxh3lGPSHcTlwYdH6MGwoMCan43qurXpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyuKOlY7; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyuKOlY7"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1270ac5d3efso6545671c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 09:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772041932; x=1772646732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ay9Xech6PPPm8PwtwgrEbNFTU+kPt9ZUQtlwZ+r5WLw=;
        b=dyuKOlY7MBSmfFbq/3cqLFagImuASKJCHq5HxxdWFk2+CfFm+fPWG0naW7t18z+DmO
         EHaiaq3Rac+ZKxTd/NHFnWhGQmodpgtvrx/8E25cC3uLl7rRzE2RVCK6Xir6JSd4/DT9
         ccAIJF+KkfE/iYzgqAsjZW3+8BSUoUKoUSXWx9V2x5WSXXZqxHrGlV7l6lRMH2H3Fv3V
         SFaIbQhRjta1k8TdHG6csiBJk2gcegdunO8CUJ8jtmiPiRaFfy7HKQB7UxKEYqAjl68V
         dfFdFEzHVmx/xMzoEftAg7dFjisi544Hh+pfdr0SY54PALgDY9U8fd3PUE1o99nJeEQp
         PT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041932; x=1772646732;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ay9Xech6PPPm8PwtwgrEbNFTU+kPt9ZUQtlwZ+r5WLw=;
        b=PfA36Hnac51ZTTbJ6Hm6FSU+5ihxsZM61BtdSwmixYMH5PsJCvooW1ArXN8lAMsXr2
         KOIDNLAFfDEWDZsicczSlWbvXnmd+eswdnXZKxBa8KRdHlM0bwlFrg9oGUCL8M1YrRRE
         Fp2LCmS3RjHXr1DvO2w9sLUdwLV+GRqTzU0O4tqSf9Seu3+5DaN4eJvZHfeCuaXjXI5C
         m3rXSUjwUKj9wFMz3NidgVvVcQTRM/3gZVSt2/WoIi79mES9uZXIZtM0MBoIkZ9qd+9u
         m6sKq7xX0yWmHa8S2xnPs82nE3Ab5IsrkCnaxzgLH1Pmk/3JJ3Z65h8ETb3c2Rj9bfs4
         +i8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE3gwXRMJUfCtNfWKVyigHpbsQ7pYwr/kVxm+ZSzaG2hZy+LzsyNpFnkqWYp5VEJJRZNpTH+UzVkLU3LpZ5DYE7eaT@vger.kernel.org
X-Gm-Message-State: AOJu0YyilOn0t6zBopIzgHOcHXYYFget9T9NfoC22nvAeMcJO0drSOCE
	L1v1OSIkw11D4lKhhE81gd4x0LnAEBbedUqBRKFFcvNbB6szhsldCobn
X-Gm-Gg: ATEYQzwQvmRpqAUDZoeWW5iEEv6+2NqBLEkgywd4qDIVURnd3FSpDh2D70ZU8mMbEdC
	6g1yZIxgAaJRscIUsixKqQsWfbwZO813QfYRyUdIC08bj8mICz5QEwnBn3MM42CM2bRQBjR1YS9
	G37JJzDlDOz8skRt0KW/RVWZ86xZlT70aslfOpibkowB25jiJxQvICHjfmds+ItPKYEZcrZIkQR
	unClYLqWm2nP2HFGx31voZmd0bzzDoGpuQ4JwA7nu7SLy4JaGRZYtCH/SK4WtcgzxGgSTRZhrKP
	KyDCTMAcoWdskn5yW+gLs8WON8W+QU13mX8PQdj/x4bIE1BL+THVeDS2/T5DsCYUtzinjO2P7HL
	EEUfIUAJtzI7Tp4zF7jV4cDe1IypOBD+xim3/MrMPn6OEOx+i1OKeskWhxC4HQvCGAItoEVWg6Z
	1EZkjAafsAAWtjxPgqx/vw4f9xjis778yo6DoYwJtOPkY74/QOpgRHAlN5Lr4FfGcQGg+CnpXpE
	1ROLxV8iZ6/qvOcbBhPVg==
X-Received: by 2002:a05:7022:117:b0:119:e56b:91ea with SMTP id a92af1059eb24-127869a5672mr512855c88.27.1772041932207;
        Wed, 25 Feb 2026 09:52:12 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af10481sm14532949c88.3.2026.02.25.09.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:52:11 -0800 (PST)
Date: Wed, 25 Feb 2026 09:52:13 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/6=5D_platform/x86=3A_len?=
 =?US-ASCII?Q?ovo-wmi-other=3A_Add_LWMI=5FATTR=5FID_Macro?=
User-Agent: Thunderbird for Android
In-Reply-To: <c8031935-0dab-59d0-a23f-b93c203ef95f@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-2-derekjohn.clark@gmail.com> <c8031935-0dab-59d0-a23f-b93c203ef95f@linux.intel.com>
Message-ID: <947F9B21-0300-4C2A-A8DB-DC190DCE7004@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 24, 2026 12:42:08 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen=
@linux=2Eintel=2Ecom> wrote:
>On Tue, 24 Feb 2026, Derek J=2E Clark wrote:
>
>> Adds LWMI_ATTR_ID macro=2E In the same vein as LWMI_ATTR_ID_FAN_RPM,
>> but as a generic, to de-duplicate attribute_id assignment biolerplate=
=2E
>>=20
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh  |  6 ++++
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh |  1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec    | 36 ++++++--------------=
--
>>  3 files changed, 17 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index 8c1df3efcc55=2E=2E27202e2dc8a5 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -17,6 +17,12 @@
>>  #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
>>  #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
>> =20
>> +#define LWMI_ATTR_ID(dev, feat, mode, type) \
>> +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev) | \
>> +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat) | \
>> +	 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
>> +	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))
>
>Why does this need to be macro? Static inline would have proper types=2E
>

Hi Ilpo,

It doesn't, I was just keeping it consistent with other previous uses=2E I=
t's not a problem to change it=2E I'll need to move it somewhere else since=
 this is a header=2E

Thanks,
Derek

>> +
>>  #define LWMI_DEVICE_ID_FAN	0x04
>> =20
>>  struct component_match;
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
>> index 6040f45aa2b0=2E=2E95886df39c8d 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -71,10 +71,9 @@
>>  #define LWMI_FAN_NR 4
>>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>> =20
>> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
>> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
>> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
>> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
>> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>> +	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>>  #define LWMI_FAN_DIV 100
>> =20
>> @@ -716,12 +715,8 @@ static ssize_t attr_capdata01_show(struct kobject =
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
>> +	attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>>  	if (ret)
>> @@ -776,7 +771,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	struct wmi_method_args_32 args;
>>  	struct capdata01 capdata;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	u32 value;
>>  	int ret;
>> =20
>> @@ -787,13 +781,10 @@ static ssize_t attr_current_value_store(struct ko=
bject *kobj,
>>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>>  		return -EBUSY;
>> =20
>> -	attribute_id =3D
>> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>> -	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>>  	if (ret)
>>  		return ret;
>> =20
>> @@ -804,7 +795,6 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> -	args=2Earg0 =3D attribute_id;
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -838,7 +828,6 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>>  	struct wmi_method_args_32 args;
>>  	enum thermal_mode mode;
>> -	u32 attribute_id;
>>  	int retval;
>>  	int ret;
>> =20
>> @@ -846,13 +835,8 @@ static ssize_t attr_current_value_show(struct kobj=
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
>> +	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),
>>=20
>

