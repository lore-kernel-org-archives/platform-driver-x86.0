Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57E70816
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735701; cv=none; b=EWIkdk4+21epRhTkLmWgzDtfuQFDnhAppPdXUkY1hQzY7zHvyMxQdE//ocUIu0+cCgZk9FjpUQ/dGSqJ7IzMbiwnuFPo3Pmn0jL6IWhE2M/k/OasJQKP3GPJVL99n1i/GTvJproH2nWpGR2Vs2aepwDZRssnElnXM23cq93soZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735701; c=relaxed/simple;
	bh=jIexCp4WJxKYLIwk/cW+5jDuV3Oee1nIKjrOHlsJTWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jph0LDc4LJPschz54NQmeZeVou584S8J3Ia/Odafrd1tZilvvMJ3oYwWMJ2GDZ2+snlnHsN7j8iB+w6X2fnRSUcuSeKHWYSm5+67j+AwCrToeOminLE6Vc8kcqtMt3O6+obIlBi2ALAv5vfevebK4xxoFIwRFoh+2vjvD6d+Gbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONw6UW3D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONw6UW3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730735699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvfbzRHiaTs4bzRIVW/DqvVFwzsLjyP8y/Pf7UEmR4Y=;
	b=ONw6UW3DRtENs5H1EVRJjgx4gPXCOTQ1bV+Lazagp86wSZ9njBCx8IOUMlIJdTfdRhMPUH
	N0axK5Bo1gjjLaLmK9rZOXYleopkyqcu//AaKId2BoRVW3ojCnIATOHcOFKJXVsIe0G1E1
	VVXm8dVfqfs6w8Sgay1xSLjGRe2A7Vk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-8G1uJUFjO1Ot1HnSTrRO7A-1; Mon, 04 Nov 2024 10:54:57 -0500
X-MC-Unique: 8G1uJUFjO1Ot1HnSTrRO7A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99fff1ad9cso382587566b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 07:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735696; x=1731340496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvfbzRHiaTs4bzRIVW/DqvVFwzsLjyP8y/Pf7UEmR4Y=;
        b=srpHYdwP4VTk5VSVQ6lEtbCVqbLEHjilLLGHrN9mkflfkOJZ3myVwri7PdQ2oyLNFH
         0qfG85WdUACvJDEl0jngsnjyUScpmbpshXdS6uRAiFWmWwWGp8cctR+H/S2PN+lihTGR
         u6nf49LgzY+nNqDtzquIdVlD8mbXMJc9CaNXArCg1Q2Nv2P/gGQo8pquyW15ko9Rvqx6
         eknsD/XL4aq0VTQPYMcIy7gYy8M2EoHTvtzlLDERTisdHADuPP+0BrE9o8YKRjlaIFrN
         eYXHtrQjuqAybMR9Cr+aEuLF1h5K/t9nPFFivWDFLidKVIQPrxBGQxpU30ELPvn/P9fE
         44LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTCuSaap5Z4o4p4+LHhbor9A4V9kSYQVn1vd4qweSQBNWNT1bYkUJ7cDutYRcCKoQGoGGzFmrQ20hKLYNn1COMMv8g@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9beyyHiRqVsjffpsmJYPv4asOQkD5EFMeOTMGSOv0m5tb8Pd
	qUYqb22OhIGuAfR2m89LoryIruztSsEAjV8cJhqFnOvnnjNbDrLrDPHQGi7EYAmrRFQHKk28WkW
	oqch/K/lcj4tR5HCSJ1hHvIgQZYCCzXC2k/3VL9dMXUatXwdJ3AseqGxUsRH2aVys+kRctbwRJL
	pcCos=
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr2068309866b.31.1730735695611;
        Mon, 04 Nov 2024 07:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj80DrqcpKlG7VTIr/gs2UT9+Gi53XfrCX8fHakOcQ8nJ5seWwrdL53xm1Q6Oy4gRWdwDsHw==
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr2068307966b.31.1730735695266;
        Mon, 04 Nov 2024 07:54:55 -0800 (PST)
Received: from [192.168.100.203] ([109.37.147.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c5348sm565179966b.49.2024.11.04.07.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:54:54 -0800 (PST)
Message-ID: <53a26418-e2dd-426b-b144-32dac8837221@redhat.com>
Date: Mon, 4 Nov 2024 16:54:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for
 getting i2c_adapter by PCI parent devname()
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241025094435.71718-1-hdegoede@redhat.com>
 <Zxu5_VAe2NLeR-2s@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zxu5_VAe2NLeR-2s@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Oct-24 5:32 PM, Andy Shevchenko wrote:
> On Fri, Oct 25, 2024 at 11:44:34AM +0200, Hans de Goede wrote:
>> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
>> (guadalinex) using the custom Android kernel the I2C controllers are not
>> enumerated as ACPI devices as they typically are.
>>
>> Instead they are enumerated as PCI devices which do not have ACPI firmware
>> nodes associated with them, so getting the i2c_adapter by the ACPI path of
>> its firmware node does not work.
>>
>> Add support for getting the i2c_adapter by the devname() of its PCI parent
>> instead.
> 
> ...
> 
>>  #include <linux/acpi.h>
>> +#include <linux/device.h>
> 
>> +#include <linux/device/bus.h>
> 
> The above is enough. but if you want go with this, I would swap them:
> 
> #include <linux/device/bus.h>
> #include <linux/device.h>
> 
>>  #include <linux/dmi.h>
>>  #include <linux/gpio/consumer.h>
>>  #include <linux/gpio/machine.h>
>>  #include <linux/irq.h>
>>  #include <linux/module.h>
>> +#include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/serdev.h>
>>  #include <linux/string.h>
> 
> ...
> 
>> +static __init int match_parent(struct device *dev, const void *data)
>> +{
>> +	return dev->parent == data;
>> +}
> 
> To me it sounds like a candidate to be in drivers/base/core.c and bus.h.
> 
> ...
> 
>> -	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
>> -	if (ACPI_FAILURE(status)) {
>> -		pr_err("Error could not get %s handle\n", client_info->adapter_path);
>> -		return -ENODEV;
>> +	if (dev_info->use_pci_devname) {
>> +		struct device *pdev, *adap_dev;
>> +
>> +		pdev = bus_find_device_by_name(&pci_bus_type, NULL, client_info->adapter_path);
>> +		if (!pdev) {
>> +			pr_err("Error could not find %s PCI device\n", client_info->adapter_path);
>> +			return -ENODEV;
>> +		}
>> +
>> +		adap_dev = bus_find_device(&i2c_bus_type, NULL, pdev, match_parent);
>> +		if (adap_dev) {
>> +			adap = i2c_verify_adapter(adap_dev);
>> +			if (!adap)
>> +				put_device(adap_dev);
>> +		}
>> +
>> +		put_device(pdev);
>> +	} else {
>> +		acpi_handle handle;
>> +		acpi_status status;
>> +
>> +		status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
>> +		if (ACPI_FAILURE(status)) {
>> +			pr_err("Error could not get %s handle\n", client_info->adapter_path);
>> +			return -ENODEV;
>> +		}
>> +
>> +		adap = i2c_acpi_find_adapter_by_handle(handle);
> 
> Can we rather have two patches:
> 1) create a helper out of the existing code;
> 2) added the new approach also using a separate helper?

Ack done for v2.

Regards,

Hans


