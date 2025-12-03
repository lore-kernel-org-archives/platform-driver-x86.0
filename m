Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7F72E3B07
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757140; cv=none; b=RJH5CzUPgIOOnJpioxd+Gd1X56rJPXvEu1aKGaHwRs05QSp/+DhXimOWr2ddn17VKEKBzth7SoLVc+5sm5oqquA9UQjAUbKQEE+FYid0knR1Fh4rneHuRjdMsUxIEA33XCJEPYH8B/i8RZz1yNlHMDsQkFcA7W4SY/cf6qHOLCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757140; c=relaxed/simple;
	bh=mn6Me5cszWpyIDRgjrsb+w5xzO+oeHNnSMmAUORhfbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSxzFyObO1DOfBehLLuVfuyBCIISgLc0ajBGwH9z34sQ8w04V+V+YWBKDUHe4dTxlUdPL4DiiFx97IOjvpuVCiVIUDVkPJHrJBrsAOwvsE2clz18U8DcAxIJ8K5jHzUtYf3t6u3W7whEiEKDIFoRtBreIpkWnAzsxRMfJJ6t3e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaHaX7kB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaHaX7kB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e264528aso68743945ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Dec 2025 02:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764757138; x=1765361938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+lpkZ96SLXYvBL/jMuA66r6fzhm9f66vdhL3fP0Fk4=;
        b=BaHaX7kBXs+2+8LW68yljxswYUXcR7MNwPPOrVPfHG1c9bYZ7ydxuhSKIoKEoZQONA
         xxLGsBw0nLT0LRY7scCfQ88CBETQfOaePHDcFLVYby8IZazO0B5HEmBfI7oa8b+cP/0a
         6K4EjfMQilwdPBz7Ep5/RMAewStriEG2rct4BffPClDDN+3AmVPTgP3qo7ojvVd9j3wd
         8Rh+Y61sL4YSiiodqzKWkYSFmOjTBseyec48v5GLFX3PSxJizb76V1rZsNgq5XKjyIBm
         jUTZodfbuSwq7cNynpjo9yvzXmxCxvs7WKIP715bGToflC4Hvbg2NyDuYt53NqBiNaoG
         wIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764757138; x=1765361938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+lpkZ96SLXYvBL/jMuA66r6fzhm9f66vdhL3fP0Fk4=;
        b=dsWqER3vavPd5WTlLz0Aa2TnXUczqzBrmddc4glp7WLixzgRUUAYCgUgcXrEWy/Zjo
         Dh6GB5VqfdXO6iCwCF72qw8h10dsXJk3GdhR1/u7PzvZP7whnfYXV+lxW9RJOjXnZ0PH
         BK/sMLCd+X6UzOlvhgelaNHP9szbtNL8dG4NKVEcI4/0rCGrP/gErGTs70791ePjs1Sw
         vX69cgvvQWTkmcgiT1DdYp7nwe2KyVjECyGg97nqi5zg22kaWhR3o68sSWOTyhXVfYpu
         av1vKXipE3lkFdO0Cb0qdslMWUVgmalc8ozN6oeASgejw0wVLPp5htD3tHZwu58+/Anc
         IHDA==
X-Gm-Message-State: AOJu0YyJqFb78IS/i5uNFe9ZqIP840gReuESZJucJIzJjnZqItegTeiF
	AXTGDMoXCbt2zAOx1uS0VYPMzh9KRGBmJeM9wCjGernKBj3osxKVgnNp
X-Gm-Gg: ASbGnctIlQVKPpzhClXSTp+/DaWCws+/g3OR1h1HrSijKI+GXiztpeZymgN0RjSymh7
	FVicJQJ8sNxGLDh5Dy5JXuhd/jyn2R8xdDdvC8rPYRnvI33+3ZvJRphsFMGtahJD9IlfCm5cRva
	y6dqxmFrPTjoRqFaBz/RXp1OJSsT3/Y6xl28nRNfKbXM+AbdMwV/kUylTfhi1fEhFpEfAcmzOOK
	czlfC+RbAd6frZOEpi0sHzyTqQ4OrBFOCMg823TeZ1/mXuIEKyoOM5k0o2mLW/YXYtwY3IYZ3/T
	HWBA7Jce7Dk8fGkaTRbnP55ggdoUhOUmQrWMqK9TaFstdIOJC+8ZxvWYe6ejJkpgt4ae2bZ6E2d
	ajNO5pnlHofAJuvdN8f/uD2B5T/L+pYXbK623HF3Se8A3zVWfrGXesK7qsyARVTD0A+TCJA43mc
	YVCIBepEE7Sf1znFakVQHbDHZ2lGkjqWKsB/KpRNaOf4UuBlb0yHhuEr90RI5BvLLEBqE=
X-Google-Smtp-Source: AGHT+IGFtGp/W7MhnATeuv6ArbwvWS1pdfKGoa7HumtTqFw8h2SoQddvraq/EytOdnnD13P5wTxMAw==
X-Received: by 2002:a17:903:987:b0:298:33c9:eda1 with SMTP id d9443c01a7336-29d683f42f2mr17630875ad.43.1764757138231;
        Wed, 03 Dec 2025 02:18:58 -0800 (PST)
Received: from [10.131.179.186] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40ac4sm180936075ad.77.2025.12.03.02.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:18:57 -0800 (PST)
Message-ID: <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
Date: Wed, 3 Dec 2025 19:18:54 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans,

Thank you for reviewing this patch.

On 12/3/25 16:52, Hans de Goede wrote:
> Hi,
>
> Interesting new feature. A few small remarks on the proposed
> sysfs API below.
>
> On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
>> Thinkpads are adding the ability to detect and report hardware damage
>> status. Add new sysfs interface to identify the impacted component
>> with status.
>> Initial support is available for the USB-C replaceable connector.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>> ---
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>   2 files changed, 205 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 4ab0fef7d440..4a3220529489 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -54,6 +54,7 @@ detailed description):
>>   	- Setting keyboard language
>>   	- WWAN Antenna type
>>   	- Auxmac
>> +	- Hardware damage detection capability
>>   
>>   A compatibility table by model and feature is maintained on the web
>>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>   The exact semantics of the attributes may be found in
>>   Documentation/ABI/testing/sysfs-class-power.
>>   
>> +Hardware damage detection capability
>> +-----------------
>> +
>> +sysfs attributes: hwdd_status
>> +
>> +Thinkpads are adding the ability to detect and report hardware damage.
>> +Add new sysfs interface to identify the impacted component.
>> +Initial support is available for the USB-C replaceable connector.
>> +
>> +The available commands are::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>> +
>> +This value displays device type and location of device with damage status.
>> +For example:
>> +if no damage is detected:
>> +  No damage detected
>> +if damage detected:
>> +  Damage detected:
>> +  Device: TYPE-C
>> +  Location: Base, Right side, Center port
>> +
>> +The property is read-only. If feature is not supported then sysfs
>> +class is not created.
> Nitpick: s/class/attribute/ classes are standardized sysfs
> interfaces living under /sys/class/ which this is not.
Ack, I will modify it.
>
> Besides the nitpick I'm wondering if we do not want to make
> this a little bit more friendly / easy for software to parse ?
>
> ATM this seems focused on a human directly reading
> the output but what if we want some sort of automation,
> like e.g. a Linux version of the Lenovo Vantage sw parsing
> this in the future?
>
> Note I've no specific suggestions for how to make this
> easier to parse, this is just an observation.

Thank you for pointing this out.  I am open for suggestions and will 
re-check regarding its use case in lenovo vantage in future.

>
> Regards,
>
> Hans
>
>
