Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F72309B2
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771140178; cv=none; b=dzlbNHBtL8MUleKl42i4KVrW2PMh9dTJTHThEucnwHmbnfD+gdSZhFMHdFH8BKwxB+Vy0TQt71uKwxn/LXxM6U27FrmtEHwpFG5fVZK3hosojRIgp81SSJBHivD3eqHnlp+jdQGCVshcmdbzcpdPIumHXS1dcw8DaiJq7Js7P88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771140178; c=relaxed/simple;
	bh=RN3UAsrnKn4BgbTQxenUGRY8urTGtGi5We2zwDrbht8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=U5fAaENcMUtC2ESFdHorqTcfLEIlmS4LmRDyjl6Bp5h2Ah4WU0hll1nBnZT3f0/26b1ePay9M2m5e+etsy2+jq6IoRgTyRTgYSW3aKmyU3irSoNgUARoCSa/5K6t9XJWky4NlljC+xXjVjfm7jr1aEPUkUeZ606R+WPN2Ui0pyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I866WUky; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I866WUky"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso2224703eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 23:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771140177; x=1771744977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WIwWJJ2QF9gKSYKIGMtLoAobv3GHopsB9VCcH4pbcCk=;
        b=I866WUkyRs/hnIKGAZCSKpKKRng2AYqRSrIMozgnUFQXZLf+kx+rFweydntfXnTCyv
         TSU16/6OISMtF0Vz0EwLYz10qOW8XN3ufrQjJijAgJ599u1jJIa7XHnABGbIeSPcQFUD
         cPutyMGX52ugEBI5KXNz5dTGMQ88lltOVJwYWlg4EIb7PvmKgvoPN3fjQ/nOt9dXdLfT
         Dglk6kqavTJ7NH2CsYVEDUAAaRGco/9DblpKAmNGz4j/g33eFRZY0Ew1QUvKhYjc7u8B
         NSeW/SQeTEy3bsnS83VJ2zwZ+X1w3nifNdtA06XJ/vxqJt36j9cY4QC1Uj957PVIibdz
         OyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771140177; x=1771744977;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIwWJJ2QF9gKSYKIGMtLoAobv3GHopsB9VCcH4pbcCk=;
        b=PeYWykq7qrjTtZZb8X/E1oEuWV9Osc085OGzS8OzabZWNhOhHDJGyN2WYeXw34cTN3
         owuIg/K11dIn1bDtMwFPPLNbK55BMdYeXIdlG3EH33JSO7BvvQGbU3PRxxP7ewiDrMlp
         q08DClkVwuBb96BYczjTkPqpJrzXQnCB+H058F0ivK7B7QUX5jhtIjcI1XkE3UFEijeJ
         LpiQYi1lF8pUyRk7NDdRpsq8eU0i5BiTU5sB6XhqTKZfcF3yC8Xbtf5Icw+vUunaODJ6
         1e+lMDCSoLCl0HtZ/5bS2pZLO8ZQ6wzIo/AJe5T9N9LD1lAZUwPBrStp1zkpPgaacORW
         O4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX6uEN733y1sr6ZJGDchhsKUlVZmaZNR6Srp3ZHTgx34coGFgaEX7B793HTyYqpYh7q2/KsT6gSeOz0W4WM8KcLjvnh@vger.kernel.org
X-Gm-Message-State: AOJu0YxomrElhURcJnTOwSRJ9T0KqhBcjVtno/wtFZZOOOPaeF3QefMd
	XbvQZdN4/AmsStXEY5gSE9kKh0DFqpJ1h5URF5rwVQ+Z5m3ko02d1j1y
X-Gm-Gg: AZuq6aID34c2J2TYywnAU55SJ3DRlzFOkrhES4hMWdzvzw/J6XMRQ4pvSngd1zdtpli
	N56vZPl2nhuwZ+WBWmFMf8WwUrRnH91szPq3FINJcspLP1RjoEO2OCpMhZ6OlBKw024aJY4dGAv
	3Bn4opnNxfnnxaDK8dMHU+yhrVZ5WGx+BT6nOAODrDFP2odKfszKTytYkJYlIXYJ6d5XxLxuR4F
	W3CMAYFrLrxyQntKMXfGxI/vXd4u/bLG1uguWPB7XAQMYr18MpQky/+zdrLQdfrdeq/96+CB7jh
	tW6eUVl/rqcmueMmqyIygXwPlxKGyARVd54TgdA5drq+/u8fWB04bkVROGm2WPVEPcpqNTBClFL
	CNTTXAXux6OXdqn+BGdg2utCwCcnbdPJNUoM3Pj9p1+Pi6CXmuNqD0S1yO4iHced66W5eSzjlzh
	NgsfoquzsvD9HZUot813M8pQfwmytl9Ir59E3zWE+bp5AgVLhqWoGhxwhyYXmhFOLhCHqT6xfF8
	+DD49u4U8LtEAnRHcIg2g==
X-Received: by 2002:a05:7300:cd99:b0:2b7:fdb6:ccc2 with SMTP id 5a478bee46e88-2bac9356631mr1663647eec.16.1771140176763;
        Sat, 14 Feb 2026 23:22:56 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb67bc16sm5073002eec.32.2026.02.14.23.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 23:22:56 -0800 (PST)
Date: Sat, 14 Feb 2026 23:22:55 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_5/6=5D_platform-x86=3A_lenovo-wm?=
 =?US-ASCII?Q?i-other=3A_Consolidate_name_into_single_const?=
User-Agent: Thunderbird for Android
In-Reply-To: <DGFC895HL78M.16RQMINS8UI7O@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com> <20260215061339.2842486-6-derekjohn.clark@gmail.com> <DGFC895HL78M.16RQMINS8UI7O@gmail.com>
Message-ID: <CFC00BC4-59E5-4D93-933D-21AE0AC6405D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 14, 2026 10:56:24 PM PST, Kurt Borja <kuurtb@gmail=2Ecom> wrote=
:
>On Sun Feb 15, 2026 at 1:12 AM -05, Derek J=2E Clark wrote:
>> In the next patch a power supply extension is added which requires
>> a name attribute=2E Instead of creating a third const macro with the
>> same information, replace LWMI_OM_FW_ATTR_BASE_PATH and
>> LWMI_OM_HWMON_NAME with LWMI_OM_NAME and use that everywhere=2E
>>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>>  drivers/platform/x86/lenovo/wmi-other=2Ec | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index 876834af838e0=2E=2E8e52f692f8605 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -92,14 +92,13 @@ enum lwmi_feature_id_gpu {
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
>> -
>> -#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>> -#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>> +#define LWMI_OM_NAME "lenovo-wmi-other"
>
>Hi Derek,
>
>This name doesn't work for HWMON because the core forbids dashes '-'
>(see [1])=2E
>

Ah, well shoot=2E I'll restore that in v3=2E Attention to detail=2E=2E=2E

Thanks,
Derek

>> =20
>>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>>  static DEFINE_IDA(lwmi_om_ida);
>> @@ -454,7 +453,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *=
priv)
>>  	}
>> =20
>>  	priv->hwmon_dev =3D hwmon_device_register_with_info(&priv->wdev->dev,
>> -							  LWMI_OM_HWMON_NAME, priv,
>> +							  LWMI_OM_NAME, priv,
>>  							  &lwmi_om_hwmon_chip_info,
>>  							  NULL);
>>  	if (IS_ERR(priv->hwmon_dev)) {
>> @@ -1253,8 +1252,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pri=
v *priv)
>> =20
>>  	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
>>  					  MKDEV(0, 0), NULL, "%s-%u",
>> -					  LWMI_OM_FW_ATTR_BASE_PATH,
>> -					  priv->ida_id);
>> +					  LWMI_OM_NAME, priv->ida_id);
>>  	if (IS_ERR(priv->fw_attr_dev)) {
>>  		err =3D PTR_ERR(priv->fw_attr_dev);
>>  		goto err_free_ida;
>
>[1] https://elixir=2Ebootlin=2Ecom/linux/v6=2E19-rc5/source/drivers/hwmon=
/hwmon=2Ec#L910
>

