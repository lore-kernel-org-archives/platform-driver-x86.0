Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB774120E
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AnGsQ19l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704717070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gp3UNv8Vq0x7Q9RkAN1Af3Vf7lQiP7anBZtHFuSgMx0=;
	b=AnGsQ19lm/GFR0A6q3CnUfhA0ZjykWQ4efrW7Uk6cvksPeudVdp60MZeIFJYXWzK7/pe61
	AJKmYpiJXrUxyuvinupVNAZdb6O2p6ddTqTr23BaM6nH2cXRATr/YstL5rQcHYkrfQLsFk
	Oj4gvSJIsJZ9I8NuVc52TSN1ZCjpqqw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-MI0UikKMPDGwTyMcghsK6g-1; Mon, 08 Jan 2024 07:31:08 -0500
X-MC-Unique: MI0UikKMPDGwTyMcghsK6g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a28f771661fso91427666b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jan 2024 04:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717068; x=1705321868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gp3UNv8Vq0x7Q9RkAN1Af3Vf7lQiP7anBZtHFuSgMx0=;
        b=tCzJvwjTvOnXnlsePUA74zS3vlH28U2W0sq8LBaOtEYnDTKPTuOEx71Lio081Mi2Jq
         xuwgoTUBho8FhPZXGBzgEd6JtHJ0cDTmZ7bw45ueP+nMgqI0Wa6Syc5yVpuP42naZzi2
         QLIF6HO3FE0ZVrOw4K8kis4Ww5AoJPyD7l9jP0BChhOcs440vVOXKA/gYsIRfL8dr3ok
         2sk/JGMDDrHDGPUl/sqmiSiprNQQrX+15DR31VLzopIjdhE8vLWkHINIsYmc5BRmbZm3
         dFoRhQVxofy4G/0wOT0nkak8WLe/CrA81V7atTFvN+qxH5CXQx863tvT6/4czm0NV4Gj
         ZhmQ==
X-Gm-Message-State: AOJu0YyKU+qMI2xZt85c36jgQbO2ow1mumuJ5labeT6ZZGf1UnQzHjyB
	ka7+ctMicCBCXYOwYGFqO9m+JuWLfuI1irXTMZjpmn5YfB1x9u9nN/cJwW09FauVyFtxHt5jUEa
	nCZaSuLqzDHThRM4d3hEtgrgKpXGzG3kexMi3Rkp3CQ==
X-Received: by 2002:a17:906:eb18:b0:a2b:6c3:5ba0 with SMTP id mb24-20020a170906eb1800b00a2b06c35ba0mr106694ejb.144.1704717067877;
        Mon, 08 Jan 2024 04:31:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+yDQPB6vndpAexmCcCh+Q1ZWETkqarjodKQIoZiw+/kDWRyDVNo/pJIcR0gzPCGi8FcNwZA==
X-Received: by 2002:a17:906:eb18:b0:a2b:6c3:5ba0 with SMTP id mb24-20020a170906eb1800b00a2b06c35ba0mr106682ejb.144.1704717067563;
        Mon, 08 Jan 2024 04:31:07 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906318100b00a2a632e4eebsm1436012ejy.119.2024.01.08.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 04:31:06 -0800 (PST)
Message-ID: <e945120a-8968-4086-95b0-32f13ca0d9f4@redhat.com>
Date: Mon, 8 Jan 2024 13:31:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] platform/x86: pmc_atom: Check state of PMC clocks
 on s2idle
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>,
 Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, platform-driver-x86@vger.kernel.org,
 x86@kernel.org, linux-clk@vger.kernel.org
References: <20240107140310.46512-1-hdegoede@redhat.com>
 <20240107140310.46512-5-hdegoede@redhat.com>
 <8fbc514d-b660-d45a-38e8-fc9fa560c8f8@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8fbc514d-b660-d45a-38e8-fc9fa560c8f8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/8/24 12:27, Ilpo Järvinen wrote:
> On Sun, 7 Jan 2024, Hans de Goede wrote:
> 
>> Extend the s2idle check with checking that none of the PMC clocks
>> is in the forced-on state. If one of the clocks is in forced on
>> state then S0i3 cannot be reached.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Drop the PMC_CLK_* defines these are defined in
>>   include/linux/platform_data/x86/pmc_atom.h now
>> - Drop duplicated "pmc_atom: " prefix from pr_err() message
>> ---
>>  drivers/platform/x86/pmc_atom.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
>> index 81ad66117365..d04f635c4075 100644
>> --- a/drivers/platform/x86/pmc_atom.c
>> +++ b/drivers/platform/x86/pmc_atom.c
>> @@ -477,6 +477,7 @@ static void pmc_s2idle_check(void)
>>  	u32 func_dis, func_dis_2;
>>  	u32 d3_sts_0, d3_sts_1;
>>  	u32 false_pos_sts_0, false_pos_sts_1;
>> +	int i;
>>  
>>  	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
>>  	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
>> @@ -504,6 +505,16 @@ static void pmc_s2idle_check(void)
>>  
>>  	/* High part */
>>  	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
>> +
>> +	/* Check PMC clocks */
> 
> Kind of obvious comment, how about:
> 
> 	/* Check PMC clocks don't prevent S0i3 */
> 
> Or
> 
> 	/* Forced-on PMC clock prevents S0i3? */
> 
> ?

Good point. I have gone with the "Forced-on PMC clock prevents S0i3"
comment.

Regards,

Hans


> 
>> +	for (i = 0; i < PMC_CLK_NUM; i++) {
>> +		u32 ctl = pmc_reg_read(pmc, PMC_CLK_CTL_OFFSET + 4 * i);
>> +
>> +		if ((ctl & PMC_MASK_CLK_CTL) != PMC_CLK_CTL_FORCE_ON)
>> +			continue;
>> +
>> +		pr_err("clock %d is ON prior to freeze (ctl 0x%08x)\n", i, ctl);
>> +	}
>>  }
>>  
>>  static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
>>
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> 

