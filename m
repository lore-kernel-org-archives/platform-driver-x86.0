Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C4431A57
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558511; cv=none; b=rhBTZOXHxK6UT60c5ktkNY6JpfYGpKYAhOg5uLFc5a5QrPfOmrYWaSDRx9934NG820fvGIzIusD42ikDl//lPjJ+mIah6L3eCuDaNVyZ9+2Wq2yr7gLXoqH2MOU0lSuqfdBDgPXqSnyr6K9mtHmG8kF/lwzQ6wLW4M7Q16Q5ULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558511; c=relaxed/simple;
	bh=7PZbMe7/8P6mBjbl8fZa2hfgo0oWBnuR20DcxmfYwR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0mCjsujKiQGw3YmyjQtYB6ECxR1cwc+NcLWvG/209jkRru7mz5SU3YBQcMDoSuhTlZxpYwZkPPQPawR9BRGAh2QaQ8H/DGZ+4PdAc3bl+kxE1VCnkApapvhOasoEp7NSP7J9CXI3dG2WYZbmyxByWeKBl/cfpPELrBFivxqIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKVdIqI7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKVdIqI7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad8076b01so122885615ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558506; x=1785163306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY6ci5Qy7tTGy2zsHzGFV9dNONphBOELiUVTTsGRCT8=;
        b=MKVdIqI7ikL0X6qKgI5bh0HIR7OGCSoEPHOlp0uK9lGNbfBFVFW0kmi2D7CoQnJPbH
         fPjOYZ81OGCs/ss6sSdFPLPGrf/csY3qAU2cSDQoN2l1W8R20dEEsxaxpjdBPgzChjRW
         qDExY8e4ycJeJT/lD0e/NbSZiSYWV/ey8d+tTpNUDk6QESK1iehpIf6gCINpujDxGRo2
         ipqm2VGidnPowk4yBCMaCuA0K9Fgvy+YJOr1sMZ60NNjxUsg6xKmmnOE5DNmmYk6NJq/
         0BaNzI0qKn/TdJr2U66HNqBcEtcI2wLVWZUlSAqEucnvIdm5W1k90qP8JLxSwI42I4Tt
         Tw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558506; x=1785163306;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tY6ci5Qy7tTGy2zsHzGFV9dNONphBOELiUVTTsGRCT8=;
        b=U+053GD1sUkW5KLlcV+YW5KjneWE9Wl6kfa5sNfmkPgWVdvf+Y7N50LxY4uFPGoAXH
         /kPEXVhjRpdCHT3DpYETSY7z3R93+nt9nGvLXKYjnM/L0kBW0rSj5jPGHX2PEgc3Iteb
         Wy22BVtuXVTgMiYRm7C4hHvpSwwXUkxoe0ImhnITNAgmvJegZUF3g4Qluh2jaSjnhPVl
         3xKB5Mn+egJxdFarY9PonXa1plW68rlEPrwKG9ldm/HzyH4cfLjuBu2zZYiqcNSZGDzy
         BZHVHmFCJlIrrvV97pkbb7RVtM0yDPivAXfPKyPZ/fsStBKRXuILRzYw32IVGHb3VcD7
         YMvg==
X-Gm-Message-State: AOJu0Yw2+JLwq1m41P2IfqBdJfWQRO7V1H5bBXdmboF6c8ak3MWX5GvV
	8HgamX9wDIIKYnPAoYiejjCStmcCwA5dUoMs6kthXNt7N4QLLgNZWH1m
X-Gm-Gg: AR+sD12tBwolqJfUHDHKkNkkFZczappHslr0EHFa9HTmBlud6BruGzbs9PrXCTYc8Ur
	9WLE1N7fe2X0Ctw7OxD/+or+QfcF97IqG2Cz56qb6rHq+SGHTlc8Tg/s8y7nVWlrpl8ZZwUep21
	jpUVGKjXm6JPgwpBMDDrBWaA9TE1Iq3mVfN92mDtMnYo2fmPBDoHORK/oKso+Rtqm4iqUzLczom
	9+yUgHIALS6n9XIedFjTpljkPDglqttcqre/AGTIZ/Hsd7WP3foffl+lirjfukJ38wfShzByvba
	ljoAmDphgucuoOnzOXokzmpIKhgOGVZpOFRIql8GvRwBDjYp/qOko+hKv4ph+Aiz/Hj7Lo7FTh+
	MjIqrhoYAmPlWVDvgSQ1mKA/gkU2mFyRoIfLlcI9ayEncMIvRcjKCSKFndw0uWWkhrG6WnNjC9+
	ivx6BNptNkzUG+46hmz3xptasLI0jW1g6OC4T2lQSYiA3rPrVU2rw=
X-Received: by 2002:a17:903:360c:b0:2ce:b096:e50b with SMTP id d9443c01a7336-2cf349fe60dmr142784935ad.47.1784558506277;
        Mon, 20 Jul 2026 07:41:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm42351107eec.20.2026.07.20.07.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:41:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
Date: Mon, 20 Jul 2026 07:41:44 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alex Yeo <alexyeo362@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/20/26 06:46, Ilpo Järvinen wrote:
> On Sun, 19 Jul 2026, Alex Yeo wrote:

...

>> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
>> index b83113c26f88..2d67188de2a9 100644
>> --- a/drivers/platform/x86/panasonic-laptop.c
>> +++ b/drivers/platform/x86/panasonic-laptop.c
>> @@ -119,6 +119,9 @@
>>    *		- v0.1  start from toshiba_acpi driver written by John Belmonte
>>    */
>>   
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/printk.h>
>>   #include <linux/acpi.h>
>>   #include <linux/backlight.h>
>>   #include <linux/bits.h>
>> @@ -136,6 +139,14 @@
>>   #include <linux/types.h>
>>   #include <linux/uaccess.h>
>>   #include <acpi/video.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>

FWIW, I don't see why this is needed.

...

>>   
>>   struct pcc_acpi {
...
>> +	/*
>> +	 * This mutex ensures that the hwmon and thermal functions
>> +	 * for fan operations do not conflict as the PWM fan is
>> +	 * exposed to both.
>> +	 */
>> +	struct mutex			pwm_fan_lock;

Maybe ask why this additional lock is used instead of relying on
(for hwmon attributes) and using (for thermal) the hwmon subsystem
lock.

Guenter

