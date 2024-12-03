Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4500F1F12F7
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242204; cv=none; b=sdO25Ydd+VdwcpemQYvAn+LQtkkPdBs1YrH9Xq/Z7aZRLpLy1L/IJxWoeXmFxrjqPU377WVg0mLnvL3y8E7CSpJAIozB7DnBCRoTK3hRSYYkWkbNqCUJypXYQS3EnWSJDkie1gF3DejyTDK3fQ4znluQ81VvKUNdVOO6frYOgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242204; c=relaxed/simple;
	bh=wKmlpVP41Q8QuVpO3551yuOmamNRWnFBv/oW/23U5SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6Rgrus+0g+B1iIvjfosEvPdohhQ3Tfonrti6JQDMHvDVHQH0jWAL0mlIZ/abJLSZnBd2zS+hc94kj1dN2YfibRKy/jpK2Pok1YFYh06jK+ieW/W9OpUyV6lFYO7lj/zd7Zt22QpWzZ0pRYn5PJefNPNF+MlL2lTWR9NRaLhEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9hGS/km; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9hGS/km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733242202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrSAvYkcGaxZqNeF7Z+XfbzUmqceDWeS2bM3UUKc9UY=;
	b=N9hGS/kmYS4UJeN2d+xdCmgGdpf4oE/bMBGgdj2vMSD0Ua/0UHotK88J9EncOxjIKTVcqs
	1qzeqxgaJwGt0x/lVH0zhZ7AROWZ7OsYrcFf0bgKJWOmZkKID4YicexVbLUQDQMFcRN65S
	rdNsjemLlQWwpFL14xUsc1MVR9GHEew=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-9wIqDocjOtawfnaB2I7ctA-1; Tue, 03 Dec 2024 11:10:00 -0500
X-MC-Unique: 9wIqDocjOtawfnaB2I7ctA-1
X-Mimecast-MFC-AGG-ID: 9wIqDocjOtawfnaB2I7ctA
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d0e78fb68aso2622687a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 08:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733242199; x=1733846999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrSAvYkcGaxZqNeF7Z+XfbzUmqceDWeS2bM3UUKc9UY=;
        b=NyuPHHT9sOHHqoaOERezb0CKdpicIPWGRjDQqMea2qkO0VPKVsWwwA0H0OXXMJMRyZ
         8Iov52Uid2CXtfPuT6Rkl1N0ph3AADWJdzLI5uvmKafhEf38I/YjRv/kftZMh0sLdbzv
         iiqEDsgEgV7aT3zernBKU5BxFf2i0C66oVj4fJDPFTjXKVWc9ismS0GJhQrV93pfldi/
         neeBL4IHEMrJZHapbkeNP3GBfBZhhRKhhjPs1ul7rDd+iTci5skBvuCX5/INZAga0hkT
         EITm5weJB5CpRNHJMiLdSdnC87Djqi1GVzAHSLtKx+xrAojP8ZjBm13Vfcm4Cjt+z+BI
         NnLA==
X-Forwarded-Encrypted: i=1; AJvYcCUkMD9GTWiwjLsfgBjjEfzC65bqSkQao4hEXtIbM5BGRALhbqzBYSi5BWnmWm4YgmERH3lf4pgtb5yr3IzQnCJE6Rvz@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYnWxDSz7g8QQmuzrCAkcc+mmflkYwdwiSu1AQ3p+zLt/WM8u
	FXSW1wa6Z3Jzj1E6PfTzjlDOAYfnRrsVYk7i7+V39iz21Tv8C37rtderuW8R0PfeEtgDgkxfI3H
	sjd+svSF4jDKWZ6ZGfgqWiHYYT2hX2gCGkzYyaZ+Abfnp1rp8kTAU+5yDVlJKvILKsYGqI0c=
X-Gm-Gg: ASbGncvt4ro9974DQDOf7tyGGQRCgpNNeJDy1rHVehhK906tiO9NCuNc3xzRuprJd0V
	2nXomPp4DEDamH7h8jf63eReO+YLfWqiqj6D0d2SIySVZ4NNZbe7zrHlHF5KdP9MuAQEKdO8Ti4
	emGK7oMQaeBfHI7YrmNHY0LnbF8M0e7S5CQu95jF4UZby3hU3XqpFxLHT99VbKAt1cgvBgjHNvd
	pha9FBLTSPH+OTneTvng7kn0dDC+4WDu4lqABu0z2iByFeEY29IlD58Shaef8npF7nHDfVyC35i
	ZE2rkPbAl0bwS8GTl+l3zKoRI1gQr6uhaC7+e2ASNZSmtRBOJkbMauVMk6Z91yUENHCbHrXZvW0
	bAmBRpm2PprZqOruTsyUDtbWV2ao=
X-Received: by 2002:a17:906:1ba2:b0:aa5:479b:3d25 with SMTP id a640c23a62f3a-aa5f7f2b0c4mr211191166b.51.1733242199344;
        Tue, 03 Dec 2024 08:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw8ZbHNP7By/eNP6XItxO4VuoSIBpM2+1/i3XDMdZsp4ymhJo9FmrdZ+u0XMDd2Qv2Agk+Og==
X-Received: by 2002:a17:906:1ba2:b0:aa5:479b:3d25 with SMTP id a640c23a62f3a-aa5f7f2b0c4mr211188766b.51.1733242198947;
        Tue, 03 Dec 2024 08:09:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a7a7sm628271566b.172.2024.12.03.08.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 08:09:58 -0800 (PST)
Message-ID: <c19e9043-0750-4eb0-b794-521d946317d6@redhat.com>
Date: Tue, 3 Dec 2024 17:09:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241116121659.57487-1-hdegoede@redhat.com>
 <20241116121659.57487-2-hdegoede@redhat.com>
 <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
 <Z04ASf0znID9C1FN@smile.fi.intel.com>
 <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
 <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3-Dec-24 1:58 PM, Andy Shevchenko wrote:
> On Mon, Dec 2, 2024 at 11:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 2-Dec-24 7:45 PM, Andy Shevchenko wrote:
>>> On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo Järvinen wrote:
>>>> On Sat, 16 Nov 2024, Hans de Goede wrote:
> 
> ...
> 
>>>>> +struct atla10_ec_battery_state {
>>>>> +   u8 status;                      /* Using ACPI Battery spec status bits */
>>>>> +   u8 capacity;                    /* Percent */
> 
> Then an obvious remark based on Hans' reply, why are these internal
> kernel types and not external ones, i.e. __u8?

Because this is not a uapi header? 

Regards,

Hans


