Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4823E8C7A
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042316; cv=none; b=h0AQQnRWotaEfunqmbAZ3zzZ2QwW+wDjKgXswFdEF10/I0anmHRwi9l0KJFFEybHF1YInL7eByFrm2qR8XRYCYuw0uohVGOCflB92TVvPlCNEcJ1ZFAzqUlYbOz54Jsk02E1SaYs5EankXmHvksoPoYDj3NHYci9EjLrgzo1+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042316; c=relaxed/simple;
	bh=vyWxU/NZmN4LzIK+o9O+5WsxvA94tydTuIEZMdJ8Q+o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XWh5ueHsaCXOLxDU1t43uCKvACWPENXJaRlu110b5R5QPnEcel3oy4GqQJljL4NF/wcfX6pP3yUDO+sb531NsbfANP+qDpL7yMWXF4NXoiY2s9bDCvLiCGIj2YvJTSmrghmN4SMnao47xCZaLbYFIzbIehXCRz48VTG6yuITmzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1AecXWO; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1AecXWO"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so9212937eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042314; x=1772647114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pe7LStbpUoEH7SB0Atautt7bOmRU2HokOnmw82zhows=;
        b=Q1AecXWOrgF2D5+RUdtI6WHGoO0AJX8quz50VfSsLJQXsMvvr+v7p2ADJMOJlhR5vU
         KEJelQ7V31LUJnJTFVGXJHJlesLHHhneYHl2wJ+nqylEoKmTaxXFb25S6whvS+cknqcE
         iR6reCUFMa+6mJJsWcPWQFIxzjWMfVYSrSXauxRH91AUzudx5r9C7p74EaynPgUOdenX
         bKZ40A28AEyTXKpeMDv4irudZNxSbwnCu8HqRuLkhdjgiphEtFXli96cS1dgyrzACrlW
         hHW6E1cz0lZVB7qAvVj/jNdiINTH5Q9aWYwa6+nv+N8UfU1YIbgcr1Swb0aS/VhpW55K
         rM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042314; x=1772647114;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe7LStbpUoEH7SB0Atautt7bOmRU2HokOnmw82zhows=;
        b=fGGnuOPp8p6OEJmviNt/0desDAS1IIt49NKAQ1RHcsd2AFa8n23eLybvrvdt1nx/HD
         5hVcIL+h1xwUaPP7ZXRfcSTdpM/HUBHC79mVbQIxOb5anD0AhTImzPAF/se/MU/Md+Ku
         ZjB8jDkfNNkb+Srrc+yY6boAKl3RYsn2Sy2tmjE/aDZcDNEC+SHtJs4wrdThBD69yHe4
         6/+LqYxCKdgZdcGfDdwVCzyo65hhZMEIEelQCJCx15KxRufKwspT3sykij2Cz7f9DpuO
         MunkWPVwD4tEQx6ELTbO+zuiddY6KYCTqH4h11hK9aMyjEF5D2J9il8GPGzChg3eamyh
         yI1A==
X-Forwarded-Encrypted: i=1; AJvYcCXW4HYmLoyhRZSszh8NZPy12+ziybbkl5CxXBpdCekVd3eAVbb0ssbso35AhlwzanzyAi1PJmxIbraRAHLt+7FDxM40@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78o2Cz9EZEppeWSqEO0L444UsF3eQDB1SoqKmp7Qk5mHyzpmS
	tL53VLyFKcD1jG/2IelLq/U3nBpH7l9FxipP3zQtjHWowH+cgeRqU+qK
X-Gm-Gg: ATEYQzw5VdRVYm97Dwwi0h+2Whp3JRFq0ith4sXuA4YiZumX40tNS6EEZ1A3PPpXt0B
	Rv0XiXQcouLTiw7T7nwdGXWUo0x048/SfzFiBTv4ta+H3BJA82GJ3e/VTE/mo54ejJBqdJSK0Ph
	Zo2HE9IfDZXyu6RCjuUlwhtEfCWvyJOlsKav7cYT2WiSHWtDyK4v0/QycWOYgW0X/t2ippNVB7e
	jcQ80ggkWc9V3uQkGkaGsmT/zcuiWHplZ9pLBXi0Z8MgmcQhxaVPTaF6QEPsK+YHYPYONSmdU57
	jt8RrBS1/NU5QfUXu7hYb+ktxwiBJGjnwbkJtpBUamNJZeLEqd49ggfz5YCFpnaLt+f5V02H9qB
	wJTXBigr4BN9aDw/5AtHE9yvU9VJSiZXImY0Pq7KhYEx1EURf3Iq24e7zRU+bG9FTuKiITpOgev
	dKWoHtlpNIlwKN7lyGUiZ3JTlEcMGAzdgAupa+yHahG2yWFzFn0JVPhJ/9rg7j0lg0vd5tsYovQ
	6NPyMPwX5s4DXNQK1HrqQKUhMFJifK2
X-Received: by 2002:a05:693c:25c7:b0:2ba:6978:2b4 with SMTP id 5a478bee46e88-2bd7bd240c3mr7314069eec.20.1772042313848;
        Wed, 25 Feb 2026 09:58:33 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa35f7sm9705257eec.8.2026.02.25.09.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:58:33 -0800 (PST)
Date: Wed, 25 Feb 2026 09:58:34 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Limit_adding_attributes_to_supported_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <d5928a3f-37e8-fdb1-2aa3-ffd9f9250d34@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-3-derekjohn.clark@gmail.com> <d5928a3f-37e8-fdb1-2aa3-ffd9f9250d34@linux.intel.com>
Message-ID: <D08EFEB7-C14F-41A0-A6F1-1E415ADC67A3@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 24, 2026 12:47:56 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen=
@linux=2Eintel=2Ecom> wrote:
>On Tue, 24 Feb 2026, Derek J=2E Clark wrote:
>
>> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolde=
r
>> if the attribute is supported by the hardware=2E Due to some poorly
>> implemented BIOS, this is a multi-step sequence of events=2E This is
>> because:
>> - Some BIOS support getting the capability data from custom mode (0xff)=
,
>>   while others only support it in no-mode (0x00)=2E
>> - Similarly, some BIOS support get/set for the current value from custo=
m
>>   mode (0xff), while others only support it in no-mode (0x00)=2E
>> - Some BIOS report capability data for a method that is not fully
>>   implemented=2E
>> - Some BIOS have methods fully implemented, but no complimentary
>>   capability data=2E
>>=20
>> To ensure we only expose fully implemented methods with corresponding
>> capability data, we check each outcome before reporting that an
>> attribute can be supported=2E
>>=20
>> Checking for lwmi_is_attr_01_supported during remove is not done to
>> ensure that we don't attempt to call cd01 or send WMI events if one of
>> the interfaces being removed was the cause of the driver unloading=2E
>>=20
>
>> While adding members to tunable_attr_01, remove unused capdata pointer
>> and limit size of all ID's to the appropriate size=2E
>
>Please don't mix changes like this=2E Create a seprate patch for it=2E
>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Reported-by: Kurt Borja <kuurtb@gmail=2Ecom>
>> Closes: https://lore=2Ekernel=2Eorg/platform-driver-x86/DG60P3SHXR8H=2E=
3NSEHMZ6J7XRC@gmail=2Ecom/
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  drivers/platform/x86/lenovo/wmi-other=2Ec | 117 +++++++++++++++++++++-=
--
>>  1 file changed, 102 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 95886df39c8d=2E=2Ef3f12303e379 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(struc=
t device *dev, struct cd_list *
>>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capda=
ta 01) =3D=3D=3D=3D=3D=3D=3D=3D */
>> =20
>>  struct tunable_attr_01 {
>> -	struct capdata01 *capdata;
>>  	struct device *dev;
>> -	u32 feature_id;
>> -	u32 device_id;
>> -	u32 type_id;
>> +	u8 feature_id;
>> +	u8 device_id;
>> +	u8 type_id;
>> +	u8 cd_mode_id; /* mode arg for searching capdata */
>> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>>  };
>> =20
>>  static struct tunable_attr_01 ppt_pl1_spl =3D {
>> @@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject *=
kobj,
>>  	int value, ret;
>> =20
>>  	attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
>> -				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
>> +				    tunable_attr->cd_mode_id, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>>  	if (ret)
>> @@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  		return -EBUSY;
>> =20
>>  	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> -				 mode, tunable_attr->type_id);
>> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
>> =20
>>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>>  	if (ret)
>> @@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>>  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>>  		return -EINVAL;
>> =20
>> +	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>>  	args=2Earg1 =3D value;
>> =20
>>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> @@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct kob=
ject *kobj,
>>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>>  	struct wmi_method_args_32 args;
>>  	enum thermal_mode mode;
>> -	int retval;
>> -	int ret;
>> +	int retval, ret;
>> =20
>>  	ret =3D lwmi_om_notifier_call(&mode);
>>  	if (ret)
>>  		return ret;
>> =20
>> +	/* If "no-mode" is the supported mode, ensure we never send current m=
ode */
>> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>> +		mode =3D tunable_attr->cv_mode_id;
>> +
>>  	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>>  				 mode, tunable_attr->type_id);
>> =20
>> @@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct kobj=
ect *kobj,
>>  	return sysfs_emit(buf, "%d\n", retval);
>>  }
>> =20
>> +/**
>> + * lwmi_attr_01_is_supported() - Determine if the given attribute is s=
upported=2E
>> + * @tunable_attr: The attribute to verify=2E
>> + *
>> + * First check if the attribute has a corresponding capdata01 table in=
 the cd01
>> + * module under the "custom" mode (0xff)=2E If that is not present the=
n check if
>> + * there is a corresponding "no-mode" (0x00) entry=2E If either of tho=
se passes,
>> + * check capdata->supported for values > 0=2E If capdata is available,=
 attempt to
>> + * determine the set/get mode for the current value property using a s=
imilar
>> + * pattern=2E If the value returned by either custom or no-mode is 0, =
or we get
>> + * an error, we assume that mode is not supported=2E If any of the abo=
ve checks
>> + * fail then the attribute is not fully supported=2E
>> + *
>> + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr for=
 later
>> + * reference=2E
>> + *
>> + * Return: Support level, or an error code=2E
>> + */
>> +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_a=
ttr)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>> +	u8 mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
>> +	struct wmi_method_args_32 args;
>> +	struct capdata01 capdata;
>> +	int retval, ret;
>> +
>> +	/* Determine tunable_attr->cd_mode_id */
>> +no_mode_fallback_1:
>> +	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> +
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>> +	if (ret && mode) {
>> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=
=2Earg0);
>
>Add include=2E
>
>> +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
>> +		goto no_mode_fallback_1;
>
>Is it possible to make a helper so you don't need these back gotos?
>

Sure=2E How about I put both modes into an array and loop through them, pa=
ssing the values to a function that will evaluate it=2E I can break if ther=
e is a match and throw an error if there's no match at the end=2E

>> +	}
>> +	if (ret)
>> +		goto not_supported;
>> +	if (!capdata=2Esupported) {
>> +		ret =3D -EOPNOTSUPP;
>> +		goto not_supported;
>> +	}
>> +
>> +	tunable_attr->cd_mode_id =3D mode;
>> +
>> +	/* Determine tunable_attr->cv_mode_id */
>> +	mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
>> +no_mode_fallback_2:
>> +	args=2Earg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
>> +				 mode, tunable_attr->type_id);
>> +
>> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>> +				    (unsigned char *)&args, sizeof(args),
>> +				    &retval);
>> +	if ((ret && mode) || (!retval && mode)) {
>> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=
=2Earg0);
>> +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
>> +		goto no_mode_fallback_2;
>
>Same question here?
>
>> +	}
>> +	if (ret)
>> +		goto not_supported;
>> +	if (retval =3D=3D 0) {
>> +		ret =3D -EOPNOTSUPP;
>> +		goto not_supported;
>> +	}
>> +
>> +	tunable_attr->cv_mode_id =3D mode;
>> +	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_id:=
 %#08x attribute support level: %x\n",
>> +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_=
mode_id,
>> +		tunable_attr->type_id, args=2Earg0, capdata=2Esupported);
>> +
>> +	return capdata=2Esupported;
>> +
>> +not_supported:
>> +	dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=2E=
arg0);
>> +	return ret;
>> +}
>> +
>>  /* Lenovo WMI Other Mode Attribute macros */
>>  #define __LWMI_ATTR_RO(_func, _name)                                  =
\
>>  	{                                                             \
>> @@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pr=
iv *priv)
>>  	}
>> =20
>>  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
>> -		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>> -					 cd01_attr_groups[i]=2Eattr_group);
>> -		if (err)
>> -			goto err_remove_groups;
>> -
>>  		cd01_attr_groups[i]=2Etunable_attr->dev =3D &priv->wdev->dev;
>> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i]=2Etunable_attr) > =
0) {
>
>Reverse logic and use continue=2E
>
>> +			err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>> +						 cd01_attr_groups[i]=2Eattr_group);
>> +			if (err)
>> +				goto err_remove_groups;
>> +		}
>>  	}
>>  	return 0;
>> =20
>>  err_remove_groups:
>>  	while (i--)
>> -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> -				   cd01_attr_groups[i]=2Eattr_group);
>> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i]=2Etunable_attr) > =
0)
>
>Reverse logic + continue=2E
>
>> +			sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> +					   cd01_attr_groups[i]=2Eattr_group);
>
>You need to add braces for multiline constructs=2E
>
>> =20
>>  	kset_unregister(priv->fw_attr_kset);
>> =20
>>=20
>

