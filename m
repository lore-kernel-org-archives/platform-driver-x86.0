Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718092E5B32
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042948; cv=none; b=CKf+iw65HMnJ4mzsy8GhB9sOjyXM7owqsKLLrwdUvP9nRrsLI8oKopcXxCxKpH0kLKjAC7p73fymRHPIB3m2WkZ345juMoV/pyz+cUR95qA2CLfNmIzUZ2d2xvYKSIa1O4uLnKW5tOMhEs4gdKNR8wrNMFj76GuSTDlt58cjAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042948; c=relaxed/simple;
	bh=TYdOYj1E+Vv13HqCA45XHw2Jgq7WR8fBtLNlw0P3xr4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BViYyDyu/wCoNQabfnXBYnfMTXxoa4wdbL0jMMi7jJAzybYxTQ7eYG5YQwZ6vJP9AeUMJkNoPlxOElNzHB7NePRjlyQjSC/U3Nj58Rx+kNkExBEdYUhqhUQJwIL3ZaDNIkes2inJ/dfjZn6aEt8+/e5dSHEDwo/MfouMTTxAXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXhvtbyj; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXhvtbyj"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124afd03fd1so10080034c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042947; x=1772647747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y5zrnrsTqF5oysf9EsUEDfnX6N2SCmvQ+4NzCEnPFCI=;
        b=LXhvtbyj0rBRlUS32At/y+QWrTBWI1aUHF1JMgCFPoFsFFJFx6OEiobPjikFBZUDCX
         BVlv1SvaStOJRYQky0b8pd6nf8RlzchcS5YOM3Gi9TCnrI85rERnPX3T31/8cBJWsUfZ
         BKy+mMintx9ZTF3JqRh0Ep7ip4ORBUE6LWp4KBD5wNg3ZULaFo3qckZKOua2BCWYSn5Q
         OnTEWPYbokb4t0ETw8T8p7qlv3B5ciUM0yBn9LzR9T12FDHk1+f1Iduu9EGelUPw8hdf
         yDgxOGJv4EzzOpxSiKNeJrPc3MMce6tVwEXpITIBVw2jidDNDiHQwdb3eLf0x6AS7XbA
         6x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042947; x=1772647747;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5zrnrsTqF5oysf9EsUEDfnX6N2SCmvQ+4NzCEnPFCI=;
        b=Cq8zIm3F0Tkw9i+EJcKbA1Xs/0/qfR8Stu2r9aLAh/nYFLCZRvOeKNsJ24qBVwuF5S
         zzBX6wme1AjVDydYWdbkrv75q8ictHSHLESzhVSD68oHDo18TbVEbQMKnAxFyxJgYuTy
         VF7psjv3s2cSiA0zO8Et+CcS9Pv1ccKXjTKX6MEih7pEbr+nrts7kGpVUl8+J0KSZgoy
         KFBIT/nYCYplUrqXktVOqZbNV7TYgcuOS6kaOfY0FsVnEb6IAuMJDAT+jmy5DKZBQszZ
         m6w7YbRy6FlhDq1S0yJPjz75FOsLwrilyzsbEJEW9aTIWgA155NL9cpZxwhnA9rmpxW6
         5KjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8sYhqLrBtyzu01IvAX4VQecgfgoj/lnE1gVxX6sxflwMerPt8sYduwcM4Me+tpiszRnU1DBnnpl9SBRbYH3Akd87K@vger.kernel.org
X-Gm-Message-State: AOJu0YwESSN+I7OwmYGr2LYIWt5egf6rwmcZgHedKRbX7BBp0waJ9JN7
	Ekug57g+kmFWbx0/wqedqKIHKNnwXHjC/IZcARi34rtRrsnF+bsUM0CQ
X-Gm-Gg: ATEYQzwyrxSckTMrSwnWVbZr5xUA9hK9rTqSpEWYcjXQ1vv8E8oiulzFWn0eOo/Md6J
	TjoFV+PydY0Stgs1fXAjy90/junIKOLi/xtJ2J0kdgkbRALxboEceRAPo1eEcRK92Vb+H1A5EgW
	i6eQSMklWXWZ8HAsvTi6fo/EUrebbuJgjWkXR5cUEQOxk9Un5POBU1oUe6gf8BzfT4B7SzFvQgq
	MAkxSS8GX+czTaES2D2AEnGvpgKAah6E8/hAM4mzD/N7MMzFCRydTVvvzkAM1iGPDvpBRGhdpRu
	BYaHwKRS9b+7rmVzyFrWLcY636n8F0eAFpXgvlFzWkBBjYYY/4mLFpj1DP6VQqg8EeJmFbuV4w+
	BGWc7xynpgSPKx4uDfsP9NaUlCIaOqzgbHSddv78q5EZh1b/Cz11eTZGQrjtx9WllAtoz9o0deI
	KLvaYcZ15SFnX0wO2LzqhEyl8SfIJFkkAA11W7nDVIAc4oNr6789EOp2GZgQV6cW+eq7qTBLpZM
	dpxZm4LKFH7qcftpMZxmw==
X-Received: by 2002:a05:7022:62a4:b0:11b:b3a1:714a with SMTP id a92af1059eb24-127869586bcmr404323c88.12.1772042946464;
        Wed, 25 Feb 2026 10:09:06 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af204acsm14814936c88.4.2026.02.25.10.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:09:06 -0800 (PST)
Date: Wed, 25 Feb 2026 10:09:07 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Limit_adding_attributes_to_supported_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <4544a2214c9851d2cf0c5515245d9b0a08e942b4.camel@rong.moe>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-3-derekjohn.clark@gmail.com> <4544a2214c9851d2cf0c5515245d9b0a08e942b4.camel@rong.moe>
Message-ID: <F8B109A3-BC8C-4F7C-9790-FC6A841B5B7D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 25, 2026 9:14:12 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-02-24 at 04:31 +0000, Derek J=2E Clark wrote:
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
>> While adding members to tunable_attr_01, remove unused capdata pointer
>> and limit size of all ID's to the appropriate size=2E
>>=20
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
>> +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
>> +		goto no_mode_fallback_1;
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
>> +	}
>> +	if (ret)
>> +		goto not_supported;
>> +	if (retval =3D=3D 0) {
>> +		ret =3D -EOPNOTSUPP;
>> +		goto not_supported;
>> +	}
>> +
>
>I agree with Ilpo that backward gotos are hard to read and should be
>avoided if possible=2E
>
>> +	tunable_attr->cv_mode_id =3D mode;
>> +	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_id:=
 %#08x attribute support level: %x\n",
>
>It's a long line=2E Wrap at the first comma?
>
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
>I don't see lwmi_om_fw_attr_remove() doing the same=2E If we care about
>symmetric cleanup, I would imagine a bitmap or so recording what have
>been created is used there=2E
>
>Also it's doubtful if the firmware always return the same result on the
>same parameters=2E If a broken firmware somehow returns different results
>here, some attributes may be left uncleaned=2E
>
>That being said, I am not sure if we really need symmetric cleanup=2E
>IIUC, sysfs_remove_group() is a no-op if we pass an attr_group that has
>not been created=2E

Hi Rong,
We don't want to query the interface if it was removed, and the no-op is h=
armless=2E It doesn't seem worth it to me to retain that in memory to achie=
ve the same results=2E

>> +			sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> +					   cd01_attr_groups[i]=2Eattr_group);
>> =20
>>  	kset_unregister(priv->fw_attr_kset);
>> =20
>
>Thanks,
>Rong

