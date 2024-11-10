Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C78158214
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 22:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731277661; cv=none; b=kl6Q0o9zU6RJ2U7PBdOh/u4qRQIDCsutxeSsNZEuSGiC7lNU83AoMy+vcBaXgdDeBUJFXG09Quq30zXdpcBNH6LUKIKc3tWKacAhj/UAEHE9NzPs5l8zeZ2H5hTg6pleOFT90+LBolRa7kM6HBqM0qrTx9i9IDXq5MeHOVHte7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731277661; c=relaxed/simple;
	bh=4HQmFCpy1v0e/eVOIsz7BXEMy9y8P8ZpvYfelafaUyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9bFPEqYXKffwbwhFI/IbV9o/DSWq08nsLGXwM3XXquauoVw7c1vVKggG3CVx4Ww2hU4avn6mOj7MTkAIInnEGEg1wgXE4ESIHPymaktd81WzF8uDI8taGwtfGjCUKvGo/4u5ZJBMpJhu7VtF6nbCgVQ7tuG4A39aUa1n7Gid6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f++73YZp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f++73YZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731277657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZzxAKDhWWNzmD5tkd0ByXqOOZ8LIAMYacStp2Df0Xw=;
	b=f++73YZpIb7SF6T8+YZ42vqUsrcAiM/kXcei06Ji3azKczQyTy5dyPilHTV9MY1M07tADe
	1UWVy98+R9vcTFCzHXRJZz2AiAkHKE6imSlhZHLfYyaUZ/nIrrDpx2pikl3UuXs+wQCZ8f
	IzfVD5+Bqb5pUp+FtoedB0Xgtj8HLbM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-rUUvXuw8PnutgSb5mbZoHQ-1; Sun, 10 Nov 2024 17:27:36 -0500
X-MC-Unique: rUUvXuw8PnutgSb5mbZoHQ-1
X-Mimecast-MFC-AGG-ID: rUUvXuw8PnutgSb5mbZoHQ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5cd50bf580cso2777952a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 14:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731277655; x=1731882455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZzxAKDhWWNzmD5tkd0ByXqOOZ8LIAMYacStp2Df0Xw=;
        b=jEeNCqK0u2HI3Zyrywro4e+wEKL+95VzJZWKRHn0sjPK6vxeb6RR5f8cIp4+0m8lkE
         yEMBGmemLsS5Ad/yzsESJLNAbrfSkaVMDfqnpg9GYUWKMGVH5XGhf8Uo7h1NNJhm349p
         J6Nu6Mqrz7mogIZD8+xMBZYoor81IeqnPyHlufhGsMZyzzCFgtz0bBOI+8KdRaWO+po1
         nmPu3scAsH3EHyS0cdJgX+fh3Dvw2g8Sn2M9M3RhOn4YorpHt33D5u8+Z32ZbcAleja8
         ucBy2kRoizVHGDLM1EOy2D426lT4R30CCLk5xRYGspRI+QwPLrZGYduTOszLF6InKPM1
         7qEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEAGv+qmJc1MiH2xiLWTcIssKxKN0eQ3Fdyb/cGcgZL5l6BYhfsyqXEQ31PeJxHXcoEb0yfy07uqU0AmyhIrnxzFNB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Z8iWVTEETjYVuDy/jpnYAxKqEDIaKONuzH1/rNf63w5jWilM
	r9e/H1q3+K+qMdi2s7umCMah14JaXYnC5kbxAS9VdJSXQbn8G28Gq5wBnyErJi3OHaPeR+IdKlM
	6W9p46Ze33CbNmsB0hHtoFLKQRm7VrGlywKoKdrVjnM8POa+8Zte3eC+K6Yxl0BtsV+ozkuajHa
	VnhrzxQg==
X-Received: by 2002:a05:6402:2690:b0:5c9:39d8:58b3 with SMTP id 4fb4d7f45d1cf-5cf0a447552mr8468413a12.23.1731277655121;
        Sun, 10 Nov 2024 14:27:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiU0+ynfDHMGRaM1T6yG2bj4szoljDRRNocXhL2H99vw/bdh2mewycOmn5L08hyY9ehaEhmw==
X-Received: by 2002:a05:6402:2690:b0:5c9:39d8:58b3 with SMTP id 4fb4d7f45d1cf-5cf0a447552mr8468400a12.23.1731277654662;
        Sun, 10 Nov 2024 14:27:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ede3sm4265318a12.55.2024.11.10.14.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 14:27:33 -0800 (PST)
Message-ID: <b8340169-5832-4aa2-8713-9639b7f7aec4@redhat.com>
Date: Sun, 10 Nov 2024 23:27:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Add support for
 getting serdev-controller by PCI parent
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20241109220530.83394-1-hdegoede@redhat.com>
 <20241109220530.83394-5-hdegoede@redhat.com>
 <CAHp75Vcp1AxcZcAqoA9e-YXerHPaRAxsoGT34R41aQeaMUrgCg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcp1AxcZcAqoA9e-YXerHPaRAxsoGT34R41aQeaMUrgCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Nov-24 12:51 PM, Andy Shevchenko wrote:
> On Sun, Nov 10, 2024 at 12:05 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
>> (guadalinex) using the custom Android kernel the UART controllers are not
>> enumerated as ACPI devices as they typically are.
>>
>> Instead they are enumerated through PCI and getting the serdev-controller
>> by ACPI HID + UID does not work.
>>
>> Add support for getting the serdev-controller by the PCI devfn of its
>> parent instead.
>>
>> This also renames the use_pci_devname flag to use_pci since the former
>> name now no longer is accurate.
> 
> ...
> 
>> +       if (dev_info->use_pci)
>> +               ctrl_dev = get_serdev_controller_by_pci_parent(info);
>> +       else
>> +               ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
>> +                                                info->ctrl_devname);
> 
> I would expect that they both take info as an argument...

The "old" get_serdev_controller() helper for getting the controller
by ACPI HID + UID is also used outside of the x86-android-tablets code
and struct x86_serdev_info is x86-android-tablets specific.

>>         if (IS_ERR(ctrl_dev))
>>                 return PTR_ERR(ctrl_dev);
> 
> ...
> 
>>  struct x86_serdev_info {
>> +       /* For ACPI enumerated controllers */
>>         const char *ctrl_hid;
>>         const char *ctrl_uid;
>> +       /* For PCI enumerated controllers */
>> +       unsigned int ctrl_devfn;
>> +       /* Typically "serial0" */
>>         const char *ctrl_devname;
> 
> Why not union as we have a type selector, i.e. use_pci ?

A union would be possible. I simply did not think of that.

Not sure if it is worth the trouble though, since it saves
only 8 bytes on a struct which is currently used only 3 
times in the driver.

Regards,

Hans





