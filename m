Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615A223300
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907675; cv=none; b=ZtEeTkOKevUeFDX/n6jsFACGtGrJPCB9GdFX7fFm2MRpkXTCHW3jWrdFaCJF4KJtlqYroLP57zIzDguT2ahf+f6BfDON4O1SopEWeYNKZIHU1i/VV/FY4vhjqbHYV6UYOdeJwwJL+EEYJZ1pRyNRbPAk6Mr/pKW9eUeRO1NV5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907675; c=relaxed/simple;
	bh=h6/GPEghvhSkeXwTBqm6r+HEyUwZXX3Ca1eSmxNePOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1aTX0DEMlAP0pE++4/Tz/Qth/QY0iqYZV1rQBAzWH4clW/fLcaTgSW72n3bmCHsLzAt5EMS5NExLfie1hLo4/MqrTjJinBtNG5gmFAX6nYMeO1szw6bRHOHr0YGgTU7rD4SEqFIiclRxG6siw5A2ufJa6RB986xNNZ/Dw17RHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=hBuoFNdA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="hBuoFNdA"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-724d23df764so5892474b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 01:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733907672; x=1734512472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77C7hNK+3rrcSKRRz1xgyqh32SAcb6JChagVm755Fos=;
        b=hBuoFNdAb0WjLdaYYk1ln5n1QikYe/sMurMCgxuwXTrJ7aXX+/5YncMYVvBLxNnZ6K
         12dtWj+HJ8K0PUdTE/Q3LUEiE5gG4tDk8DdSEMIVPcDQtJcupdownV4qT/VOtKDt7tcq
         ftpe9F5b5UTFLfI46TiQ181sSdmYM+qgbRpPi4mtt0oKr69W/2mEcNe8GjxEpPcYyVQT
         muIoGDVU1RHqD78zC2qHJAK+ALXR39npqwud1u/OuGHiMq8xAmhUZyF56sHWCYryvKZO
         cAmXKr5NdtN/NBCmYd5wWvr/ptldjAPLvTDY77kc1ocpUKpR6rfZu3Qi3RM5sQ+zoDUq
         logA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733907672; x=1734512472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77C7hNK+3rrcSKRRz1xgyqh32SAcb6JChagVm755Fos=;
        b=AYB0QIynbWyu91SaI5qbHH5tQ2yfM8okmguUzxqX9DbpRO/C8ZJx3l/Bx8g2bVAfxg
         Tja8Nm57yW0Me54YrryKEVTLYlCepGT6M3nKL32V3jHqWw2f35Jl7fBW3mKAg7uepOcP
         cCxV7zTu3Dlqilu+BSEFKlmimCfb3SJaRyo5PwdVeFPkC7jfNogc+VBCtv1BMD1quaic
         VHuBKIKEnKqT6W8FJhWhJiAO21VjtFTZ+zfb7xCmOI+ouA/wktCTlfBegTjeeVjLkrmy
         6/e0q80bJAMNaWIa0+fLrlHmJXzMbjfxmMjw6MSjUNuQVY0gDn3v+GwtSiGdMYIm88Nm
         mTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+uNfsgsA6IxXCYBpnKTVA/We5OhZblxBUQC5tOzzD6ad1fTH7k3msob8Wzxg3wdmoRgQnUxtnTC1V8X4xISbOt+t@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtypXy1zzvarZFYjx7PoiZ70mtIYmWBttQGmQjjIiFT3Vdyf1
	iWFUp+yQ+sXYv5l1uBVuVcldrSPP8s32xZ0m0y5+fwSZc5uY13jkmP7KwhO3AoajI8B7ivQby2h
	9ir35BQ==
X-Gm-Gg: ASbGnctJYomTZQROZX/eDiHPP7s9qewWfWXad1cXQcGEyF1Ko85rCJGgC8+Sl9lDwSW
	7dXAMbIhiRFkHO/KnhLb8uJCephCRWFfJgsQ9/OjRy/tQGVKKgaeGerTnqvDZ0qAjD2/4iG+DHj
	Izc2SwYXidFANQl9nFAJo17q0XaqIKorLbn6VrQ1ZKd7eaRlYnNuH0ZKPCyj8UxKMaxASoSazAo
	tWRy60qRTv6cbVZ2VEMoUAySe5D1tTngW0OCooypMw88JmzlzZmJKGeiF//Bfx6v2baRCVpzVcZ
	H8n13Ugxhy3FQxVPwM+WXgDyMeMFVuk=
X-Google-Smtp-Source: AGHT+IH4SGY0emDDzqokxOKxPyaaYNjJSyVEdHX43IipqAiw/yNopBsDAw8fq+0lxBoCwC9i7Gmgvw==
X-Received: by 2002:a05:6a20:12d3:b0:1e1:aad7:d50d with SMTP id adf61e73a8af0-1e1c140d7f4mr4553283637.46.1733907671766;
        Wed, 11 Dec 2024 01:01:11 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725de3cb93dsm6427831b3a.169.2024.12.11.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 01:01:11 -0800 (PST)
Message-ID: <233d9c56-1e5f-4377-a52b-1d02df13f760@pf.is.s.u-tokyo.ac.jp>
Date: Wed, 11 Dec 2024 18:01:07 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: adv_swbutton: disable wakeup in .remove()
 and the error path of .probe()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andrea.Ho@advantech.com.tw, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20241206094848.1650137-1-joe@pf.is.s.u-tokyo.ac.jp>
 <4e5fc1c6-ca8f-51a5-8ec4-5891166d8732@linux.intel.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <4e5fc1c6-ca8f-51a5-8ec4-5891166d8732@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for your review.

On 12/10/24 22:52, Ilpo Järvinen wrote:
> On Fri, 6 Dec 2024, Joe Hattori wrote:
> 
>> Current code leaves the device's wakeup enabled in the error path of
>> .probe() and .remove(), which results in a memory leak. Therefore, add
>> the device_init_wakeup(&device->dev, false) calls.
>>
>> Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/platform/x86/adv_swbutton.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
>> index 6fa60f3fc53c..523836be6d4b 100644
>> --- a/drivers/platform/x86/adv_swbutton.c
>> +++ b/drivers/platform/x86/adv_swbutton.c
>> @@ -84,6 +84,7 @@ static int adv_swbutton_probe(struct platform_device *device)
>>   					     device);
>>   	if (ACPI_FAILURE(status)) {
>>   		dev_err(&device->dev, "Error installing notify handler\n");
>> +		device_init_wakeup(&device->dev, false);
>>   		return -EIO;
>>   	}
>>   
>> @@ -96,6 +97,7 @@ static void adv_swbutton_remove(struct platform_device *device)
>>   
>>   	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY,
>>   				   adv_swbutton_notify);
>> +	device_init_wakeup(&device->dev, false);
> 
> Is the non-symmetric order here intentional?
> 
> How about using devm_add_action_or_reset() instead?
>

Agreed, just sent a v2 patch using devm_add_action_or_reset(), so please 
take a look at it.

Best,
Joe
