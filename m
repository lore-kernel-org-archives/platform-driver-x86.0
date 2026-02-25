Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F22C2EC0AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043063; cv=none; b=q8bsbJdFdHHK0yBoRPYS7bUTCA9+y+XB9vJ6Ql0WL5o2wyAiXWltekWwgDPz3pHwJzkvkM8MlnM3SgAEV5V7gYzYYw/dxqmM4fA6hSLEW/1DLOQhgl6wBCM5wMYXFv1r66oQkoNQ3e7TFc8bavSixYvEKcEZJ6f4e/idPJccwHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043063; c=relaxed/simple;
	bh=/DTq+mu38B5JTYVS2ovUXmlIZA26WuU6CrQ7mayOxpI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dY6nr15oUSoY6UQaf81gn5uwdHZds3B5Xv8xe2bB20PBcTZb1+IjVvLTORpNPXlpItlgcnR5nQUjA14snSP2gepxin2IJTwgh+4A2pqZtryG+4/mEYbXW52dGAU9CEdByp4zzGcmzW+g+MpnivlBQzD5x4ahxyc3L4vnWin8deg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwXVjloL; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwXVjloL"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12713e56abdso883059c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043060; x=1772647860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bi4+5LDlWqkxz4K+29Fb02seelPMRm+o5ZL1AxypHh8=;
        b=CwXVjloLDWwRo07rhy5VqgP4xkC9aQP+Un1/ILlUcm0eAxOVKGFP4DSwD9jVE5vHmW
         shrrEyviSkSisfmV825xaAXMk4eQR1MS5/pAvcgYe+eoC/zOWxPV7M++6B4ZaEpQVlrs
         +YzzSAy7T8pQ20FaCLlyXqTwDCekb2rxWADQ6r7Uum1Nx6owF1HgPA+xrZMwoyybdGE0
         hmEHRvVI8wjehWo2RJUYhgmFyhpIM51tU+UtlFRwG1XHligm5Y43uOHKk/O3dMJ4iGth
         yxNLM4Rrxwc570Bd7TBJD5E98iqXef1rVyZooTwQzY2ClwAEeWzzQLFFYfPYrIHygqZg
         +lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043060; x=1772647860;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi4+5LDlWqkxz4K+29Fb02seelPMRm+o5ZL1AxypHh8=;
        b=EvZ37w7H/ZfnV+OAj/kLMhglrMEtUkg+BkVUJaXDaVLCyfrX1hnIrBm/nHyqpNrKdd
         cjKwywUyBu3qzX014JH1xbH7oWDIIOy6zzSGC+JIsOLXU1KcCO9A0MxfgWnL9Csk+hd0
         6saO25E2DO6P7PHuxud5fbhL0hJ7+9n3BsBT6c10Idvf0+yqe4B1JB6UOwx8tZjj7j0T
         W2CoxDyOA5r7/McjrlFzxWrxIHcO346DQkXbesGr6QhFmc07wmYEjAm5s6YK9VsaT/C1
         FUjPPCR+/sDNl/YMYebCx1d3chk0dU6j1/gPWIFOOjC/m14f5ehTiF6fK1YhfUeKOYxY
         RPnA==
X-Forwarded-Encrypted: i=1; AJvYcCUGx5B3qR0IQpe5bQ30WDnGryrhiFbDnVg9Cn2e6jGMEl/WJSvKAEz5QGwANcrL3XAKLMD+O1tNB4rYWGqoJVy1CmfN@vger.kernel.org
X-Gm-Message-State: AOJu0YyYm7KM6VVXFjbI57hoyLl/0vGoiSD796uza6g8hLezMKR7bUHX
	IahjgcZ7Iec6kAtUqUaVzj/Mh7zvOzhETa0OcGriQ+ETQQCl0ouGCUiliTQWlw==
X-Gm-Gg: ATEYQzx7Zk3UNnqVXO4i/IuGEKSsue/O7n2HlFJmd29MRhlhKdQyGqpPRrev/0I7sKk
	GggfijearTLPRv+muEWHwI4FuIHStPksedwzZATPF7v9rhFtmyE8idcshCuAuEL/93HLaHkgccc
	FkJ6MpFG3e/PwLnZLpM8Mcoh54BJEHtpqqjh+DZa8Z7zHHzE5scmlvSE7t7Kw4ui1U7lDf+6dAs
	YJ+Wtj+oaQ00PZu1rvdXRyT9qaNGk9rJEkbJvlUtGPr129acsZ+taF9SnVf9gCwb0LcTLfKFZAk
	79Ka1OUWMELrDwK3CEGmOixS07FIFQ6yQg41h+2v3ErM1hIM/OXOS00XAIuzps91srjrZbVqDFt
	+6y4MThlBmbTxW0NHvOr0YpOYQgnUhuHxMkhCx5hpEbTVmnm/81ugFmoicjCSxZHlTE0ol6isXI
	9f5bWY07PxMOUCC3atkMhzt1eZ4LAjIlC3gIZADotAfWuxXKyjn4FxDSET1qSpxMS6DfqD5ezYG
	qvPvgQsFSc43M2bbXiUaw==
X-Received: by 2002:a05:7022:2391:b0:11b:2a5:3b9b with SMTP id a92af1059eb24-1277f508a82mr1750185c88.8.1772043060275;
        Wed, 25 Feb 2026 10:11:00 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da4775dsm9436119eec.2.2026.02.25.10.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:10:59 -0800 (PST)
Date: Wed, 25 Feb 2026 10:11:01 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/6=5D_platform-x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Rename_LWMI=5FOM=5FFW=5FATTR=5FBASE=5FPATH?=
User-Agent: Thunderbird for Android
In-Reply-To: <239e134c7530004cc004233cb292851ea6864590.camel@rong.moe>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-6-derekjohn.clark@gmail.com> <239e134c7530004cc004233cb292851ea6864590.camel@rong.moe>
Message-ID: <A29F4591-D06B-444A-B0E8-7B2ACD1EA3F4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 25, 2026 9:25:45 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-02-24 at 04:31 +0000, Derek J=2E Clark wrote:
>> In the next patch a power supply extension is added which requires
>> a name attribute=2E Instead of creating another const macro with the
>> same information, replace LWMI_OM_FW_ATTR_BASE_PATH with
>> LWMI_OM_NAME and use that for firmware attributes and power supply
>> extension=2E
>>=20
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  drivers/platform/x86/lenovo/wmi-other=2Ec | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 67768f6a50e0=2E=2E7f0d5a17b44f 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -90,13 +90,13 @@ enum lwmi_feature_id_gpu {
>>  #define LWMI_FAN_NR 4
>>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>> =20
>> +#define LWMI_FAN_DIV 100
>> +
>>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>> =20
>> -#define LWMI_FAN_DIV 100
>
>I placed it here intentionally as it has nothing to do with
>LWMI_ATTR_ID (contrary to other fan-related macros) and is just a
>descriptive macro=2E

Understandable=2E I think it makes sense to keep the fan related defines a=
ll together since I'll be adding additional LWMI_ATTR_ID defines here later=
=2E

>> -
>> -#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>> +#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> =20
>>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>> @@ -1233,8 +1233,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pri=
v *priv)
>> =20
>>  	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
>>  					  MKDEV(0, 0), NULL, "%s-%u",
>> -					  LWMI_OM_FW_ATTR_BASE_PATH,
>> -					  priv->ida_id);
>> +					  LWMI_OM_SYSFS_NAME, priv->ida_id);
>>  	if (IS_ERR(priv->fw_attr_dev)) {
>>  		err =3D PTR_ERR(priv->fw_attr_dev);
>>  		goto err_free_ida;
>
>Thanks,
>Rong

