Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09554181BA4
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719150411; cv=none; b=omhVBppkiv7+0e5cD9EtioZcgWlpW0DRgiZBjyzsV8FDRrrhpVecVWBTIHtSr21V/5sR8bFnOe36QLdfm6IsH/obeyv6cJKXB90B1CgH30yJyIV44QsX2pm2mMlIBe7x8uWB9XtGACC5W/c+7Q3lyeVVqyUvrZHozbWyvhbHmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719150411; c=relaxed/simple;
	bh=NOB/53+QTNKxbBHesQc3h3rlOj82qCSMMPZ8PONlgPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LR3jPWC1fL6FvkjAaO7tCeOlHIFCo76hYn6KnAYKDJ/o7RYQvs5KlN7i1jlVL2coxZ+lrs5ZldDb7HvIKdV99t91Tr1s0PZOAMwEZWEComZHkFAMkk75Nr4Xqr3X/poLFbxkKHwDs+vNuMKDBVxxYfGO+4xGyls3u2ub5IPsjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ht+9aDFe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ht+9aDFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719150408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYVBYDi1rQu6r1OHUmvhKLDBmrisC75Dj2UL2USoAy8=;
	b=Ht+9aDFecC6I0r8rID08IJ4/pXGvVcepRgXstgamSHfM9tHwBosmE5274SxxTie6HVBVCO
	f9kRV+JmiulKPG11dK5WuaQ/zRqAV4gUp9q5B926oN5WeQ2r3XcgKVyZ5cW6+DPlF7n5K4
	ziRX7jsRhrXpKBkqMX08UoGy38g/IP0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-cPL9s4gZPw29RxDyAoElRw-1; Sun, 23 Jun 2024 09:46:47 -0400
X-MC-Unique: cPL9s4gZPw29RxDyAoElRw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ec617f8b6fso223611fa.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 06:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719150406; x=1719755206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYVBYDi1rQu6r1OHUmvhKLDBmrisC75Dj2UL2USoAy8=;
        b=rElVRJIl+3XDcL2SH2whH5f3qGvmOrRdEjKJsPtw3ooW5YOOjoZobXFIfsO6sY1NQM
         Wkch4iYgsTjEAmIoP+xucMqvf2XKVGKAidIEvfv31CRSNQxoIW1QqYG6n/4JmcZSnSTT
         A+QTfIhRfdAa1szFmvGzwmR7CaugOtHXv9EepcEf3RvCDpRehi5edHIco/6y1K920b4j
         V2zG/pSad6lEiHPl7EV1Rpm/QHSZ8/H18cvXonNMO9Bl5eW2en93AiEWmZuFpk3kUh91
         paLTblBl3xqJCYll3j7MNoyZpP+BDyJNvI6aqmQhP3MjfCl3JlDLKH2X95N7BCV9NG4Y
         ho8w==
X-Forwarded-Encrypted: i=1; AJvYcCWkGelrnTBQk+P7IU9GLXwoGhVmUSvib9QjrcXneHOzyQiRm83ULXNvXJioRRHkPovnOFGFF9jC3nRKgwELSL+8ZhuedD7Cz2GeWN7vPUpi65mi/g==
X-Gm-Message-State: AOJu0YzuaurswcWr3OQW6f+OVFJxNrF5/oAqPXzoXjEJv68TDlRO6Wjd
	G80g7wTJUvD9z9sxKDyJe/y2nB7zAGNM4uM1Xto40hGO6aERv5o9PuyYKQCoaaZ4B4RXLNURH49
	s0za8Ni87iTcK0OSOopNugLQDcSFz4R/unOx5cpwCu0KIkCNdJnHMZCOm3hIu96x4JIXnPv0=
X-Received: by 2002:a2e:9001:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ec5931d31emr19208141fa.20.1719150406166;
        Sun, 23 Jun 2024 06:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVAIEKdFPWZMOgucGr8UWuBfPpiXjtXyvCnkzxakLqCkbqvFD3VNOeWtmisNu3P6nqmETmPg==
X-Received: by 2002:a2e:9001:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ec5931d31emr19207971fa.20.1719150405714;
        Sun, 23 Jun 2024 06:46:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da3cbsm3518028a12.16.2024.06.23.06.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 06:46:45 -0700 (PDT)
Message-ID: <3205096e-d0b5-45d5-bb3c-05abf0cf9c77@redhat.com>
Date: Sun, 23 Jun 2024 15:46:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <20240622162627.gs3esrwgjbmarpxl@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622162627.gs3esrwgjbmarpxl@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 6:26 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:20:15 Pali Rohár wrote:
>>>>> +	{
>>>>> +		.matches = {
>>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
>>>>> +		},
>>>>> +		.driver_data = (void *)0x29L,
>>>>
>>>> At least for me, casting i2c address to LONG and then to pointer looks
>>>> very strange. If I look at this code without knowing what the number
>>>> 0x29 means I would not figure out that expression "(void *)0x29L" is i2c
>>>> address.
>>>>
>>>> Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
>>>> instead of ".something = (void *)0x29L" to make it readable?
>>>
>>> struct dmi_system_id is an existing structure and we cannot just go adding
>>> fields to it. driver_data is intended to tie driver specific data to
>>> each DMI match, often pointing to some struct, so it is a void *, but
>>
>> Yes, I know it.
>>
>>> in this case we only need a single integer, so we store that in the
>>> pointer. That is is the address becomes obvious when looking at the code
>>> which consumes the data.
>>
>> Ok, this makes sense. Anyway, is explicit void* cast and L suffix
>> required?
> 
> I have checked compilers and L suffix is not needed. No error or warning
> is generated without L.
> 
> Explicit cast is needed as without it compiler generates warning.

The L definitely is necessary to avoid a warning about casting an
integer to a pointer of different size. Without the L the integer
constant will alway be 32 bits which triggers the different size
warning on architectures with 64 bit pointers.

Regards,

Hans

