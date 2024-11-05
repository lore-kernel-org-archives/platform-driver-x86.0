Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1BD18DF89
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803635; cv=none; b=Uo96Wfnpyo6ZQpSeFWeluiYpoPjW7lgQ3upAA/cuKVBI7Ak429rusq44y/ksKpJZGPlKSi0TvmpSiu5HqLyPqOG8O6WiY7z2FvYBML87GNqvRiy1s4lM3Z2P+sclnu3uWGwgCvLq4IrCgvzKVDNpMt7mFaff6/1euYWVPqhjZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803635; c=relaxed/simple;
	bh=h8Kv7/RZvHuawNgd42oJXGY4V+Sq0HHRn8LHv79u39c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZO6RIwDro93sn9EvfTG3/f4yWVzL8Y6inD3glrXUYm1mAS5KxtvvoqpfVHBfZBrLo5Scpqw5SQnfybSMw63C1xt4I1O28tJ9+AAo+wK/RqVBF9Oi4zs6LQuLAF2VD4iAOUol5EBVQYaZ/DJZwM6trhICJVqhRlfU/M0F+AnooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxoELPxp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxoELPxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730803632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xBZUnzBCxpospD3y8So4ntP4QZXU/cA+OpxDESY8LM=;
	b=SxoELPxp8zhyJqN6wGnffhnqaLgjZbzzjII+VYMMx/h4KmMGR9luqqJUAJ0KyAOd/vgv1v
	U/ULS5niv5AxTVNJ7OE7a2HVUWrKdvPFGbSjrkQC3DImVg/JWDx4bAasKUKiRf6XH0//9c
	HoaQuiAmGiSyNLvqH9CO3VIhGV7M8KA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-JJ9B_1U-MZOercQ2Mx30Iw-1; Tue, 05 Nov 2024 05:47:11 -0500
X-MC-Unique: JJ9B_1U-MZOercQ2Mx30Iw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9e0574854dso439859666b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 02:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803630; x=1731408430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xBZUnzBCxpospD3y8So4ntP4QZXU/cA+OpxDESY8LM=;
        b=tgo59qkgfCr+VaFYMazk5FAllc2Q9wIMkA3mFjyXhXr8tLHkksPHR9eqH7QEkhLQJN
         HZglWUyA+CV87cTusztDZ8hQVweQJeNnbAVMUbIMrHB98nSk0cdQkUdo/6u41mchZeI8
         pD12J0RNW4NYCZCg2TbJKwMRDSeY0lJgR2BN6ctoLGJuDVEhGYAS38e1Ef1mforMXzb8
         OzqYpA8gAKa79ol11Ot+PcSo0uRQ5t9vWppmLP3AW9BlHNPA77XUgJHxpR6YPwBH+UvC
         NFDuI4JXv948zLuE/aQRgGrdSCeJB6QUEhaC495B8JZ6hP+mUUM+pkmHEOwS1BAcVf+v
         FIFw==
X-Forwarded-Encrypted: i=1; AJvYcCWV8DZLK/do1HAKnJooRAteZs2nNkiXjJHQZ2LBf+ttKbIoL+6E7vlhWAqWnbxFs8GoxdgIeLHWdYZjy6HMngCnt1GI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tEwb0Cymo9EHTUqnmXj/kNRbAMmBDrid/7vHqg/8oco2i1sT
	DzddvBrfvErJoQzrCbHbUWdRZPArsN1XIlPSINfYyu4KlulmducZ/X1B72V+cMalUC6PuSAjQXS
	KmSHp5jpsCxAkJLIiNmAUe9jiRSuADyD48fsx+jMjsiD/RuqXmdmlSbPgc80986ehT0JQQ9k=
X-Received: by 2002:a17:907:3e06:b0:a9a:80bd:2920 with SMTP id a640c23a62f3a-a9e50b9e39dmr1715917066b.53.1730803629967;
        Tue, 05 Nov 2024 02:47:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr3ja0h+AGgTJMBnwCk035iYpv2PASqFY9KZMTzYblsCjU7Eevi2GIV5EWb3KhR1cPSHIscw==
X-Received: by 2002:a17:907:3e06:b0:a9a:80bd:2920 with SMTP id a640c23a62f3a-a9e50b9e39dmr1715914966b.53.1730803629573;
        Tue, 05 Nov 2024 02:47:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d9d68sm115740266b.72.2024.11.05.02.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 02:47:09 -0800 (PST)
Message-ID: <20b471ed-2e49-4a45-9b1c-25d9c2a181dd@redhat.com>
Date: Tue, 5 Nov 2024 11:47:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add support for
 getting i2c_adapter by PCI parent devname()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20241104200848.58693-1-hdegoede@redhat.com>
 <20241104200848.58693-3-hdegoede@redhat.com>
 <CAHp75VdJZeVmAjceMYQ-QZf-+RHAY5Y0nuyXgtVFzSiQ4yMPag@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdJZeVmAjceMYQ-QZf-+RHAY5Y0nuyXgtVFzSiQ4yMPag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5-Nov-24 9:22 AM, Andy Shevchenko wrote:
> On Mon, Nov 4, 2024 at 10:09 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> ...
> 
>>         struct i2c_board_info board_info = client_info->board_info;
>> -       struct i2c_adapter *adap;
>> +       struct i2c_adapter *adap = NULL;
> 
> Unneeded change.

Ack I noticed this myself and I thought I had dropped this change,
but apparently I did not.

Ilpo can you fix this up while merging or do you want a v3 series?

Regards,

Hans


