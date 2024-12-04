Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52620E01D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333796; cv=none; b=NinjImWTJhtMUAdZDeuBAMlVuBTGvMWLfsIOGz64iTgF7EjOBQmXj8daslm/FLoPT97CQgrI3gCEpTUx7s9KiBbhRXR1kwF6r7VShTgsQVJ4D4OrzggQkuwIRPEzrYTCwqxB5/K0LbNsLjb81VjfqXBvJpZQ0RWJwjTwZQ4JH18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333796; c=relaxed/simple;
	bh=RIZTor1pGYwg+GAkZKBDOX0pZuWJ3z8b7YKM/h3ua94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOgxBtqR+W5R4yjXr4lHf77EkQFoHU0o2tuCcYNOKi/VF7zXKeyPFgyXSvrWO8fgQhDn4A6qB1mCL1GgTgP2ucw1Zeird0YezgfDgfVKKH7+7NW3JMP91Xg9Wt81Tce2RV2iUdYRPZXKsfshXF6pEjgQ+KIXfs6BzyABLA3Of1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijiNVBOv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijiNVBOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733333793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASSiqse8DEvMFNDbvhIN6GeimDLBicO4X++LSEHySKc=;
	b=ijiNVBOvbQ+QWKxo3PDeyx60fGzaIzqip81HrT4FdmQIOTzhmkMVYyJit5HCXgInMhq3p8
	5R9VzDbRlmxwezw4IUwJGBTqV5iHSOxz9pogGVNIb/Z3uck8Z9Me9sehUx6RKTgodVASS5
	qTaykW3dqH1yTLJQyEYhmdk+6uYha6Y=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-Zz_SstdHNeWNnm_vv4aq7w-1; Wed, 04 Dec 2024 12:36:31 -0500
X-MC-Unique: Zz_SstdHNeWNnm_vv4aq7w-1
X-Mimecast-MFC-AGG-ID: Zz_SstdHNeWNnm_vv4aq7w
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-53e1c91bc98so38052e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 09:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333790; x=1733938590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASSiqse8DEvMFNDbvhIN6GeimDLBicO4X++LSEHySKc=;
        b=eFhj/HCvm67CnJiECHaap1JRCAzpavt+d/Dfsi/6RHIRBfTafgflSNjiyyB9LgA52v
         BM4nimeb3jLj9r70o7i1Wp81XM8qLQDgG6pZAAq2kWgG3/6wO4dWHCGkKCH4bAiZ2XZv
         wE3uDSjKigpGSaNYqoopC8rc5H3i89NRzehfBXfI5KATiSTeNQB96obe6Ul9D+rPF6H1
         zH0nID5qCtFEYM25lP3BerIA6cJZCQ+v07PfKNCzGmPWcRyhdlBpUXQVXIQ7GGx3wvRu
         FeT1HnuNkz5io6F80SeS5owP2uMYYZnChhJUM9Pq1C6nm02RFzbR5NRzEyzgOE/Q2djo
         DOjg==
X-Forwarded-Encrypted: i=1; AJvYcCW5lLSGqkITkLhXVCcPnP82GQ7Bd4sEF4ir8XAR+8KhLtRsqS/nM63Zc8PVN8oSrljI2sH/2Jz5ZQGz5M/wz1aRm+Vy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tCO8KyUFNt3HNISbye3dFEpFAC+vnS0Q+7hdMsI5HUBFxczD
	IJTHnGEe3c8fSFjPcNycV9J9t0FS5THzQHM8muG/MPz8MNEGFhKWW81erpq5t/DtIGV29pKSpXX
	7oJxdxI5c+1xKn6Ck/cMOWCntCYXGFyJC4+KV4veS6ayHPCuVutjY/Cmx3vhfSKYHWVzlvYw9mb
	dRW1E=
X-Gm-Gg: ASbGncuCTeOzI7njWAOrJwteM3nBVX3xo659VuNFSYJrxli/j/K2a1jjbrPdtJPrxMe
	VXxHiv4Pz4Grnw9z0XF5IttwT0qNhnCmYepbf929uaKVvEFIMGa2lqHtnN1Dm+MD7QGaZzbcCNc
	pCAqvtKpVREt7HYH9DPOkQcS3ZlhUsYdYhL0DDi+VTl5M8+7o7vVQjQreKlaLDPA7wh5lx+eGQ1
	JSrVbOlNx2Nnaxx5VTChbcY3oQzgSE7Xxj4w3nTX0StxBlyFXT3O9w8ALXbxT8XlgQC7as8x12g
	JyaWzXpPIjIGZ55Ymk/uv2SUSIQODpWAWCNS2Fp4RZmJ/yL2U1pd8kbvjb+QPDOdkQQBFX9wk7r
	lrImQIC86wphRK1uZk7sn1DlU
X-Received: by 2002:a05:6512:12cd:b0:53d:e5f0:32ca with SMTP id 2adb3069b0e04-53e12a281aemr5258499e87.50.1733333789673;
        Wed, 04 Dec 2024 09:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8cIBdhV7d53NY7lxMGufN0aElCH/o82UnnU6G8G+2nHQZx3RYIsIoah1CPhXB2Fa0YJsmMg==
X-Received: by 2002:a05:6512:12cd:b0:53d:e5f0:32ca with SMTP id 2adb3069b0e04-53e12a281aemr5258486e87.50.1733333789274;
        Wed, 04 Dec 2024 09:36:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1950sm755523666b.11.2024.12.04.09.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:36:28 -0800 (PST)
Message-ID: <95b952cf-d3b9-4ba7-92a0-6b1d240fada8@redhat.com>
Date: Wed, 4 Dec 2024 18:36:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86: int3472: Drop "pin number mismatch"
 messages
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241128154212.6216-1-hdegoede@redhat.com>
 <20241128154212.6216-2-hdegoede@redhat.com>
 <Z0iRuxcNnPMZptK_@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z0iRuxcNnPMZptK_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Nov-24 4:52 PM, Andy Shevchenko wrote:
> On Thu, Nov 28, 2024 at 04:42:10PM +0100, Hans de Goede wrote:
>> It seems that Windows is only using the ACPI GPIO resources and never
>> looks at the part of the _DSM return value which encodes the pin number.
>>
>> For example on a Terra Pad 1262 v2 the following messages are printend:
>>
>> int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 103 resource 359
>> int3472-discrete INT3472:01: powerdown \_SB.GPI0 pin number mismatch _DSM 207 resource 335
>> int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 101 resource 357
>>
>> Notice for the 2 reset pins that the _DSM value is off by 256, this is
>> caused by there only being 8 bits reserved in the _DSM return value for
>> the pin-number.
>>
>> As for the powerdown pin, testing has shown that the pin-number 335 from
>> the ACPI GPIO resource is correct and the _DSM value is bogus.
>>
>> Drop the warning about these mismatches since Windows clearly is just
>> ignoring the _DSM pin-number so invalid values are too be expected there.
> 
> ...
> 
>> -	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>> -	if (pin != agpio->pin_table[0])
>> -		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> -			 func, agpio->resource_source.string_ptr, pin,
>> -			 agpio->pin_table[0]);
>> -
> 
> Hmm... Perhaps move it to dev_dbg(FW_BUG) ?

I'm not sure there is much value in keeping this. If we do go for dev_dbg()
then the check should be changed to:

	if (pin != (agpio->pin_table[0] % 256))

to avoid false positives and the need for that IMHO already shows that
there is little use in keeping the check.

But lowering it to dev_dbg() + adding the % 256 also works for me,
please let me know how you want to proceed.

Regards,

Hans


