Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF14439336
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676162; cv=none; b=bXed0C4PFco5pgl7p0KA16OrghPEp8+fdD8qFTXakKCjvjVpfi7TVzdAWF2ygFgza4Xz2Pk1yN63cryuDZ8ybitfZ4qcJ8GXHojgHXRqhqgIqPbyK1Iwq43oTKzHb5RQNFgbsadfrGf+YQn9gTKHQhq4CLcr7uWZcCyLqrPF68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676162; c=relaxed/simple;
	bh=QYpxUU9b0mpz+k23Ko+GxcX3nWGQhGbT1UxhOLy1VdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATRtUBUy0ta9LvTJv0Zq9/pG91CUOmuxCcmh+hEXsSZaUOUFrQUQrMt2XdP1/UAr3C1ThIaOm5qg30d4xkZ7ip5VN92xarX/qJqj4zpkzs51161+0SIOtE8/plR7z/EUG/P3KmAiYQbKWezGVemRdWz8DrlsRu3lzvM8eZNa3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJNg66UT; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJNg66UT"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso2942824e0c.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676160; x=1785280960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxmnV5EYMgRiguaN7PhOdxhulBwnM9DxidYXYq4D6wM=;
        b=mJNg66UTB/0KGCBhVVAwGHfEqOnLh/sWUecRpBxgo49ZHx2b9qHNeqc8fL4Ang4gCU
         dxS/SKXqWE7fcwPBVIuFfDCbMILsdQVVAFprFS5YltEwXnvuc9lHwBuupYT8miJzFymF
         Dr9UbQOJndyfK7zxUzhjAQB6UDoM03gPykAGhUbPRT+AOeIP6TEI45c70rM5jy5wucGN
         w0oZgtXOHVr6KHIM6xzq7+d3lLpUAEwanYfDbOIT7U14MBJpl/P/9G8erRl08RvCQO8z
         RCewf9+A75tPSO15uJtaAx0R1JeWa4iEcUcDmPdhMDVEhqitFVC+HxtG6ttnpBgZToJO
         02/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676160; x=1785280960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxmnV5EYMgRiguaN7PhOdxhulBwnM9DxidYXYq4D6wM=;
        b=JSLy7rmEj9VvarXYFG8qVfGvOhVo8ucvWcrsBMtxDhI7gAE8MI9Oifyt3kpxYT769m
         zj/evCjuYp5FFlj0YGVCRwF/I+7FT1Ein0NvArs+/sGmsP+NhmLg+O8ofF5ksuCyO8y+
         vCZL3kYsqXM0nc81971p/Sl63adWTSUwEON0q2diUkt64m/wbw3dF7XS4x4OWGQkw4JB
         KoknRBNHC0GM6rccZIu71iN7GvnlqI9XuPPZwcoa2k50y25TP/VARjgvG0Ud74doe1GB
         FS0JXrnNgOWPx2n6520ZVzfkEblJwi1GmhnTUKPhUS1BfG+8xYuJXNuj26ZZz4bE5LCy
         bl+A==
X-Gm-Message-State: AOJu0Yzm05e7V23VG7UoX9MIKxXn4c+AXqMLHxPPRDBOhIZNw+ipa9ox
	D1QaMeuPm6RdH94r2UkRcgZDNBP/7XA2DOxIlRDnKHUFGpSHiUQJTFd3
X-Gm-Gg: AR+sD13io1ljCPwr1SKWPgGCUIpzyu66+/gDdbvYxBy1lzmJQFeTYS5Sl8V8zxYaHM9
	km0jqRC8tw9sDA+QSvjX9qchHxx9P+VPE8AnN7Wk/s+6UNbLTPFEWkT7QtsFGY8ebXuiiXDF9F1
	WggEkKoFr1cSPPyyQk3c+0DORm61I96aN9ZsX0ciuTdc6JXQk8mPtLbUpAfev8YVTlEydxrgbps
	+ksGYTxtjsLBxaEL3vSbT66Yfq6Pkr/JhVPUuSe49oltwvbiz5KZvv1h+5i7U1Qb5K1i9Oblrq8
	Th1FJIIqZzyCMUNg5NjJq3jMqzuKMWZQT6Xw/QmBAAK1s9iq9m1UI1NJbLRnaT1htsMyGbVdaRJ
	P3M+JMWzMDqGGquqSf85W1726zH0HgeqeCSxW2NQ313bPVy/qj+r53BjjELuzprFd4gfr8kKP72
	ZN8Brw8bPASTM45jezgCcYcU5kDiKw6kZmerJN/d4//L1iA3+mHg==
X-Received: by 2002:a05:6122:d0e:b0:5bb:aae2:1754 with SMTP id 71dfb90a1353d-5c1bf8f630amr5782093e0c.13.1784676159967;
        Tue, 21 Jul 2026 16:22:39 -0700 (PDT)
Received: from [192.168.60.4] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6275db6sm1141816e0c.3.2026.07.21.16.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 16:22:39 -0700 (PDT)
Message-ID: <84b521b8-112b-4fed-ab82-e1e16d770e66@gmail.com>
Date: Wed, 22 Jul 2026 07:22:32 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
 <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/07/20 10:41 PM, Guenter Roeck wrote:
> On 7/20/26 06:46, Ilpo Järvinen wrote:
>> On Sun, 19 Jul 2026, Alex Yeo wrote:
> 
> ...
> 
>>> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/ 
>>> platform/x86/panasonic-laptop.c
>>> index b83113c26f88..2d67188de2a9 100644
>>> --- a/drivers/platform/x86/panasonic-laptop.c
>>> +++ b/drivers/platform/x86/panasonic-laptop.c
>>> @@ -119,6 +119,9 @@
>>>    *        - v0.1  start from toshiba_acpi driver written by John 
>>> Belmonte
>>>    */
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/printk.h>
>>>   #include <linux/acpi.h>
>>>   #include <linux/backlight.h>
>>>   #include <linux/bits.h>
>>> @@ -136,6 +139,14 @@
>>>   #include <linux/types.h>
>>>   #include <linux/uaccess.h>
>>>   #include <acpi/video.h>
>>> +#include <linux/sysfs.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
> 
> FWIW, I don't see why this is needed. 
> 

If you mean linux/hwmon-sysfs.h, I agree.
I will remove that in v8.

For the other includes:

 >>> +#include <linux/sysfs.h>
this was previously missing

 >>> +#include <linux/hwmon.h>
used this for registering the fan as a PWM fan on hwmon.

> 
>>>   struct pcc_acpi {
> ...
>>> +    /*
>>> +     * This mutex ensures that the hwmon and thermal functions
>>> +     * for fan operations do not conflict as the PWM fan is
>>> +     * exposed to both.
>>> +     */
>>> +    struct mutex            pwm_fan_lock;
> 
> Maybe ask why this additional lock is used instead of relying on
> (for hwmon attributes) and using (for thermal) the hwmon subsystem
> lock.
> 

Both the hwmon and thermal devices share the same control path
(pcc_pwm_fan_speed_read and pcc_pwm_fan_speed_set). To prevent them from
executing concurrently and interleaving, I added pwm_fan_lock to 
serialize access.

Reading and writing fan speed requires a multi-step ACPI transaction 
(e.g., checking/setting manual mode first before accessing or setting 
fan speed). This is because I rely on querying ACPI for the current 
state instead of keeping state cached in the driver. Because of this, 
the mutex is placed in the outer hwmon and thermal callbacks rather than 
inside the low-level ACPI helper functions.

If there's a more appropriate way to synchronize this across both 
interfaces (e.g. use hwmon_lock in place of a driver level mutex), I'd 
be interested to hear it.

Thanks
