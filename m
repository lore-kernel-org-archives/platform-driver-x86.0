Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BC70816
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735652; cv=none; b=HXZs2QWcH7rJyplCps+7D91tHdKBfQ/wR+bLsvLUqYmvdUl60CZjM468ewzb7nCOAxF3e3yGW4yAuqdYzWGQ+oVrSFw/sDzR2WYL/EkueyRZT/m8BHezqMRS6lmSGWEVzQaA1G65EROI+bW3f5AkqllIymILZBC0Fr9Ev/4/0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735652; c=relaxed/simple;
	bh=TN/2F6FULT6LMw1YW+X7GVzaureqxkzSP6ecAcoE478=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awbf6JXL0QmhhZ1tc215oP2BfCGaMwLjFUSKYJ14ysedbmG3vOeQyo+E3rkQi+u/hMq2L+OPzkM7EuEwQ4Nn8CK6FXrqcKJ+INHO0Ick8JL9F62qg74aI5ulm5WQE0RcyURAF0CufvHUt/t6WFg+BSACXPf9IbMlfVd5qUZmHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSX3cPLD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TSX3cPLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730735649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RhkCphRK0SHUkqQH0lPy1aPOuyHVthZT5BtKL75cRw=;
	b=TSX3cPLDsXxXLHW+ktXEPBb40ezI8byraQ3NirTc8jymvVMEmDXJCJqKWtv6SMv2TlQ+kQ
	/BkKkNKuchh/hsJJsWIswpOHEam8MJzfVB6HsfMbXXZ2uRbBBVSEC62oXwy2nzNihwz9YC
	4qBS6l/u1sKMJDN5dehdrvkrtYHp2hU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-z-SbAtuhMaa0czOYNdVEIw-1; Mon, 04 Nov 2024 10:54:08 -0500
X-MC-Unique: z-SbAtuhMaa0czOYNdVEIw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99ef476aadso358956666b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 07:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735647; x=1731340447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RhkCphRK0SHUkqQH0lPy1aPOuyHVthZT5BtKL75cRw=;
        b=QfvB5jtJ3yH05d7EPfJpxiBgP5B+ss/4r+zig2VDJBsapfeTI1qFIv1WWYKL+QSzgY
         IeBCCIuNHr6AIhGBHU6YrIVxunwwJwZYFKUlhLvGJoFmWdaYiHx3t/sH8550ZwnMaIOw
         fE2N7BnNLwKMhyfc8UP79TKMdFCsldRhdiGaLig9nXHs9JScNiGUcdSPC16pPuhiRtZ7
         nyJDZPumYcqM/rKxiD86gNabK8WZAOiebwrb1eKs8JH0VOT26HHLG5D0NVItsSxj/EQc
         5l26+kgekNFfOoW6bx7McKehp6ehi52r5pHXE3JeAcfNdHSf4KV/2lqgZwpXRNZRcvHb
         N7LA==
X-Forwarded-Encrypted: i=1; AJvYcCW6uvVseZC3lg+lrLeYEm1nGiTfRuCGl1XDVQwPY4GU5IxJjLsDh4E+TupjBUx4ZNAE4qIQwcfU+S0bSSo1kTm+x/HZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyRCVSsceJWWDh0HmxtdUbgfCtIakKp3fjjrKHqJc+V4gg1LP9E
	DPCHqBYWm5UU2h7I/E+/zWW3llnwt8LhxQpNNX3//nlUeKK7spveicmCYXfAvKM8CIMgjFZEvlt
	F/He7P0SDxbwm8aa2gN8SiMVvJKdz923C3eBlF6mPcoxoG1AzjkzxN8NePCtsiSA3km0F1cQ=
X-Received: by 2002:a17:907:2d10:b0:a99:f675:b672 with SMTP id a640c23a62f3a-a9e655aa0c9mr1280920066b.29.1730735647219;
        Mon, 04 Nov 2024 07:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnxDP7Q47fXVeKhNo/fjMHo5D9nm2cEOVoO6q3I9omajWTTzJcWz+ClCj0WCtMU1nS7vlfRQ==
X-Received: by 2002:a17:907:2d10:b0:a99:f675:b672 with SMTP id a640c23a62f3a-a9e655aa0c9mr1280917366b.29.1730735646842;
        Mon, 04 Nov 2024 07:54:06 -0800 (PST)
Received: from [192.168.100.203] ([109.37.147.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565f75e7sm574515066b.142.2024.11.04.07.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:54:06 -0800 (PST)
Message-ID: <a80847ea-d060-4884-8166-c68b64a186ed@redhat.com>
Date: Mon, 4 Nov 2024 16:54:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for
 Vexia EDU ATLA 10 tablet
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241025094435.71718-1-hdegoede@redhat.com>
 <20241025094435.71718-2-hdegoede@redhat.com>
 <ZxvZrb4bgbD1C-y9@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZxvZrb4bgbD1C-y9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 25-Oct-24 7:47 PM, Andy Shevchenko wrote:
> On Fri, Oct 25, 2024 at 11:44:35AM +0200, Hans de Goede wrote:
>> Add support for the Vexia EDU ATLA 10 tablet, Android 4.2/4.4 + Guadalinex
>> Ubuntu tablet distributed to schools in the Spanish Andalucía region.
>>
>> Besides the usual broken DSDT issues this tablet is special because all
>> its LPSS island peripherals are enumerated as PCI devices rather then as
>> ACPI devices as they typically are.
> 
> Just wondering if you investigated the possibility to switch this via
> (most likely hidden or absent) BIOS options? On the prototypes we have
> a switch in the firmware on how to enumerate LPSS, so it's possible
> to get them enumerated as ACPI ones.

I checked (before sending out these patches) and the option to switch
LPSS devices to be ACPI enumerated is there (it as an unlocked BIOS with
all options) but it does not work (it does not do anything at all).

> 
>> At the same time there are disabled (_STA=0) ACPI devices for
>> the peripherals and child ACPI devices for e.g. attached I2C/SDIO devices
>> are children of these disabled ACPI devices and thus will not be used
>> by Linux since the parent is disabled.
>>
>> So besides the usual manual i2c-client instantiation for accel/touchscreen
>> this tablet also requires manual i2c-client instantiation for the codec
>> and for the PMIC.
>>
>> Also it seems the mainboard was designed for Windows not Android, so
>> it has an I2C attached embedded controller instead of allowing direct
>> access to the charger + fuel-gauge chips as is usual with Android boards.
>>
>> Normally when there is an embedded controller, there also is ACPI battery
>> support, but since this shipped with Android that is missing and Linux
>> needs to have a power_supply class driver talking directly to the EC.
> 
> ...
> 
>>  	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
>> +	depends on PCI
> 
> Maybe it's time to rearrange this a bit?
> 
> 	depends on I2C && SPI && SERIAL_DEV_BUS
> 	depends on GPIOLIB && PMIC_OPREGION
> 	depends on ACPI && EFI && PCI
> 
> ?


Ack, fixed for v2; and I've also moved this to the patch to get
the i2c adapter by PCI parent since that code also needs the PCI
core.

> 
> ...
> 
>> +#include <linux/device.h>
>> +#include <linux/device/bus.h>
> 
> device.h is enough.

Ack, fixed for v2.

> 
> ...
> 
>> +static int __init vexia_edu_atla10_init(struct device *dev)
>> +{
>> +	struct device *pdev;
>> +	int ret;
>> +
>> +	/* Enable the Wifi module by setting the wifi_enable pin to 1 */
>> +	ret = x86_android_tablet_get_gpiod("INT33FC:02", 20, "wifi_enable",
>> +					   false, GPIOD_OUT_HIGH, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Reprobe the SDIO controller to enumerate the now enabled Wifi module */
>> +	pdev = bus_find_device_by_name(&pci_bus_type, NULL, "0000:00:11.0");
>> +	if (!pdev)
>> +		return -EPROBE_DEFER;
> 
> Why? Can't the pci_get_domain_bus_and_slot() give you the same result more
> effectively?

Yes I think that that can work. I'll switch to that and run some quick tests for v2.

Regards,

Hans




> 
>> +	ret = device_reprobe(pdev);
>> +	if (ret)
>> +		dev_warn(pdev, "Reprobing 0000:00:11.0 error: %d\n", ret);
>> +
>> +	put_device(pdev);
>> +	return 0;
>> +}
> 

