Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A33597B
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 03:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773546481; cv=none; b=MP6Llt49swvTOs4+eLxYZQM950XOU6+8G1hduDVOB6IFpVhpOE3inhicX/yzPtt6ZqCDszAPv0ygVQba+52w0K63sRp8TifViu26kWLENZFcNJwiMth1HYH/MMy+KHht6hCVZMSihWFTBvqHzWwtpz7tCYA7UbPQalpSwVF5dFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773546481; c=relaxed/simple;
	bh=dCgGASWrPYF3jkAdk/VJdAHohicfKjYu8CPYJKXKzSE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QxXvy77forXafFc7F8GbDyvnPur9H4bvvzJVo09GY8UsO6Z+8bH3if3bXiLMJnkhH9LoPd6YX8fPB56woSGXwcqypgs76BgLGYiQjsYyRNKvWdmjX+QKHEizDGsULytJrLCXm0rubZxoN8vbcx8X6CCayY4I/3L8Wj/p0sc/fNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh9hD51s; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh9hD51s"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be06c02f66so1553868eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 20:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773546478; x=1774151278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XfjQYpW2a542mO9fmPx5PN6lFCmDVzdSDPYIU5gG/9I=;
        b=Hh9hD51sLDsHXkNPgObMs2fi8HCnB3U7ROj1oOCU9Tu2gKAxmxxJEkMGjbUEHdEnD5
         /sqV1Oz3wOke9PsjxRSb4edR4ucZSAVAuQVeSysvyM9Ewrs6dWULVgzcfy3zTtFY0kwb
         y/XDFwulKBbRxrwL1WXfm6/FidO+9OOwKfiXaR9tfXleLab8A1vczRX9Blj3sZr5NeHk
         /xQjtNALEOhCGWmUpO0wK39iSB+T8hJ2vXjFJr6U8xlk1ycKAmCfGzUbvaUCiAgZ+Cvi
         Vg9rdDnEvDiq0FzDw8OiRM2UIps//uofTE/dCCOknbc72daoKYCKV6G0JPyQ5s5UBN6L
         e3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773546478; x=1774151278;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfjQYpW2a542mO9fmPx5PN6lFCmDVzdSDPYIU5gG/9I=;
        b=QaicPg3XbC0dnuPnd4SufDsCeLSteGkC59NTWLMSZUSBYjUn8sMfRF9eVR7ZI3kbWU
         FNBnjql+LaggpI3Wv8u89VxaG4uSgYaKR9sPr9JLnpTAHnGbpRKehBJFmp/3euuySoO8
         w+hNEvel9UwDEjnpTG+O8uuiM9rtM9xlPXTHyiBKv9wTxN39pi/GlwdvyAfQRGNsCLIx
         okUiDX7oqyX432N2ch491V+jybrSKsbQT8bAALZE6OZjPPDFDXyyGYK21YOfs0mi/W3B
         l5iLSlTwd02lC8mGDpgT1uL1Md4H7GgbO5PKGMZqOY/EFCRJWSzIi7rJdXgipPUisC0H
         uLpw==
X-Forwarded-Encrypted: i=1; AJvYcCUHu1MzVNpRhnZ1BOyjk9JOehYEfQ4eJix8N4ei61eiFSPmFbyHXcmMzJQzfj7m0CayH1dm3rL3myDfLJB26g2dspKR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vqHZVVzZAQd32/vYXefHanuuRNBmlBq5EwTgAHQFelGc3bgW
	ACYd52GMmLuNPBfdn57S6KH1cfGxFG6FkhDf16M9eDgkopoo5mNGYU28
X-Gm-Gg: ATEYQzz1APj3g2mClEEQBfuAslFLr9xNRwQf72TX4wVAnKX7wJ/uSuWMNGK2/1ir8V6
	Y0nt4USx696SKG/hsesGNjZaSbRuuJ73R7gfAqGz4xU7kWbBemO3zJYg4xKlfZNiCk7sV7xyEGS
	TLjLz0ALsyoYlfU6MJCJlP5ObqKCU6Q/Q7vHLdMAYzRHTIjWARzApkJAf2zdQ/AdJHStnxhlNIt
	HY4hvrARKikqsD9vzBPf5Qla1zE/3O4dAkun/pJRqz1lXjLiXsvw62yRQowjgtv33dB0XxXbQrQ
	9Ewf4sRvo2VQAq2Gm0ULEhyQCnk/7cycp9mBfFnYnyFxjj9tc93kgrh9RpIDCJHZLpMm5lfecaQ
	jmSyrx1TMCqMIJSTZO8L0NWqMAr2lrbIBtAsEFfyimGj1JZIKZTST/4UwkvdDEwjk2StZ7lTUhh
	4Uw3S7RXK6Lw6PbQIJSHO7/N9CiaHxbBV9wh7Ki2ahW0pWbjXooKCSHKLux+maaiuB7uSHjP2e9
	p2iA/tquPNe/w+IC2mSOQ==
X-Received: by 2002:a05:7301:128a:b0:2ba:a1a5:b5b1 with SMTP id 5a478bee46e88-2bea5419e8emr4368646eec.7.1773546478163;
        Sat, 14 Mar 2026 20:47:58 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm8980327eec.15.2026.03.14.20.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 20:47:57 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:47:57 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/8=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Limit_adding_attributes_to_supported_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com> <20260312031032.3467565-5-derekjohn.clark@gmail.com> <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
Message-ID: <AFC33772-1E08-4690-AE82-98E6CF8AC1A9@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 14, 2026 6:26:08 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Thu, 2026-03-12 at 03:10 +0000, Derek J=2E Clark wrote:
>> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolde=
r
>> if the attribute is supported by the hardware=2E Due to some poorly
>> implemented BIOS this is a multi-step sequence of events=2E This is
>> because:
>> - Some BIOS support getting the capability data from custom mode (0xff)=
,
>>   while others only support it in no-mode (0x00)=2E
>> - Some BIOS support get/set for the current value from custom mode (0xf=
f),
>>   while others only support it in no-mode (0x00)=2E
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
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Reported-by: Kurt Borja <kuurtb@gmail=2Ecom>
>> Closes: https://lore=2Ekernel=2Eorg/platform-driver-x86/DG60P3SHXR8H=2E=
3NSEHMZ6J7XRC@gmail=2Ecom/
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v4:
>>   - Use for loop instead of backtrace gotos for checking if an attribut=
e
>>     is supported=2E
>>   - Add include for dev_printk=2E
>>   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier=2E
>>   - Don't use symmetric cleanup of attributes in error states=2E
>> ---
>>  drivers/platform/x86/lenovo/wmi-other=2Ec | 76 +++++++++++++++++++++++=
+-
>>  1 file changed, 74 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 9fff9c1f768c=2E=2E55a26e5617d4 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -32,6 +32,7 @@
>>  #include <linux/component=2Eh>
>>  #include <linux/container_of=2Eh>
>>  #include <linux/device=2Eh>
>> +#include <linux/dev_printk=2Eh>
>>  #include <linux/export=2Eh>
>>  #include <linux/gfp_types=2Eh>
>>  #include <linux/hwmon=2Eh>
>> @@ -871,6 +872,76 @@ static ssize_t attr_current_value_show(struct kobj=
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
>> +	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_N=
ONE };
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>> +	struct wmi_method_args_32 args;
>> +	bool cd_mode_found =3D false;
>> +	bool cv_mode_found =3D false;
>> +	struct capdata01 capdata;
>> +	int retval, ret, i;
>> +
>> +	/* Determine tunable_attr->cd_mode_id*/
>> +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>
>#include <linux/array_size=2Eh>
>
>> +		args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +					 modes[i], tunable_attr->type_id);
>> +
>> +		ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>> +		if (ret || !capdata=2Esupported)
>> +			continue;
>> +		tunable_attr->cd_mode_id =3D modes[i];
>> +		cd_mode_found =3D true;
>> +		break;
>> +	}
>> +
>> +	if (!cd_mode_found)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
>> +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>> +		args=2Earg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
>> +					 modes[i], tunable_attr->type_id);
>> +
>> +		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GE=
T,
>> +					    (unsigned char *)&args, sizeof(args),
>> +					    &retval);
>> +		if (ret || !retval)
>> +			continue;
>> +		tunable_attr->cv_mode_id =3D modes[i];
>> +		cv_mode_found =3D true;
>> +		break;
>> +	}
>> +
>> +	if (!cv_mode_found)
>> +		return -EOPNOTSUPP;
>> +
>> +	dev_dbg(tunable_attr->dev,
>> +		"cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support l=
evel: %x\n",
>                             ^                               ^  ^        =
                  ^
>> +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_=
mode_id,
>> +		tunable_attr->type_id, args=2Earg0, capdata=2Esupported);
>                ^
>
>	dev_dbg(tunable_attr->dev,
>		"cd_mode_id: %#10x, cv_mode_id: %#10x, attribute support level: %#10x\n=
",
>		lwmi_attr_id(=2E=2E=2E), args=2Earg0, capdata=2Esupported);
>

I hadn't thought about using that here, good idea=2E

>> +
>> +	return capdata=2Esupported;
>
>You are casting u32 to int=2E Return it in a pointer argument if you need
>it=2E

We don't do anything with the specific value, we just check that the level=
 is above 0=2E We also don't do anything with the error codes specifically=
=2E Perhaps this should return a bool instead and we can return true if thi=
s is above 0 and false in all other paths? That would also improve the synt=
ax a bit since the function name is a question and that would allow for !=
=2E=2E_is_supported checks=2E

Thanks,
Derek

>> +}
>> +
>>  /* Lenovo WMI Other Mode Attribute macros */
>>  #define __LWMI_ATTR_RO(_func, _name)                                  =
\
>>  	{                                                             \
>> @@ -994,12 +1065,13 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pr=
iv *priv)
>>  	}
>> =20
>>  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
>> +		cd01_attr_groups[i]=2Etunable_attr->dev =3D &priv->wdev->dev;
>> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i]=2Etunable_attr)  <=
=3D 0)
>
>Extra whitespace=2E
>
>> +			continue;
>
>Add an empty line in between=2E
>
>Thanks,
>Rong
>
>>  		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>>  					 cd01_attr_groups[i]=2Eattr_group);
>>  		if (err)
>>  			goto err_remove_groups;
>> -
>> -		cd01_attr_groups[i]=2Etunable_attr->dev =3D &priv->wdev->dev;
>>  	}
>>  	return 0;
>> =20

