Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBD134A6
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jan 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqvcBWqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704635288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhvERxvOalEfwV0gGkOaETxoePyPqiqQc+YVcOl96Cs=;
	b=HqvcBWqSi1UctVMQGA9i5pQrLIfEu1N9bDY+SF2TNxlick1YhWr+CF0keHbtc8gNwmEsFb
	DZLOov3o0cJL0cm1zz5tbOx3AhC7/1SRtq3G240aCIJDtR7qu9zD7pqkXgn6H45qdN2dN7
	xpwCC8GzvKIS8FNpizUnvDohA4xZDYs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-aHkn5v84NZqaIycSOXgpGQ-1; Sun, 07 Jan 2024 08:48:01 -0500
X-MC-Unique: aHkn5v84NZqaIycSOXgpGQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccbddbc79fso6986771fa.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Jan 2024 05:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704635280; x=1705240080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhvERxvOalEfwV0gGkOaETxoePyPqiqQc+YVcOl96Cs=;
        b=kKAiNXDR1T3XJOAZRCsb7YFtcdWoBGmwPV+tc8UA57r/PT/pPeiKULge4LtWja4n/T
         gW5pbbOq8NdFxNFaQM3gXC/PPq9mmW7vx6l2F4c0uZG0FCFHTT6IFtWVw70CNIDDOMdQ
         N81+jTjGTmQIAAEyICIieB+Qtwicbo/UzBH8/B1DGdvPPNDUEeKNJt63imkEOLe5gP4h
         ntxLTz7/00xTNJIW0b/dH0WVR683VkEpecuZuXFthsQVEt74bankYQzr0FzQiJ61z/73
         On/c0OOL12kycSfNF5jYnmiKlU9fNGWtB8M+Wc7NA8+KDWQcUmpI7QYT8Rt+Ninz35U0
         ZxEg==
X-Gm-Message-State: AOJu0YxMwl+v9j+msMp6ee1rS+e4+zlUPp2P9Xqw+YIG5huk8p8xxXu/
	LmTbPDdd724MGnIwjMLQvvpQhN9VLjVOHr49GE8XrD1QdKgWvE7P+TTuSk1Uf5Rt+wqxur98KRA
	qCmTqLQxKvkHlidoWecpEdhmZJHLHE7iq/vSUVfLT+Q==
X-Received: by 2002:a05:6512:3ba4:b0:50e:b618:df09 with SMTP id g36-20020a0565123ba400b0050eb618df09mr975985lfv.1.1704635280353;
        Sun, 07 Jan 2024 05:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG24C0oMyiajG+Ye4jxdj3p/B7I+wQEMhx5Iv5KlZT2nAlwqVYOpQmjgxfh4N1KYtll9JK6xw==
X-Received: by 2002:a05:6512:3ba4:b0:50e:b618:df09 with SMTP id g36-20020a0565123ba400b0050eb618df09mr975973lfv.1.1704635280012;
        Sun, 07 Jan 2024 05:48:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d35-20020a056402402300b005572a1159b9sm3139239eda.22.2024.01.07.05.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 05:47:58 -0800 (PST)
Message-ID: <7945afcf-da89-47c9-a59b-eac61a640411@redhat.com>
Date: Sun, 7 Jan 2024 14:47:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/platform/atom: Check state of Punit managed
 devices on s2idle
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
References: <20231231163322.9492-1-hdegoede@redhat.com>
 <20231231163322.9492-5-hdegoede@redhat.com>
 <CAHp75VcLBBuVLeqEFOuj2UNX7kUniXY6h18jH2s7zRCpq28mVg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcLBBuVLeqEFOuj2UNX7kUniXY6h18jH2s7zRCpq28mVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 1/2/24 01:07, Andy Shevchenko wrote:
> On Sun, Dec 31, 2023 at 6:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Johannes Stezenbach <js@sig21.net>
>>
>> This is a port of "pm: Add pm suspend debug notifier for North IPs"
>> from the latte-l-oss branch of:
>> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss
>>
>> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
>> functionality this can now finally be ported to the mainline kernel
>> without requiring adding non-upstreamable hooks into the cpu_idle
>> driver mechanism.
>>
>> This adds a check that all hardware blocks in the North complex
>> (controlled by Punit) are in a state that allows the SoC to enter S0i3
>> and prints an error message for any device in D0.
> 
> ...
> 
>>  static void punit_dbgfs_register(struct punit_device *punit_device)
>>  {
>> +       punit_dev = punit_device;
> 
> This is not the correct (semantically) place for this.
> 
> Instead, optionally introduce a local variable in the
> punit_atom_debug_init() and assign the global one there. Also it seems
> that you may move this global variable under ifdeffery (and hence its
> assignment) and have less stale bytes in the object file. (With this
> said, it seems that local variables are plausible to have.)

Thank you for the reviews. I agree with all your review remarks
and I'll submit a v2 series addressing all of them soon.

Regards,

Hans



