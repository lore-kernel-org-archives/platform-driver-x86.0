Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148BE199B8
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706094384; cv=none; b=a+QJInIMPBZ6zxwJv3vENVrAsDscWhlPY9zwxn1x3kZbbJDlSgTq0DIAh5wv7v5ppKIo6eZHOZnjT5f37BKBakXQYc4ElxZ0Cmmef/SdL87RXp45oVhQjaO8Y3Yi54mGgS8KJJ986fw1+BXJuwjTMcmoAcQC+Jt5KujSnBIma18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706094384; c=relaxed/simple;
	bh=lbRlx22GKCgPiH7cIlxRfV65Lb8BPEI54cwvB3zTRrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoF+qT5mjiWW546ifuxQUGRWZlq2UHIHVcCluxw40S8NoixsApyVhIWla6BQ5YjjNyg4yyEwvBxJOn75ctCb+AkI8hLVyh4xTl2NScuvjtsBqrmyer5x4MGG3zu4RntMdGLmTR7R/ttVZJWUGv+XICGgnItjb4LBr5pVRKEzOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvxgre9D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvxgre9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706094381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEJsj9s6UrZVU9HHKu9/sQKaLBA5n9/ZMGfPfZAh1VA=;
	b=dvxgre9DSZmAwV5bZf+3kybB0P4pP/BLokG7FzpeREB1nj5QjqBoWiBXLy/ZLo2hElm6HP
	qq6XT0dfNVKDOdHIPoz2hhf9UQtjPPpjq3i/M91Mpx5X9ocX/WG3hvQI6zF7cjSz8xQyFX
	TzlfrPBn7goE90s/iyMCcafYS8J6ULw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-dMeXcpkDNXChDJMFt8aShw-1; Wed, 24 Jan 2024 06:06:10 -0500
X-MC-Unique: dMeXcpkDNXChDJMFt8aShw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2eace36abdso229296666b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 03:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706094369; x=1706699169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEJsj9s6UrZVU9HHKu9/sQKaLBA5n9/ZMGfPfZAh1VA=;
        b=wembxdec9grhFEhqv6PdhPS9jviPSpaKDjdohU4FI9zNoDw3YPL1zNXwDVZRRIRam/
         eTrnURc+Ty6uHTCfh8uxFOHdkEweiiLBC+fRnfUM3fAhFJ0RAjjxgm2xT5sK/feCAf0k
         rh2zQtXOakgd78hF6SfYZu2xau1kWHmyFwKwQLHPMNyxLL7nUHq1ijwSBFJbp/VmH7gA
         +6MBDGMa+aVNDNFowgXZAwXcROW//2Cbldh+psiv2Ai/tJk2doqKfI990ihAHyyJ5AWO
         Nc0D5UnldQ9WVK8V/0AbX1v8oKxqxtbSCh6Trru/IaQ1igpZSIzSIGNDWCsS+ZIEBebZ
         z4Lw==
X-Gm-Message-State: AOJu0YxQtK5PseoGF+WjtJhEtDgkVy7D0nLUoJeDPF8Bb76adF6sXUi5
	d6s8pGuVR2XQ88kpN/zxrY2qfaDPTTqG61Yr9Zrq6eYBP/JqIt391YO6tIFYqBF/8ZkHWhX2CBT
	a6mBqLeojQo55rGFNRkIjEiZanjI6oRLsY+qjn8lyJ9cc1s0027MDfejIt14eZrYP2f1p94Ph9Y
	CMsLQ=
X-Received: by 2002:a17:906:3747:b0:a31:11d0:bf2 with SMTP id e7-20020a170906374700b00a3111d00bf2mr317087ejc.248.1706094369293;
        Wed, 24 Jan 2024 03:06:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4BTv3TZFjjSvIF5n95JYvtKyHGRetIQJx7TTAZ+OdsiVjrozN30qHTHlxx+Lhe5c7P5lbZw==
X-Received: by 2002:a17:906:3747:b0:a31:11d0:bf2 with SMTP id e7-20020a170906374700b00a3111d00bf2mr317084ejc.248.1706094368974;
        Wed, 24 Jan 2024 03:06:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vt11-20020a170907a60b00b00a310c9d0cb9sm673255ejc.121.2024.01.24.03.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 03:06:08 -0800 (PST)
Message-ID: <b057d7fe-aad1-4fc5-909d-6f45ff7969eb@redhat.com>
Date: Wed, 24 Jan 2024 12:06:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: wmi: Use ACPI device name in netlink
 event
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20240121200824.2778-1-W_Armin@gmx.de>
 <1862d74a-7b15-48e3-896b-30dda835f28f@redhat.com>
 <61d23b7d-8e47-acf8-f3b7-bea1544ca8fa@linux.intel.com>
 <f07b3156-2bc8-49bf-bc08-e40209b89cf1@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f07b3156-2bc8-49bf-bc08-e40209b89cf1@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/22/24 16:03, Armin Wolf wrote:
> Am 22.01.24 um 13:47 schrieb Ilpo Järvinen:
> 
>> On Mon, 22 Jan 2024, Hans de Goede wrote:
>>> On 1/21/24 21:08, Armin Wolf wrote:
>>>> The device name inside the ACPI netlink event is limited to
>>>> 15 characters, so the WMI device name will get truncated.
>>>>
>>>> This can be observed with kacpimon when receiving an event
>>>> from WMI device "9DBB5994-A997-11DA-B012-B622A1EF5492":
>>>>
>>>>     netlink:  9DBB5994-A997- 000000d0 00000000
>>>>
>>>> Fix this by using the shorter device name from the ACPI
>>>> bus device instead. This still allows users to uniquely
>>>> identify the WMI device by using the notify id (0xd0).
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> Changes since v1:
>>>> - use acpi_dev_name() helper function
>>> I'm a bit divided on this patch. I agree the new way of doing
>>> things is better, but technically this is a bit of a userspace API
>>> break.
>>>
>>> I guess we could hope that nothing depends on the old netlink API
>>> format / name but I'm not sure we can rely on that ...
>>>
>>> Ilpo, Andy do you have any opinion on this ?
>> Hi Armin,
>>
>> Have you tried to conduct debian code search to find the code using this?
>>
> I did, but i found nothing.
> 
> I am also preparing to properly initialize the device_class field in another patch,
> and this also has the potential of breaking userspace if some users created custom
> acpid configs to listen to those events.
> 
> I think we can revert those changes anytime if someones turns out to be actually depending
> on them.

Based on the above I'm willing to go ahead with these changes, with
the note that we need to be prepared to revert this immediately if we
get any reports if this breaking userspace.

Given the (unlikely) potential breakage I think it would be good
to get this change into linux-next soon for maximum testing.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




