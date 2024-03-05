Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E1A10A1B
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631958; cv=none; b=DdpkF13LI9QZD2RDQsZIJCCr1z0P+tQr5Ko2U6GfLuYBYt5gE9wy029O5B7b/yBudDuBvYixUbjE6o9U/FNtDrB22Xgy5+JWDyxN13OSPOJji1ls+s4gY3YpJ2KZ7yAzFJTCKgthx+WaDftGlUYeUqb2CTQsacSwxmAyLQim5eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631958; c=relaxed/simple;
	bh=alx5vZWhVICl/ZFpuQPCzqgZbWSwvb1KNFLEtUSsUps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3Ahan8JT/6esMaIGThcWYk5hB8K17dH6BndPDEPY8EnDVqvr8x0PlZNThsYsd4dxvHwUqIBUMPkDFtg5JZrOTEvD8fINehyJG3coURNAlDIAyq9uqkkAgwIO4f7b+Ui71siH2hDK2IyO9gshIHP+SZquTGKQqw8ruWToV6k7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRIrskSW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRIrskSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709631955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6JX6F3nXLvj1jwiNNTV/fr6BirH4Aq8WGV1ynyU4sI=;
	b=HRIrskSWnGvGx4dbxQz1yaXDB/UaHmeOs9F5E52CYBo/zZg+owQfPd+r6LMAjki8lRfDqM
	kw8D5LQlNGrQkmRmtMo8VkBPLecJK/RnvisjebSqGDWZo3sFngfeDJnhRukNwj/13y9hVA
	2/xR/JCLlPwDRSL1+rORCjfxLl/GfFI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-6n5I2QGgNbiZuroEHUN1Fw-1; Tue, 05 Mar 2024 04:45:54 -0500
X-MC-Unique: 6n5I2QGgNbiZuroEHUN1Fw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4489805a2dso180622166b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Mar 2024 01:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631953; x=1710236753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6JX6F3nXLvj1jwiNNTV/fr6BirH4Aq8WGV1ynyU4sI=;
        b=ng+h6R83CP71hnalpGErlrOybGNGaZ1zl3xhQ/FdO5l4R3gj7ed1uvQPhOtWL+snzo
         jViQFTn/diPl961hRmKPJEpP4+fern5GUjH1p3UkbqSlEKbdvTc+Xm7wFTXp0IPhI/kP
         GxZm8F13Gm87niPNCTHS4YQYczfoNTTl/X2PhXh3feJ0/kvvmMZuROk76GKHuiWwEoaC
         NNvFq3v30IbPq3loF7P5wJjDQNeCeUutb3PToN0JfbEzaX6L8PfDo5hjsRMkA2l7j3Fv
         veLW+FfvRhglMyZurjc5HTMj7SCVBWkhWDCcfUvkHE8BixL278/1tDPHbMd6M/JPBZlP
         gYNg==
X-Forwarded-Encrypted: i=1; AJvYcCX5+fK8Ql3g6iP24jzkJFFNPwI9vlhOhvz2XPD4PUp1OSJ0VSxQsOfe7lGGtFXUqg6cnV/3VDpvhBmKHixKBIe2mRKOM8QmV43axDXmKPw2yY7obw==
X-Gm-Message-State: AOJu0YyQIEONF+ceWuHDfpFQk7bfS4+galiXvlv4RTeoW0w+pr2pNqvb
	bKjxTnm4S7GL5XWnazA7TAUMaUXsc4Q4vZ2jFQTz4oytljW2hm8KnpEwelVZHI8SRc6zqlzBfGE
	0u2SgySp4gJSIFlv60E8XJgYlPYOZOksK1gUGSbn9Ma8vT9fMygNK8ch8Ql8db1Hqri9pneI=
X-Received: by 2002:a17:906:338d:b0:a45:40aa:b37a with SMTP id v13-20020a170906338d00b00a4540aab37amr3499652eja.13.1709631953182;
        Tue, 05 Mar 2024 01:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwn3WAHwsT+aYTdDF5QSnF24M87Z5FDHHkdsOZOBy/fgwLpb4L/OhiKGoXY8s3qCwMohrnTQ==
X-Received: by 2002:a17:906:338d:b0:a45:40aa:b37a with SMTP id v13-20020a170906338d00b00a4540aab37amr3499636eja.13.1709631952837;
        Tue, 05 Mar 2024 01:45:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906265b00b00a441c8c56d0sm5819398ejc.218.2024.03.05.01.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:45:52 -0800 (PST)
Message-ID: <79967edb-cafa-4fbb-a551-2628b5b68098@redhat.com>
Date: Tue, 5 Mar 2024 10:45:51 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] platform/x86: p2sb: On Goldmont only cache P2SB and SPI
 devfn BAR
Content-Language: en-US, nl
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 "danilrybakov249@gmail.com" <danilrybakov249@gmail.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240304134356.305375-1-hdegoede@redhat.com>
 <20240304134356.305375-2-hdegoede@redhat.com>
 <be1c9329-1d24-4f49-b200-c8ac551b1fe2@redhat.com>
 <j4ezzqwp4lmgd3lx3utjebaeydacpvivq47xcmfolvz5ww4qyx@iz64qlexsxhy>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <j4ezzqwp4lmgd3lx3utjebaeydacpvivq47xcmfolvz5ww4qyx@iz64qlexsxhy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/5/24 01:54, Shinichiro Kawasaki wrote:
> On Mar 04, 2024 / 17:47, Hans de Goede wrote:
>> Hi All,
>>
>> On 3/4/24 14:43, Hans de Goede wrote:
>>> On Goldmont p2sb_bar() only ever gets called for 2 devices, the actual P2SB
>>> devfn 13,0 and the SPI controller which is part of the P2SB, devfn 13,2.
>>>
>>> But the current p2sb code tries to cache BAR0 info for all of
>>> devfn 13,0 to 13,7 . This involves calling pci_scan_single_device()
>>> for device 13 functions 0-7 and the hw does not seem to like
>>> pci_scan_single_device() getting called for some of the other hidden
>>> devices. E.g. on an ASUS VivoBook D540NV-GQ065T this leads to continuous
>>> ACPI errors leading to high CPU usage.
>>>
>>> Fix this by only caching BAR0 info and thus only calling
>>> pci_scan_single_device() for the P2SB and the SPI controller.
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218531 [1]
>>> Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Good news Danil Rybakov has just confirmed in bugzilla
>> that simple patch fixes things. So IMHO this is the way
>> to move forward to fix this.
> 
> Agreed. This simpler fix is the better.
> 
> The functions other than 0 and 2 were totally in my blind spot.
> Thank you very much for finding out the good solution.
> 
>>
>> Shin'ichiro, any objections from you against this fix ?
> 
> No objection!

Great I have merged this now and send a pull-request to Linus
with this fix:

https://lore.kernel.org/platform-driver-x86/cfc29d60-e11c-4d7f-9d9d-637ebde8f5fd@redhat.com/

Regards,

Hans


