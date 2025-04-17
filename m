Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10A22652E
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883530; cv=none; b=pb2wOULU9QM2FOeux9r3KBlaf9jazp4anK5XMUEBNPUwdtxmTIiiS6i+NP7ioqJp/sDKBp1hvIXTowQWZ3wHMl72u4Z2dS7RLorH4MLLQMdi7VVBi9odl5y0CBuD6LUIG+YRq7dLTCQxBBGf1i2g3kmdfgEQkpHriQHwf4ryTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883530; c=relaxed/simple;
	bh=gzyB0gehaCw5mwBKeA4kasPlyex+4nSBFbJbR1kusug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk/alnw33KzVBGM0sX/z2qzPPHKGXoAJHjHJDwcz+yfAEaTXAWZB5SDmLSU/aIb99M+ARJ9I5iM/XtJmtw5KSV1+TQ/msufZGYsUDwyErovI9cPLjwnhdvqSv/sgB1XjLwfM5SR0q/8nDyq4RM1qcs5Rgni3oZq1NFBspHgDGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZ1uY2FU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZ1uY2FU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744883527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8N1zpzvBZKYjt/vb1x99uaabOfxhJmPIjjRyGYjDDU4=;
	b=DZ1uY2FU3S3rHIHdnhEeJWHedLMyHyn+KYlmzOmzcrQ5fU9H9T3pr8hReqUMFle0spfcm9
	D0aHvNRBKyzBwmR+tSQtenxgmCOnOXdzcoxAII/RGyclg7ufynRZpHnEIo8WoHNfH1rHK4
	AwkjEAywdL1SDa5GrKKWGQyjv0KUGRU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-4X7Ik6MwNEO7hCC4eF-Wkg-1; Thu, 17 Apr 2025 05:52:05 -0400
X-MC-Unique: 4X7Ik6MwNEO7hCC4eF-Wkg-1
X-Mimecast-MFC-AGG-ID: 4X7Ik6MwNEO7hCC4eF-Wkg_1744883525
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac293748694so48132266b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 02:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883524; x=1745488324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8N1zpzvBZKYjt/vb1x99uaabOfxhJmPIjjRyGYjDDU4=;
        b=WzyHOW+jv+Q4KnwWj99/Qczd6y15JQvAZs5iuKfDTdASW0kH8TFIfkD1g+st+y1LKV
         QP0Yynr0eT83IrelEOzHbLmL7DKxpMIjGd1kTf9sbdRFja2Rr1mnZFT3nQrDEQDttUow
         oFI+WylS3+QuEM+v7auAA4xd1T0DApJ0hrouXfcYA47jMC45NfJOKpttG801SGtHimxG
         /p3+b5iOp95mvc41V0HwePheSZdxfSnzUVpUlLqQlifbuKfW8PFsA3LJ44msJ56b/B8j
         SXA7P0szCUWo7F92K0LeUeE1C9ivsm+a5invPhoEX7cnO9bBWqgEjjd5ma+czwz7jfMW
         TeSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUirUhd491ySsJ6zV7+EeG5gxEjs5HZ57i64/KY8fhC5Lwbv2NfW8nXV/Bf7EGpmKgtvuuVkcGdNt+mwypsrS77FDLc@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIESr5CzkFeHIugHdIOBD5yY1tF/yYqn+O56s3kN+HFOoPXh3
	aJXnyV3ckniaGz9AuETMT2G7Ixs9WXDvwIX3kFzyrteFd90AP5X105+uGAKrpYvVUYgo+drHGvi
	tHzGiLoFfezfybbN+vsjbt1NBZsI5/T4a/PuxISyZhxl6+PtlEpzw61PmCMeWrGrkYTeEUoM=
X-Gm-Gg: ASbGnct3PEAed4EQx3lP4t/omBDaCMFpHM/VSf53BY4DFVxPfNJi5sH2ZP+Fla39API
	u3pnQzjs+FezBrSHuWv0ztO7M9ENgVl+nF+UlwishJPt92HhMl6QfcRInxsy3fk3qSOx3LR4IH1
	YLOmDFYQQAzJxpWTASf/qbGWbo9ci1VbdZihOzZLxFm5suxUVbepHmA4r3932QHh4f9Dj0mwx3h
	QD7qwxA3dxw5om7pkWV2QtED6p1VBdwPA0mckevQhrcsHFU/i/xKy3E2IafPRL7oiQAb38mEny7
	mETfX3ADUSlu++jY91HTyOr3TWOi1Z+PUVFVMfFHU1GwJ7ZYgq54/fl/pB0kKcMOR6kHJe4ejwG
	P7IZucrC8+2j+hUUaWEUohmDjXFs27aBEaFwjDfxH2ta5YMSAS1TqfMoe7SG1Qw==
X-Received: by 2002:a17:907:9712:b0:ac3:bd68:24f0 with SMTP id a640c23a62f3a-acb428797b2mr517528166b.7.1744883524647;
        Thu, 17 Apr 2025 02:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXNLsP6ifLmKb1ZKvTZ4XUyTG0SnIKVT4eg+KQS6bmOBXd5VrGhu9N8HpD+AYKdhNGaRUTjw==
X-Received: by 2002:a17:907:9712:b0:ac3:bd68:24f0 with SMTP id a640c23a62f3a-acb428797b2mr517525966b.7.1744883524238;
        Thu, 17 Apr 2025 02:52:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6267csm265250166b.9.2025.04.17.02.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:52:03 -0700 (PDT)
Message-ID: <8e6481f1-031a-454e-82a7-acd03826c915@redhat.com>
Date: Thu, 17 Apr 2025 11:52:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] platform/x86: int3472: Make regulator supply name
 configurable
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-6-hdegoede@redhat.com>
 <Z__zVTnMbJdkmyf3@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z__zVTnMbJdkmyf3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 16-Apr-25 8:13 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 02:40:33PM +0200, Hans de Goede wrote:
>> This is a preparation patch for registering multiple regulators, which
>> requires a different supply-name for each regulator. Make supply-name
>> a parameter to skl_int3472_register_regulator() and use con-id to set it
>> so that the existing int3472_gpio_map remapping can be used with it.
>>
>> Since supply-name is a parameter now, drop the fixed
>> skl_int3472_regulator_map_supplies[] array and instead add lower- and
>> upper-case mappings of the passed-in supply-name to the regulator.
> 
> ...
> 
>> +	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
>> +		const char *supply = i ? regulator->supply_name_upper : supply_name;
> 
> But this won't scale, it seems it relies on the fact that
> GPIO_REGULATOR_SUPPLY_MAP_COUNT <= 2.

Ack, I've added a static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2)
just above the for () {} for this for v4, as you suggest below.

> 
>> +		regulator->supply_map[j].supply = supply;
>> +		regulator->supply_map[j].dev_name = int3472->sensor_name;
>>  		j++;
>>  
>>  		if (second_sensor) {
>> -			int3472->regulator.supply_map[j].supply =
>> -				skl_int3472_regulator_map_supplies[i];
>> -			int3472->regulator.supply_map[j].dev_name = second_sensor;
>> +			regulator->supply_map[j].supply = supply;
>> +			regulator->supply_map[j].dev_name = second_sensor;
>>  			j++;
>>  		}
> 
> With that in mind, why not unroll the loop?

That will lead to code duplication wrt the second_sensor handler and
it will make the diff from the previous code bigger, so I've gone
with a static_assert() instead, as suggested below.

> 
>>  	}
> 
> ...
> 
>> +/* lower- and upper-case mapping */
>>  #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
> 
> Code seems really relies on this not be bigger than 2, perhaps static assert?

Ack, I've added a static assert for this for v4.

Regards,

Hans

