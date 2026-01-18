Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B03BA34
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jan 2026 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759108; cv=none; b=Ez7TjvdxOhvw8khAHe1jxoi4ZwWBNt5wr/zAGRbyl6rMQawhuqKyJjhbSWMPf0ljgOE+2kiya/Q17zsn4+xo6iBz68iQIZmrbVgPDCp8L4UF9xd042spXpBWwhXZGOMWp99KOzj6RT1slJNvwpz3ScRFxkD9nLPtJJZJ2MJS2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759108; c=relaxed/simple;
	bh=rOVC8jxswWb2T4Z0g8a+6WwBGSkdOf5ibuAAow6pqGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRumTNRwjJXYhzLINn3z207sasqvlcsmnzCm7CqMovW570P2B4pjC/dYlSrBbexxLmjUgiavW8qmYtK+L//Ty3zbkPXgdUo5Sdachin4WXoiS0fRnRJPBl8Iy+NNDZ8F8LsD5ccu/DvKSAgWjzf0ctHjm9cSkPfs5mNsP7NE4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGmj3zPV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGmj3zPV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-598f8136a24so4107772e87.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jan 2026 09:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768759105; x=1769363905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2CTlTN2uu1pdeMB7v3S2dD/BdhNBasD9g6dEiEow3Y=;
        b=hGmj3zPVEwbRGsJ0fEyq8Gsh1kBYezCBMRE1Pa4J57v/BS+sWxFTZs84RMgqyBTgKk
         q2w6Hx0PhZRK64RXh+YNZy/5Efl55ASh8mxjC4tMdCKeRvjYg1wCaakytYzsgYjTiS+s
         eVp2Qdh28UYyvUVZATN4C/vG0rhAX+UGDvNJAPDT4LfqdnlxHe8RS3dlVByE1vPLCqYU
         eMnSlKWBCFPLd2e0gado+9SiwYNKvLSVS4zjNgmoT9XlKHAdYDUs3bphk0gF0v9e3Ena
         0ZdhjYkYWvCS7qCm44o9u470CJUg/PaVk4TBX+EwbmY97Z/N3Kb61btp8/hOroO/uRYM
         HJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759105; x=1769363905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2CTlTN2uu1pdeMB7v3S2dD/BdhNBasD9g6dEiEow3Y=;
        b=xEjthm4Dwq00COif0oSxRNo0PnbHGtepk9HNyuHYyC/lQobDzhp2Nd5HkMIXqhYEhf
         VdW0T1SlAGEDAH4yBJ/iDv/MIBl4esktlUaK1EyuOIrl8XBb9gTnRxARVdI4oTbeqohi
         e2QbjimCmbxpxKf6OJDLyBk8lHrocHxqmcAmGO4Y6YYKy/nOkwjdTAX6/QsO6Ms18hqB
         TU/ZyYUmxXx5G+2jLbfdAtpUaZ6NrAuABXgflRwzytiieHfxg2jlsRmICEVQCRisclte
         cgA3eCuCShhBn9i2SFSddTOmfYBJ0Ifz8GElniUYZGr8A2/5a+P2X4Zp8LoRTos/fJNY
         MzxA==
X-Forwarded-Encrypted: i=1; AJvYcCX6P72gvybn6/e3ltdZq8/ITMiNnddPBZyQWN/qeIAPYT0yjV1e2YEKIDPApeLQs6zzuteGm7vVoNDnQJo5d48ePzjc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh04W32pUo8ZIUivrLOgtsCaejY7lf0AWjEjfPxR6+2Qx3eH/e
	CoqL4n27xeVNRNwfclVhDtTdXNfAs1xvcFvBIsdJGnoFvoiCJPcrlOhc
X-Gm-Gg: AY/fxX7w6Nhl1oKQlLwAT/49fxa+4qR/psgxzGflcyULtlYxfhxJpY6hkz6kadh5Umg
	jWfXPOEcIjzNgoW0w8HCj4uidpNncxbJt+gI7RuBu2ClQJDONIkfbfxTmdv4ZtfPodUtUO7m6+s
	fPFPSD05L+4RZlVPUkJyBSmMka9klf/sSlSZMWzhXYNFnfPKu78RydWh+ylxcKzOL2OEvahe7jP
	P6isza3tYBdx/kpkElxsytWBsb+26PV87+0VYkO7C8XATvMYB2E8R6byP/LTLZ3tBtDWWnUuWe2
	iG7BR5nRCq6EwKxHrnKsxw/vLBHuJV1AMGv5/uAFfR22JSoGwUenqnpMecbtLtue5iCt9/eGurr
	d4tF+sPqoERxNLV6Z03A+GIKnKwJTjYJ2nLAL+HOFLm7FUcwxrgtNk/PeYzo5yaS+8sLUkLArWk
	les3Q90GkSugjYJaMPmY4gtpq1YA==
X-Received: by 2002:a05:6512:3408:b0:59b:f5f9:7864 with SMTP id 2adb3069b0e04-59bf5f9793emr1518867e87.28.1768759105103;
        Sun, 18 Jan 2026 09:58:25 -0800 (PST)
Received: from ?IPV6:2a0c:9a40:8950:800::67d? ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbe6c1sm25325281fa.22.2026.01.18.09.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 09:58:24 -0800 (PST)
Message-ID: <1eff30f0-f619-419b-ab26-b8c68cad87df@gmail.com>
Date: Sun, 18 Jan 2026 22:58:21 +0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Introduce option to disable
 Smart PC function in PMF
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20260117200819.12383-1-xglooom@gmail.com>
 <20260117200819.12383-2-xglooom@gmail.com>
 <35a7f364-a89f-4625-82e2-03c1fb42ec74@amd.com>
Content-Language: en-US
From: Alexey Zagorodnikov <xglooom@gmail.com>
In-Reply-To: <35a7f364-a89f-4625-82e2-03c1fb42ec74@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the inconvenience, it is my first time :)

Originally bugreport here 
https://gitlab.freedesktop.org/drm/amd/-/issues/4868

But it turned out to be not a real bug, but rather a feature of the 
firmware, which in my case is not desirable. Would nice to have a toggle 
to disable, instead of completely blacklist module.

Should I send v2 patch with a new message?

On 1/18/26 20:20, Shyam Sundar S K wrote:
>
> On 1/18/2026 01:38, Alexey Zagorodnikov wrote:
>> Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>
> Please include the context in the commit message instead of the cover
> letter. Additionally, if there are any bug reports or issue tracker
> entries (e.g., Bugzilla) documenting the problem this addresses,
> please reference them to provide justification for the change.
>
> Thanks,
> Shyam
>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 8fc293c9c5380..00a4fc899c727 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -53,6 +53,11 @@ static bool force_load;
>>   module_param(force_load, bool, 0444);
>>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>>   
>> +/* Force to disable Smart PC Solution */
>> +static bool disable_smart_pc;
>> +module_param(disable_smart_pc, bool, 0444);
>> +MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");
>> +
>>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>>   {
>>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
>> @@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>   		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>>   	}
>>   
>> -	amd_pmf_init_smart_pc(dev);
>> -	if (dev->smart_pc_enabled) {
>> -		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
>> -		/* If Smart PC is enabled, no need to check for other features */
>> -		return;
>> +	if (disable_smart_pc) {
>> +		dev->smart_pc_enabled = false;
>> +	} else {
>> +		amd_pmf_init_smart_pc(dev);
>> +		if (dev->smart_pc_enabled) {
>> +			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
>> +			/* If Smart PC is enabled, no need to check for other features */
>> +			return;
>> +		}
>>   	}
>>   
>>   	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>
