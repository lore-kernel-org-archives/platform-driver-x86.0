Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2463E8C7A
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042402; cv=none; b=K1lIALiP4lva0pQkpXI1Lu9icS7hmRqCXQyYnqS/VP08y+tAPkIVoH467dCZG/v5g0CM3OhiVErB7bsxQlF7DiyFmfN7Z4n5/NLujqmJy7oqrOEXoDI2M2r7WFiuyGpypauIjnvUcvKgfIo2/scukib4sNi9J2SqPClrD2R0wEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042402; c=relaxed/simple;
	bh=FRIO39/55fxFJyojBSIqgXLNWUMCgwd52zafLx6e4HE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KwaKdWqP/K6XJtdR196AurtwApIobddYkLaEQmOgZnJf0zV4147QEyeO3zU3WZ/oSsyQoZYRgArmtkYy0fLZmpJqD7J1vZxAun193tdULQ8nzgnQslW5OiEWoV5WME5h8bI/KQgJQDURWeuIQXqWpfeT/QikDFnKz4gV8CLgcew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIWLbnPE; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIWLbnPE"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdc4f2b680so858092eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772042400; x=1772647200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKgTUgdw4TUyYG1B6ZWrOl1nAdYbZKIGuDe2RyVodjc=;
        b=KIWLbnPEaG8L0FPr0JxL6iaHCM9/5iQ2SGDRjHLp17nRKUEmVxuBlwkvpr16Y6uRhr
         mcH/3EPAWrb8X7MwuJlz8VOteqqBTzGCHYCSC1j2rWY1oNIdyXL4MIc5vjiH7DEhhoqx
         l9OmzBKIBwJzlIlAkdiqLp4b8qTTdqTtrfR1VBxArlnuv1Dm6bdpS68/pBj3aj0T/kV6
         rocI5UZHChxXk2czLR/a1Vyn3K//2IzocfgAfgPLJj41MO89e3P1UElwtYhnAZP6iAZJ
         AHa7gtnkAa5G/wV3A2A0RTKOQBprY3mMqdWuaexENnqI2B9eC7MrZ4Z4Cz2e69JR3z0n
         O4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042400; x=1772647200;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKgTUgdw4TUyYG1B6ZWrOl1nAdYbZKIGuDe2RyVodjc=;
        b=MKusSfWTtBhEsHeNnIypi+UZJuTNGj50AAb1cvdB7cifGb3AlOpvMZJ7R+C+Vzymeb
         NTLbV21Hp57uUsXbOU15r3c/V0pFSDNX44fqAzLnKPCrvYppzpRgqasDH4/zsyZgFWKW
         oRQZkvkyOXUkKrntV9S8fvqamIDzx+kOVjGbwRvJyjtkoIPnSyCnSwgyXeLZIqTPb44J
         GDxWZeCW6TJY0cnu6jwt37xCRlffmokp3aKM2ZYH0vWwMs2yCJ1TA8mD8SfqLduXJd/G
         qxDMvZT8OKgqz04P1EZJUuzvkUKsE2BWvDnMVTZYMBa9vU8EePFfnaZib3EK+dRLgOkF
         8jZw==
X-Forwarded-Encrypted: i=1; AJvYcCXijWIAphJNTS+5eA1IxcUio2jJCX2m132yZDPc3DugJbLJuRGHXthqsE0+vto/Ganr/IS2qC1eD84cZ6EVZdhy4xoL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd03a9x38ieWGzsU9HgQtQLiH+kIildP8EjRaVr5xpUIhzzgv5
	ARz/VCJUQtlgb0Nx+xrGpDVN3lsLC/yUiKjs6LrvTWFK41ms+6bVwJEU
X-Gm-Gg: ATEYQzw8n2h4jQbAE0ykAskfSpvqu875nagGiSxgh4Rcnupo0vMfxhTU6DN+3KwGrTm
	gxUKpZjLbwC2j6ZMpbn16oJm35BWgKWiSqNiePijLERn/SzOLnZ0RbmUdHq/WoxZgyCQv4GGBSZ
	fcjoFzXVOMarlJZkKayH823iSxc6D1K5MCZLc2k11QUAoBfyMBjnAculpcceDo/I7D3nQ5lI9rP
	egWRVk3kkQygZODjof4CNRFA+QgZn93hBw7PubKwhTMZZDWrcf2PsRNJ8gzqS1mc7yy5rpRITFD
	dVF3AIUH3L/SOj3UTPyH4p1AIHh2wYc7+vVDTea6NXbaj7T/UHKF6948gPRV3MSpKZzetRRPWrJ
	jEergVDcc8rTxjLAhRdCTuVMvn95EEb2NMao5hXIyauQ7joRhWx/3NNiW7QhYbUcurmneKeZHiE
	SiqRm+NqsfETkUaY2EFQ4Hdshsxkix5QTxxS78vvx+Fsoo8/Dw3DIPhc9nv127lxLHEPmPFJtkX
	YbBL6QZGTyL43S3AiK4xg==
X-Received: by 2002:a05:7300:6c28:b0:2b7:fdb6:ccfe with SMTP id 5a478bee46e88-2bd7bcc226dmr6889365eec.19.1772042399873;
        Wed, 25 Feb 2026 09:59:59 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da45537sm9428564eec.7.2026.02.25.09.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:59:59 -0800 (PST)
Date: Wed, 25 Feb 2026 10:00:00 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/6=5D_platform-x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Rename_LWMI=5FOM=5FFW=5FATTR=5FBASE=5FPATH?=
User-Agent: Thunderbird for Android
In-Reply-To: <feffe361-7013-14a2-093a-8e2d826b2282@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-6-derekjohn.clark@gmail.com> <feffe361-7013-14a2-093a-8e2d826b2282@linux.intel.com>
Message-ID: <D681938E-EF0D-45E4-9E57-75659507B5C0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 24, 2026 12:51:09 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen=
@linux=2Eintel=2Ecom> wrote:
>On Tue, 24 Feb 2026, Derek J=2E Clark wrote:
>
>> In the next patch a power supply extension is added which requires
>> a name attribute=2E Instead of creating another const macro with the
>> same information, replace LWMI_OM_FW_ATTR_BASE_PATH with
>> LWMI_OM_NAME and use that for firmware attributes and power supply
>
>This doesn't match the code change??

Woops, sorry, I forgot to update the variable name in the commit message a=
fter I changed it=2E

Thanks=2E

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
>Unrelated change=2E
>
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
>>=20
>

