Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C134CFBA
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 19:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762975581; cv=none; b=hC+0N31eOqtfUm3oKOB8D3kWHVAcMXgMW0zIUTG9sU4hQxlWkIbKlvyQCp9X79Y6OplNK7eIfUqS/lKsWW0RhgbvwHSttNC4qUaWHlNdv/ZWuHJdu6+Op14mhr8FDvSiJ28ZHBa1LqC8yXVCuvO6phdkvODrx7S1SBaNOGxnpAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762975581; c=relaxed/simple;
	bh=7+aqrc7gxrvbg0zoPLO/qVZC3fC6KwrV7sIZ7rdS2Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrSTZA5kHgyETK6/rUMdEJGaxRLerO0eZJITGwsyatNJGA8JxrPC5+ioRTXoZvJopSpx5CA8NbnxcHqx8ZqUSSeJ9Rbo4S31MwFltLcYpj2OEJFjVcyCjUt5QRfAH2tNpiu87BWwRghozQ+dKlLO6pfJHQYHAdbarbm4JX8CPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBjwEVbM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBjwEVbM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477775d3728so450595e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 11:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762975577; x=1763580377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOvdwmjF3vj/wtjElLtlYhjlH8fqcUEkQXd8Ow1Ngqc=;
        b=fBjwEVbMHSRk7tDYsximaakAae2OZYK12OZHFgssbGIRbzEZOqB4Nu+i5fG/JqNfIk
         SBRAMgXycWrX+0zClzuGBnhFtK3YvqbvbO2PLJJ6G9Syp5ZTsjK7aBEL1SiFlQky/n0e
         7DG72PYNmec9H119fnE/VS9J+EGTzrT0xQYAsYoh6H0JUasGWV8Y56xPPYDpVXYE1MNc
         vD03TF6zI2Gk0suTbfbWujEPkSK4XTP50YJDozbmKmZ1VC1o+0WibDsxobglXNFykjCK
         gMR4YmRMWHpTRrg/vcBQUPdD85onGcScniTUAuOn7WDg1uFOtu0lmTfxdueDuICSXqyU
         Ul4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762975577; x=1763580377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOvdwmjF3vj/wtjElLtlYhjlH8fqcUEkQXd8Ow1Ngqc=;
        b=Ns5Q/6vcMV7/jCaosqRWCS+XezOuKJ4oowqpjI3UDBUSAY2XseMfwP/GPw7NcEjDuz
         yblKVhgdjw8fS27swOELsmZONfb/lJb1Dq8jW4yBdJXUfwRJBG50BPlimGqnXQv50IEz
         PFd2CQ/m74uvPCIHIRgJht4Sp9FjFHYGnEnXju1uL8ZHaOWqVCRe4ued2/OpuuKOWWwF
         3Igbwq0Rwa8xcwEVG1r7WBml5atCZGe+jjHyDMn1RCAYvlA4DcnXUfVI5Vmim4afPKjr
         f8m2+JEyjZoDkCOxu88iWbMkSzhSl1AJuM3XNar95k8CuPhQzKTfMREAoCHxAh7bVcN0
         xx/A==
X-Forwarded-Encrypted: i=1; AJvYcCWgSYCO/ouOON4HCUCeJtI4qMTQ4zAJSCqUtgMpqF8lICoTS9hDvowRJFr4YL3AtrtLcSr2nbourEI52ccjR24ScpNM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqbXSurWfPNwxv1/voCcZB9wt6a+U7iVstPr2J973Z5y0XkEe
	sWAJ/ZU/6MV06ucMslq0/UCVr8W8NSbXVYcriAndduUnK1uV2oJXJOiB
X-Gm-Gg: ASbGncvLx59VEt1BUg39pDS6fxlTwBe5xx6UUg8PlkloW5RWf84Q0JttkzEFq0S3Upx
	p38X+XhC5Y1wL8GBxlsglWPiDD1v9YG824fyby0kk0pViclQs8FeT0qIE51IIrzZf2qznkm0/+u
	ZVFtWbLG+NHhm0DFZNtHGUVubg6q6ItMSXprvvTam+55NWPFrkR24ypGX07KLkV8irEiobT01Tf
	EjlWfDBPRh0bStGOZIHtGzyxMYO7CioGKRdJuno0iKAdmC5631O+uA3YrAMYk5E7zqAjBUmagFl
	PO/gzoF5mifGuKGHmPIKwrXJXqjNdLQR0PjFf+zkJQjECLc4zaXCWvUVx5pGhDP5rYaw9k4uzWS
	RDCXR3kWJlPl04z6Zvoi5zjgbUT1IEt9xwMT+2uP0nYmiam6pmOMa8bp1Bh1v8p62l2kDYtSkss
	QvTv7j2ff14/WU
X-Google-Smtp-Source: AGHT+IGI0yaeZ/Z25ZuhwdvsHgYCdSxi9R5gy1iKkdGjcDReF/a2PryusG5lOqIA755v9T/eszRQLw==
X-Received: by 2002:a05:600c:1553:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4778703e886mr43755065e9.1.1762975577353;
        Wed, 12 Nov 2025 11:26:17 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b314dae4bsm26087760f8f.34.2025.11.12.11.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 11:26:17 -0800 (PST)
Message-ID: <83e65d27-73c7-465c-a5c8-861608ea93e7@gmail.com>
Date: Wed, 12 Nov 2025 20:26:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/9] platform/x86: Add asus-armoury driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251102215319.3126879-1-denis.benato@linux.dev>
 <aRSdHcO1WCPmG63W@black.igk.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <aRSdHcO1WCPmG63W@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/12/25 15:43, Andy Shevchenko wrote:
> On Sun, Nov 02, 2025 at 10:53:10PM +0100, Denis Benato wrote:
>> Hi all,
>>
>> the TL;DR:
>> 1. Introduce new module to contain bios attributes, using fw_attributes_class
>> 2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
>> 3. Remove those in the next LTS cycle
>>
>> The idea for this originates from a conversation with Mario Limonciello
>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>
>> It is without a doubt much cleaner to use, easier to discover, and the
>> API is well defined as opposed to the random clutter of attributes I had
>> been placing in the platform sysfs. Given that Derek is also working on a
>> similar approach to Lenovo in part based on my initial work I'd like to think
>> that the overall approach is good and may become standardised for these types
>> of things.
>>
>> Regarding PPT: it is intended to add support for "custom" platform profile
>> soon. If it's a blocker for this patch series being accepted I will drop the 
>> platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
>> separately to avoid holding the bulk of the series up. Ideally I would like
>> to get the safe limits in so users don't fully lose functionality or continue
>> to be exposed to potential instability from setting too low, or be mislead
>> in to thinking they can set limits higher than actual limit.
>>
>> The bulk of the PPT patch is data, the actual functional part is relatively
>> small and similar to the last version.
>>
>> Unfortunately I've been rather busy over the months and may not cover
>> everything in the v7 changelog but I've tried to be as comprehensive as I can.
> This is more files starter with asus in PDx86.
> Perhaps it's a time to have drivers/platform/x86/asus/ ?
>
I will leave the decision to you PDx86 maintainers: I'm fine either way.
Just drop me a note and I'll move asus drivers if you decide it's the best
course of action :)
