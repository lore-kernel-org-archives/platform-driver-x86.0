Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECFC1A8F60
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333831; cv=none; b=EnzyEcajESxhOjx/+zgdaoa2Hr7ZVmPQlmcfJplCaGEcceb11WdxzeIveg1JBBQEZ8+T6EB8PNo/48Vq07rJ7WTR6BEac2519432DC3VcvSx39FzhuZP/9OXIAPBL4AYpEwOsjlcJT1ag+Hm0JfF1Q0jdxPrALVcNctVIzqzCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333831; c=relaxed/simple;
	bh=1yMhLhO5GGgUmGrEBU93kr+m9Bb1qlxTkyQg4KDPyMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kr+YJJNHj4UYRBttFIyALVWABI72pef7ydvXz2yqDj3sEBncvPm7BLflbi0fsYQ2ZoExPykriokF7i+HVZb25kgnmN57VlMNysQr0A7xWEs0hnWibrRDuOUditGHK5LqJZSQSj5ZuPemovw2Ici/K5QYXod7uAbejx2pbiQ+w1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHGFRolG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHGFRolG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733333829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvpQJwhQ1t4EMhCWDDcUdq+75ypzpEr8GpG09Kds9xc=;
	b=UHGFRolG+ApUJeyyuJIaJzgjb0/ly65PVm2krM/Ca+/EGBOXcR2wn0/kFdgeRYj0Xkjc0P
	HGjx8tc9ke4NAYpLHNlqk8jMqOp0U3ThxGYX13H1dyrPqkHVhjv7QTqcPxuV/LFmPxV8qj
	BIlGgBh17toz64BmA+npZ6eXFrcAxZY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-9lgX2w1nN3S8X_D-ZP47Dw-1; Wed, 04 Dec 2024 12:37:08 -0500
X-MC-Unique: 9lgX2w1nN3S8X_D-ZP47Dw-1
X-Mimecast-MFC-AGG-ID: 9lgX2w1nN3S8X_D-ZP47Dw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5cfad454c02so4863298a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 09:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333827; x=1733938627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvpQJwhQ1t4EMhCWDDcUdq+75ypzpEr8GpG09Kds9xc=;
        b=NySp2kJdYYw24Jv4bUll1k+Kv+CUjqxSkfaPi7daJ2iGQqofRNVvEuL8H+ztmL70/O
         UDNCt7Xf9PdR03YH+wuAgY0KJjKR6r9W/MhwvZLs0WausDyyG4Qi8dH8ROzX12OQQVJ1
         b6gAfgwoVGAELbmBzLIK9xqEJuvn0bqkXKuPvMpcsW62Iahix0t91ccJHh3dKg60p8R+
         u0IMKPBMx/dba2DEkTKNmQUa7r2FJr2FyspBR6m5U7OrqhkplXpUNQBZbnyel53pgdoC
         p3ND8YCYQ7KHsdFezFQUXS8hW8PEDbA67fpHn9Ct80WXBromol/B9KK2LI7Xr0TqCrj1
         J17A==
X-Forwarded-Encrypted: i=1; AJvYcCV2VWw8WXctRJQU1F2PzkgDNDLRH5gaeY5l8Vk3nZy7XTPqmgQD8eQ1RawLN/V2hkpOE4FJJ9io5rHHFWJrYlzuiCER@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EKDc+1il5HFHapPSCxvUZeRwgw2gn7sBb1B5E08dEahEomp1
	bCX7MUWi9uMlLDBGl7P46qvr9vZ/IuB1B1WRWsrf8a2UL8DrrAi/qbP0skO3kGu+jXUjQSu+dWp
	f5KRaDHs1a2tnsuwcmzhAb5vgWpC/3td9rRk/yM7/wOeO2WXEAPUWuyTHD8qMgupiD4RR7Hw=
X-Gm-Gg: ASbGncvKUn2u40dQOXz1mi3PUs3zsOK1+r5Z4hdIL1k8KTYA90RPi8yxiv1XPO1ITfW
	WqHA5/nAWmOdn7I6UXcxYaOnbIpeGlMsataWYg/7azcU94Ef7FkGGmeGffvxktqokfFwlQEhQU5
	bfDa/p7u8KkhmwiO02XA2otF+eacY/4JGkIzYECIn2rQ7GUoA1ZbqRSwtsYmKXrXlvjDWOSf2R6
	3iPuYlUiWfZy53biF6GDP4uSqG8Y8h+3E82Z2GF1umZnZ2lulEoXO/IwB0mDyfVFIY2Vz46RLa5
	za6XxTeWd8wbQ6HVxqqLyZ7RwWGDyc9kPqpoZ2upszGdZSR6JqgnQqKBKFvzDg8VUrp7HnII7ZJ
	OwLxEilnn4eTccX3Muj0onAP0
X-Received: by 2002:a05:6402:5186:b0:5d0:c8f4:d1db with SMTP id 4fb4d7f45d1cf-5d10cb4f11emr8097956a12.1.1733333826979;
        Wed, 04 Dec 2024 09:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0J9vpH+vK5qqQgiekc2+qqK+HMdvjDQGBtTupds+L0JX8ATD1AvFAuhX8woyXJJ/OyWG9eQ==
X-Received: by 2002:a05:6402:5186:b0:5d0:c8f4:d1db with SMTP id 4fb4d7f45d1cf-5d10cb4f11emr8097927a12.1.1733333826603;
        Wed, 04 Dec 2024 09:37:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0d1874b4fsm4955801a12.37.2024.12.04.09.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:37:06 -0800 (PST)
Message-ID: <c3171bf7-72f3-4dd1-bbe0-8e75fffbb716@redhat.com>
Date: Wed, 4 Dec 2024 18:37:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86: int3472: Fix
 skl_int3472_handle_gpio_resources() return value
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241128154212.6216-1-hdegoede@redhat.com>
 <20241128154212.6216-3-hdegoede@redhat.com>
 <Z0iSDNyNhh3UPAN5@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z0iSDNyNhh3UPAN5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Nov-24 4:53 PM, Andy Shevchenko wrote:
> On Thu, Nov 28, 2024 at 04:42:11PM +0100, Hans de Goede wrote:
>> The INT3472 code never wants a copy of the ACPI resource to be added
>> to the list-head passed to acpi_dev_get_resources().
>>
>> Make skl_int3472_handle_gpio_resources() always return -errno or 1
>> and drop the now no longer acpi_dev_free_resource_list() call.
>>
>> Also update the inaccurate comment about the return value.
>> skl_int3472_handle_gpio_resources() was already returning 1 in the case
>> of not a GPIO resource or invalid _DSM return and not -EINVAL / -ENODEV
>> as the comment claimed.
> 
> ...
> 
>> -	acpi_dev_free_resource_list(&resource_list);
> 
> Even though it's better to have this (no-op) call. As people may use the driver
> as an example and then make the real leakage somewhere else.

Ok, I'll keep the call for v2 and adjust the commit msg to match.

Regards,

Hans


