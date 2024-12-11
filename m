Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E51CB9E2
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933392; cv=none; b=K2uDtWHxNsS/SCi6oMV7CgO48g6zAnqvCJpEZY7CSRQ5jX1Z3ekXOwD2lN8+nszyy2LBjOjO/tN6NY2D/Dy6qrB24E4MicmCbPqH3ZQxLYTRrex4b0jGJx/dwt+vQIgsOSYGAXeBRNMlr5t/tZXEF12mGv3oks93MBdYWBVJ+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933392; c=relaxed/simple;
	bh=XGft5kSYmPSIl70vfBT/bD/GbsE+KrV5nthhyezoKUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJFNMlnWJnOgGrdNSYLQl/0YfEWQpcJ/K27pz6uOPHq5XXeS28fVYG0x0zU7/xehbnFG71SEw0Jz9DGzq08yeXvVaVDEXp9R3d5ZZ4QEHmNXCu4n1xKx/AAqyViBqLc8rsEqq8P46ccvkINUTJF/OmHHtogZRFfyKDV1yGvOb9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhQ7t7Om; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhQ7t7Om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733933389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiqy88fFJSqwSZys9TTjy96Q2qyVRBLn3wWkthGDt4s=;
	b=hhQ7t7OmRNZkzvKoWHiszgRz9Ivu0RFuA06Y+BDCbIOUzUc3KC4OMUGRmslF2l7bBEDrpG
	pZrDep7Me1daIDtnhMjJdS8nC+5Xf8UXKf/dlu/N/WSUeM3fQnwqfpTbg5dGdzlviRmjo3
	3w8MgQeFX94ZBLYCbYvwf1AxRtLqrTA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-eMBjhWOWPriwNvSL0Aqnpg-1; Wed, 11 Dec 2024 11:09:48 -0500
X-MC-Unique: eMBjhWOWPriwNvSL0Aqnpg-1
X-Mimecast-MFC-AGG-ID: eMBjhWOWPriwNvSL0Aqnpg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa67855b3deso203977666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 08:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733933386; x=1734538186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiqy88fFJSqwSZys9TTjy96Q2qyVRBLn3wWkthGDt4s=;
        b=g8ZNJkNwzcdVNAcFhoABvG3KVbYvg5vzOVAS+HFhtJbFb2ZxTCw+asm7wnSJd8UDTS
         FPIhZMuM5dE61UZqb5P/mKvhhXHvUCQROPCfyjJvCnFMoj2KTP7L6F+8MQ0b2llGhVEH
         tG9W4FMVm0ySXQi6s09Hr+ILybcv6Lg3d+93GmM6tzfhCOceR2qEBtPbUnbJt0R6oFET
         7Pp1Na2EkRnIaI1KapUQjlCMfBf+qDHZh3iIkTNv8ScC4R2K5AZeNXQ/hSdMKCO/iKff
         HdTDttjYiQvU3galWoQhyE7G/wdeEAHUsPSuYRny4JQRUgkW+wuH+4WaGPF4D5d/xKcb
         Og8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2B18LVRfZEK60xsfBjLXIvKU1nq3jzEXA55DANltmY0enkOWBNQw00HtVUXUBldOAP3hZQyJLJmi7+FXK5aDejglQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxchULYy2gadoOshcvIMXA9pUaEJNSu+IqEH3+xNSk9qK7Fj412
	VszuijMj+m4BDeksUxcXRCluL7K8vaKZTon8ykvzFZMlb6PU03fWbQDaXPunr7qrW2fJBi80S2+
	gnuY7cdf0w8o55FZ/tEFkZrQBCSZ9iXKuphm9X5topGbLyPJp0shHYmEBngf7aodBPIOTv/s=
X-Gm-Gg: ASbGncvfnO3Z9MbGM2qp3ZmrqyVKwQdeW4fKXrOuv5+E+hSZke30k6p/hAmle4+6k1Q
	hNvZHHh3CApLOGOQHJnTcS81VvsVSH1lvSNy4eJ0/RzAB74yX0RJI/GKCNs6ggVOHT5Ey3YIizU
	oYmJycMnmmNGyEGKvZ/U2SSj+P2sk3koRW4uH0QNkSyItZDQujMlS88fKhUFTZiZY3CUI1ufT3R
	cbN0SrMJOSa2yFVL/AFA/zay2zrMfBHtTn8HAcATFDkMFH3NclyB9blK7lblvgnNExH0i8vMnGe
	UdygBCfEer7TbE+JzUiKkjPzt32Eyj4Lk1g2P7tVMujI1KzqZYNXwMyiT5ldi8RjlwfEufJyvSt
	bONz8EPwXdGJehQTBA+fnbmsqmw73
X-Received: by 2002:a17:906:3191:b0:aa6:8dcb:3657 with SMTP id a640c23a62f3a-aa6c1b15193mr41552666b.36.1733933386058;
        Wed, 11 Dec 2024 08:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyQ3h5UbTOJK1kog9xHUIRGApb860SPpolw4BTXK+2SccnnUNtvQdi6c+YL50+WpBDJOUfZA==
X-Received: by 2002:a17:906:3191:b0:aa6:8dcb:3657 with SMTP id a640c23a62f3a-aa6c1b15193mr41550066b.36.1733933385663;
        Wed, 11 Dec 2024 08:09:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6ab44e881sm194686566b.26.2024.12.11.08.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:09:45 -0800 (PST)
Message-ID: <2d60bb29-59ee-4209-836e-f488bac0a657@redhat.com>
Date: Wed, 11 Dec 2024 17:09:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] platform/x86: dell-laptop: Use
 power_supply_charge_types_show/_parse() helpers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 linux-pm@vger.kernel.org
References: <20241209204051.8786-1-hdegoede@redhat.com>
 <20241209204051.8786-5-hdegoede@redhat.com>
 <f57031ce-8d5c-4601-87bc-2f1362a8de78@t-8ch.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f57031ce-8d5c-4601-87bc-2f1362a8de78@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Dec-24 6:03 PM, Thomas Weißschuh wrote:
> On 2024-12-09 21:40:51+0100, Hans de Goede wrote:
>> Make battery_modes a map between tokens and enum power_supply_charge_type
>> values instead of between tokens and strings and use the new
>> power_supply_charge_types_show/_parse() helpers for show()/store()
>> to ensure that things are handled in the same way as in other drivers.
>>
>> This also changes battery_supported_modes to be a bitmap of charge-types
>> (enum power_supply_charge_type values) rather then a bitmap of indices
>> into battery_modes[].
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This screams for power supply extensions.

I fully agree!

Regards,

Hans


