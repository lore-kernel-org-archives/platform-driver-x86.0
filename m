Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8692139D12
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802097; cv=none; b=Xms77uClH2HKM0S1sm7wARl+SHI75SFICyaID+S2M0R/DCzWQit4QMZV0VpvYchJNSO9alOp/YPOv0qtU0ZaiOd1347aTBaIGy1U9NWTW0cbF/dgrXKOEKQ+VCKJ46kUKZv2ASPI4zl7blWL6KUUDjrWNfOsPOwJqkRdgVx7L0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802097; c=relaxed/simple;
	bh=5Vq7J+5zhQo+Zq03AHqg0Rzqfn8744Xid1USSyJ85AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S39g/dIiF2YCiJYa0cWIQuh8rbvc2l+fEh6s+Hk9BP4WwIg3nNEVg5jYkDN+O0+1Lu2cuwH2UF8QaBAttC4jE67JSfohRzqhf+6/sE8yWqzRQiPpQ1ceGjuXm8idBsHYuh5hFRT6yGw9K8khFA50pzo/nfh6hzd2WUUyn4JgrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AzUkYn1s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AzUkYn1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpMt3bOE9Lg+dgQZ2Srx/Psm3Xoh0lrwhySGWKTB4GQ=;
	b=AzUkYn1sbKkZPArtUD/fIgUQTOMnrgoUDb6YvW/VvjWZk7VzdKolXmSn5/sSp3vuovos9G
	7/Eaxp/axyeOug9u/fo1B5nt0VpuKeULw3go9Ja0EN/xe32Mw+4Oo+MfhRgNdVx5kYXL2v
	Zif06uT3uIgk9UoVOjUs8LBOg9hdRdc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-GBDJtsOeM-SyUKwI-_6AnQ-1; Mon, 27 May 2024 05:28:12 -0400
X-MC-Unique: GBDJtsOeM-SyUKwI-_6AnQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6266ffe72eso129572566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802091; x=1717406891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpMt3bOE9Lg+dgQZ2Srx/Psm3Xoh0lrwhySGWKTB4GQ=;
        b=iQuEKfqOGdlZvxGLJhownkPSAZDyfazPNWs2mGy5mjRjwLsHf4+Um6Oy5zMEPcEGnl
         LCrKTeGGkINlyuW510XD05+Rup65CLTStJOjRNLkuxhJotk+mHqp0D4w3yrx4N7rT9JP
         O39q2pV0Yw1UYp12EzD6ek+Oo11aLHvvo6o2TpaUXLHjm0UjQYT2SMKmRSB2AXoueZvm
         AjOx1E73A0yA6mVGxPJaqeaGuAlFUK48Y+ikQfdDx9Mc4RG3YP3pEmOwIRFIr/sEpiTp
         633HzKtQu2NulDm0Em384/FI9bY5hQL/NuFAdFlVuSHMb9hkRsO4Fn3dwgHXiYWlYekw
         6J/w==
X-Forwarded-Encrypted: i=1; AJvYcCXS5PTF65+U7M4Sc2HDU5qr6sXQZOSb1ezzDF0XTr9BuRcCGIAlVa5BZhoURd+5izu2HPGZdU8jlazGHH9XYdKCP/nvBGmdR9iZJCoEMny/TQE9pw==
X-Gm-Message-State: AOJu0YyHTczLM3JFoRMrj8Cv84DwtjkyzSQBZPFXCWOvwMH9YVMXH91K
	WszaWysN7gvbD4ZtQAoGrHxm8Sg8ExN91GhVdnKZnMnU3/D8gKPg42/lI0+XZhnZIzAtOaIRLa5
	QmvjojTmhI4ktvrgGMpQJxp4DZKWIa65k+zs4jBJGrZLNmHj+wVL9VLHcZR/ON04jKYDdOSQ=
X-Received: by 2002:a17:906:d961:b0:a62:196c:b2af with SMTP id a640c23a62f3a-a6264f01e2dmr597099866b.52.1716802091360;
        Mon, 27 May 2024 02:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLNm28fjY+dbDIhM/xdYsyjTCAdYmj0YTCDQMVhEDeS/wFENAm4ZXWZPLgxWJovcFyDfoy1w==
X-Received: by 2002:a17:906:d961:b0:a62:196c:b2af with SMTP id a640c23a62f3a-a6264f01e2dmr597099066b.52.1716802090929;
        Mon, 27 May 2024 02:28:10 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c818152sm479393166b.13.2024.05.27.02.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:28:10 -0700 (PDT)
Message-ID: <61a6d12a-799e-4a12-aad3-f0f4a419e6cf@redhat.com>
Date: Mon, 27 May 2024 11:28:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Add info for
 GlobalSpace SolT IVW 11.6" tablet
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, hmtheboy154 <buingoc67@gmail.com>,
 Gregor Riepl <onitake@gmail.com>, platform-driver-x86@vger.kernel.org
References: <20240527091447.248849-1-hdegoede@redhat.com>
 <20240527091447.248849-2-hdegoede@redhat.com>
 <ef8a614b-3079-13a4-b223-23e1ef2bec7e@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ef8a614b-3079-13a4-b223-23e1ef2bec7e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 5/27/24 11:21 AM, Ilpo Järvinen wrote:
> On Mon, 27 May 2024, Hans de Goede wrote:
> 
>> From: hmtheboy154 <buingoc67@gmail.com>
>>
>> This is a tablet created by GlobalSpace Technologies Limited
>> which uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB of storage.
>>
>> Link: https://web.archive.org/web/20171102141952/http://globalspace.in/11.6-device.html
>> Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index b021fb9e579e..6c03e7daadd4 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -900,6 +900,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
>>  	.properties	= schneider_sct101ctm_props,
>>  };
>>  
>> +static const struct property_entry globalspace_solt_ivw116_props[] = {
>> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 7),
>> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 22),
>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1723),
>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1077),
>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-globalspace-solt-ivw116.fw"),
>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> 
> So you're planning to route these through fixes branch?
> 
> Just asking this because you've the other patch in flight which removes 
> these max-fingers entries (I know it's not harmful to have an extra entry 
> but just trying to synch on the intent).

Yes I plan to merge these 2 through the fixes branch.

I'm still discussing how to merge the removal of the 10 finger entries with Dmitry,

I think it might be best to merge that through the fixes branch too (after
rebasing it to also remove the 10 finger entries these add).

Regards,

Hans




