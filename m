Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608791487C5
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122992; cv=none; b=mGBU8c4dxnm01GSDZyp5LSXUDEaoyqpJlnx6BsVtsNUwdbrqdvjPfDUDhUaHuQl/p94nwCT0BitzxPwlBCWerz8CbAn6tA2E18TOwN6A5mQllCS6tTFFmOOBx0sAK2G7WvkoX2q9swIzzWGcxkJeZbmcl4pDZNjdqIrvDiY0hV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122992; c=relaxed/simple;
	bh=8biU/ickpWe76K14lkA2KDYYxZtdSEcEx/1EAwm+qdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TK/5IZgz/C34BMDV8j6VQS84klwDxiXea+EFNhSO0lZWTpAGmTrSbAhaU+/AKHfLPoLg/vMauPxGCrLAMM031Azr/N5G3YCefHkHO2PeQbleIkK+7O1GtWiKlS2TRBwQiPckNE8c0S0Jky5N2myiyRy0JAtJqy2bmLrfU8w9TNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PquVZwL9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PquVZwL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qst8WqOT0USb1Wh280ue5YKleGdRWJv6QDUml7Hx/Kk=;
	b=PquVZwL9x4dmXWkyFg+LbEwgElqmFgt8Is++DMKmCtt8uGqrXGVnKI0HkXARpYV8dlHsYD
	UqSAyrTPKdhQxarzsYq1qNohuykNuywprwFgAJBQyw6p0pAK4cEulCMTKYjH4K+nDe69XM
	vFkK6WpYMIaS2a+xS4cjg+72I/wtUcI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-8hb6okXDNd-jDIxqDp7aQg-1; Fri, 16 Feb 2024 17:36:27 -0500
X-MC-Unique: 8hb6okXDNd-jDIxqDp7aQg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5621c809accso1493651a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 14:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122986; x=1708727786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qst8WqOT0USb1Wh280ue5YKleGdRWJv6QDUml7Hx/Kk=;
        b=c4lB8veYlX8GsF0S7Ys6HGvHNvKERRYz0VM8PwrjZsdilSVihGEFLwB/GlZC4VvtN8
         BMolmETkoM2hCroW9p3NHLyihvF6UhYVey3I4FNHTaxteX7gk6su68Id6Ox8fbM8mn9h
         OeY5aNkYMamNAN1ayErAhZDLScVBrUkAtHjn06YhHdPs0i4sknsxxWuPRgElJtIOh0l+
         X+nhrtT9K7HmmIqte4fB0gMhaNahnIxOnoUSAA46rRpr5pXWqPcnS1vJNM6dO9KOW+9N
         FRjMR/G2godAlnDI65vmTV+Y4sSubcyVGAUuWd+KCjWY/Hi7jbixo46jjR4fzGCBpsNr
         DHEg==
X-Forwarded-Encrypted: i=1; AJvYcCVHy6rZ5cTaummBxFVeh6PIWncqUCcKNe+jt0IdjiEJYhwSsD2wY58AqQp52FWsHegfuahTaF08TpofVCPXFsGVvJ8wcqhV6t6xkizK1lAxH5RBZw==
X-Gm-Message-State: AOJu0Yybj8N4CMWsh6TxFcvOC4CkXWe/Rxm4TFTKtE7FZAUNggp0UK4A
	n6kVEszXGsitmsfIk06MH70lqf3XLnp9mWaCUY3/7oAYRyYiT53+8A7jwR1ff9wImVD0CZWYsaR
	vDEH9YHKAsiIj1hCoVwqPbipYy8qaznLRlyL/cvvdJZDZWIHToaNQ9ipNiYmJyH5emqnD4II=
X-Received: by 2002:a50:ee89:0:b0:561:f4e1:8424 with SMTP id f9-20020a50ee89000000b00561f4e18424mr3954774edr.42.1708122986409;
        Fri, 16 Feb 2024 14:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuNz8F5aOKX7luV8mfoHAR8z6FdQC6NboykuTR4cwnxm91piSwezY7UMifORrvqWSWgw8AqQ==
X-Received: by 2002:a50:ee89:0:b0:561:f4e1:8424 with SMTP id f9-20020a50ee89000000b00561f4e18424mr3954771edr.42.1708122986085;
        Fri, 16 Feb 2024 14:36:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p24-20020aa7c898000000b005617a858f21sm375996eds.93.2024.02.16.14.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 14:36:25 -0800 (PST)
Message-ID: <774d159d-0822-4205-b214-95ffab03a988@redhat.com>
Date: Fri, 16 Feb 2024 23:36:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Tony Lindgren <tony@atomide.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
 <20240216201721.239791-3-hdegoede@redhat.com>
 <Zc_Sf73kfss-c2TD@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zc_Sf73kfss-c2TD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 2/16/24 22:24, Andy Shevchenko wrote:
> On Fri, Feb 16, 2024 at 09:17:19PM +0100, Hans de Goede wrote:
>> In some cases UART attached devices which require an in kernel driver,
>> e.g. UART attached Bluetooth HCIs are described in the ACPI tables
>> by an ACPI device with a broken or missing UartSerialBusV2() resource.
>>
>> This causes the kernel to create a /dev/ttyS# char-device for the UART
>> instead of creating an in kernel serdev-controller + serdev-device pair
>> for the in kernel driver.
>>
>> The quirk handling in acpi_quirk_skip_serdev_enumeration() makes the kernel
>> create a serdev-controller device for these UARTs instead of a /dev/ttyS#.
>>
>> Instantiating the actual serdev-device to bind to is up to pdx86 code,
>> so far this was handled by the x86-android-tablets code. But since
>> commit b286f4e87e32 ("serial: core: Move tty and serdev to be children of
>> serial core port device") the serdev-controller device has moved in the
>> device hierarchy from (e.g.) /sys/devices/pci0000:00/8086228A:00/serial0 to
>> /sys/devices/pci0000:00/8086228A:00/8086228A:00:0/8086228A:00:0.0/serial0 .
>>
>> This makes this a bit trickier to do and another driver is in the works
>> which will also need this functionality.
>>
>> Add a new helper to get the serdev-controller device, so that the new
>> code for this can be shared.
> 
> The above doesn't explain why the new code is h-file.

It is in a h file because as metioned: "another driver is in the works"
which will also need this.

And the code is large/complicated enough that I don't want to copy
and paste it. Yet small enough that it would be silly to put it
in its own .ko file.

Regards,

Hans

p.s.

About the other driver. I recently learned that some Dell AIOs (1) use
a backlight controller board connected to an UART. Canonical even
submitted a driver for this in 2017, but never followed-up on getting 
it merged:
https://lkml.org/lkml/2017/10/26/78

This UART has a DELL0501 HID with CID set to PNP0501 so that the UART is
still handled by 8250_pnp.c. Unfortunately there is no separate ACPI device
with an UartSerialBusV2() resource to model the backlight-controller.

My patch series for this will use acpi_quirk_skip_serdev_enumeration()
to still create a serdev for this for a backlight driver to bind to
instead of creating a /dev/ttyS0.

Like other cases where the UartSerialBusV2() resource is missing or broken
this will only create the serdev-controller device and the serdev-device
itself will need to be instantiated by a pdx86 driver. This driver will
use this new helper to create the serdev-device (client) itself.

1) All In One a monitor with a PC builtin

