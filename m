Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB582135D7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 03:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773545912; cv=none; b=JV2Syom/eiDOtuhcuy+ZfmlOonsnjYSK2ACTxtb79qILYFaoH58uZJuoiTsTd421+9QjQQlA+nJCpgRe+DU36WovzCu0G8lY4mwBPYWyoXMymg6twWJHMrV58qZ+rNwDVA2lvGt6oUjbgQ5/13Aqh9ZSs0QCFiebHl1Iea33T50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773545912; c=relaxed/simple;
	bh=km/9YQqxJRq7GbL5RUJXbitffO64zQjJiWCqt23xAtM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=he4DeuBVQhLh761rk2RjkbxFGSfV/G1/lMyvEmYo3rbPaGj/b7xnQLMW56T1EInnyuSprDDruF3t8M6tM27Nve7EWHFB4KKCUkK3GWZNXvxByhHAtfWgmdTJdKxGshBrY5U47MMvkqaLhRBb/jf0/iVs3jnkunX43Fb85BecNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8hoBChx; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8hoBChx"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271195d2a7so4005643c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773545910; x=1774150710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urc/PuqszAe8yAYq6qvIC1Ky84Rwd+mAljkRAsfJV+s=;
        b=U8hoBChxOSr7NsRP9dZ2jIAMBD2zpQw7P6gukusMIwHOZAf16FOUe7m+TQx1HPdvZc
         nUWaRIjXDmVcheqsCjRWIAI1wvDWkCTVNiSiLusQkxxlsBQoT86WY8l47jedYq+vVidC
         Bs+10ObUtaxWFKN8xak0pWq4RNt4KpeYxgVQH5TEO5/z9PelYNA2rvrS9rk9aV7t1AhX
         4cq8oEqYqyuRUKtKQPDKf/UZfRLiwlhOTEJUrCw21yr64DngaIEmLFlfbV0O+2vxVuAk
         xk9JwLGQfbLo2lAncfDelFzMOHK7nAzyLhGN/94c3QGgSx1X8dNsVtvnImHCls7CCiYn
         SW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773545910; x=1774150710;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urc/PuqszAe8yAYq6qvIC1Ky84Rwd+mAljkRAsfJV+s=;
        b=Bhmnb/xIKB4u4f5r0GkMxRvl/mXoEgxzHGRpw/4w7l1Mo1SPmb6gBPue+O8lJ5/bH5
         0o+50VV+WNiXoX+wTQfweqi8ngCiAk7TjJD2ZkB9W+M0aFcBoUUuGCtfu6Ngzj3PI5Hf
         Kee/BhgTSgwMyGLg2gnDslE1y8qYtISXVVAA4byDYgcp7JacI4PHsS/cKWUR8EZSnFkw
         9xGeA72uA5kxQ1esGkJPxzCNvdMZSbCZ0zNw/FFbx89kJFTW8lKj+5b/VNaDOdPldJsS
         gt/Pmqsg10wECRC/kavYD6mxdMViXBNoc8Qv+TnCl7KG8OckBNvp/fgZtxmlhm8FJgJo
         wq/A==
X-Forwarded-Encrypted: i=1; AJvYcCVGO9TKRed4rmQ4EKcJQvuafFt84bWGuVroVzaSdxq9ogEywW1HbQXCA2ehBUK8j+rz3HVU+NM2W6jcSv6BZM5omHvv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0+YXngvRqE6b/Y9spldmPHB8p3v5c0pzU9Bj/zQWrD/wFisw
	d8O8DXDW1foEmsr7z0Y1GIgEyK1+ZuBsdzHKJpkTJfWx5pkOOKPo3fYU
X-Gm-Gg: ATEYQzwI56mHrJm3dgaZcKj3K3kr+Jvh8BmneEo4eAwb/jtWOR2mCpNM7v/gH9yQ1ou
	i3tTajlRlmQwgXlQEJtpDtg38DkAUpzMBGblIVPaT2Kf8RH1cuXW3F4CAq8QPwrsCKunYPv0vCN
	jRQjBWxQDBYjL/khFnLHf9kaDtsXjp3tEuNzAciy1ho5n2I5jePI1zvzoi/8G+K5sa6dDgpNmV9
	oticRQet24bxa7T9y4oAEEWAhcT8CVkIa7d9vHO2t8mPwmTENK3WMZB1lmuuHLtPns3uK7mq8WD
	vY/FXD8LsLnQaZNo0V3XYeN2+KG0f0RZDwWeUUSKcZ1ClDBZ65ecIcyi+eLHJDTed3F517B7WpK
	31dt1ojjlUKk+ug4GtgHzmHfeh8VSuWhCloxte+zaa3lfi1GwoC9q/jc4Ddfq3M7o6aF4Svv/4a
	8Ut2GsZnNf3VqCjFZ1UeTUIobCwJA7dIK+Cph3GIBddYcQ6x3ZLbdTjHdojvwEI4s9RcYYy4Hgu
	HeVp50Y3yL8q+09fXDLIw==
X-Received: by 2002:a05:7022:4587:b0:119:e569:f27f with SMTP id a92af1059eb24-128f3e2a616mr4412916c88.40.1773545910279;
        Sat, 14 Mar 2026 20:38:30 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6295ebfsm7528094c88.4.2026.03.14.20.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 20:38:29 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:38:28 -0700
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
In-Reply-To: <e44e31bf1f811c504d1ee199c9fd8b239731995e.camel@rong.moe>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com> <20260312031032.3467565-4-derekjohn.clark@gmail.com> <e44e31bf1f811c504d1ee199c9fd8b239731995e.camel@rong.moe>
Message-ID: <CD767F09-E737-4F8F-9FAD-00277F030643@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 14, 2026 6:08:55 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
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
>
>Adding them actually depends on [PATCH v4 4/8], otherwise you always
>get 0 when accessing them in this patch=2E There are potential
>regressions=2E=2E=2E
>
>
Hi Rong,

Good catch=2E I think they got moved during a rebase edit by mistake=2E Th=
anks=2E

- Derek

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
>
>=2E=2E=2Ehere=2E=2E=2E
>
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
>
>=2E=2E=2Eand here=2E
>
>Thanks,
>Rong
>
>> =20
>> -	args=2Earg0 =3D attribute_id;
>> +	args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>>  				    (unsigned char *)&args, sizeof(args),

