Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B6A37B40B
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776966399; cv=none; b=ttnl+ABf9sHJNfxUrbxU5AukpbWawuoSi+QiK3O2SWxasFp3N6e31/Z9YBy4JQT87BQi7Du0f3l5syUV9sqBSblr9fyAvjOZ8BVwVw0wjYnLBLIynqAf9HhVMk0+qqQPJGzJcFPRRJxaWxw6jPYgoLTzqSetxvJopwNHXkFVNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776966399; c=relaxed/simple;
	bh=Q/08wWQ4SfuMhfDVP9sXEtWA2o3HnwK33N7dXefJmWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3Kczjqkh2mEaEaMlrNqLom12V1hO7EjWU3HWKFZEvVdHzBsRW0cquNemPRAxtkJmrImCQPLEkZz0Mm1lmZg9wmHBslNM0xv6e5a/WnCsNLH3f/ZKko6aH3r9Cf9Y5+LeoXQOYd36MsSPiFM8Vg7vmn+4XRaxZVZAUpE1dErj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgxG5Rf0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgxG5Rf0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso31192915e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776966396; x=1777571196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKO0ZSfKpXY8aQTH5b7X8YGTTyGiXXEYMnXwkBPcBbk=;
        b=TgxG5Rf0D6+XEDnDW9xBvzpnyRDZDrymF543ek4kkzR+gYRk8/nffD/by7kRisi3D2
         q71qvkSVSdP2YG71S1mxZg3tKApvpAA4piUNIKDddPY/9hAbspQ3m6OjYu96sto8HlKx
         ucKLoK5148Y3oRXEjOBSpGKxlj11ApiqLapCdSPpMLp2PnVRuIdzvuyEgYn4Uq7Gg7MM
         WcGWWpU2dSAwB7UW1bAEFVw4RT1XafzBUa8k1/AswBlzt+l20RrLClMnUyjoor93ZVqY
         L618uq6XvNkDcvNIce5c+d9AOoDy1gDZCrRrElOtWC6W0VUu1QoxNcRjicwp864/ae0T
         zZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776966396; x=1777571196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKO0ZSfKpXY8aQTH5b7X8YGTTyGiXXEYMnXwkBPcBbk=;
        b=cIHptsLYO9opmeWPCbGETN161fL3f9B5OMOh3tXK7gIe1o/vTegtYsHz2algQ+jAgS
         WNpgBeLqK1+eHRW/tmavkN/wqSLkSexVcM+8q5fQSBPqAQc5yz2J4zT8mXmqiJz37C78
         ZsXPWjf0H8ntNNmxsc7jo/tZpBotkNCDtX+bXshwjU6n79VORv+6nDkTLsFxkvnI3MH0
         XJzEPtwGw746vsVzN8GPRTz5J72ADfD1akbIlLIKJJV/hv6mZjR/RC5Pu+hEa5hHXMl2
         4mvLGrmjTl0LdXMMe6Q6N/4tmGCuKP4Gi3tq4z89+YfjBdH1Kyrwlh+lIi5dYJNfT+Wp
         u3sg==
X-Forwarded-Encrypted: i=1; AFNElJ9oenec8AQYck6hDwcxZ4UjxLZrmZZsZ2aLzLVICBY1Cj4dgrPBIUKyjpX5ETneFeqC5wnRNXH7uwIOTajZCap68iMQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzA89e0QaeHJ7d+yC810WVejXz+rxGTeVBZRK8TlQpmGQyj9BYv
	ue/xcAI8VJXX9DwfBxIgu7yh88YCpXLEAEIdQCa6q0XYL552rfXUwEVz
X-Gm-Gg: AeBDieu47Smoro8Lt+rkYD7XTE0ekOffCeQ0HmRvMyfzg4oLY5GWxR/ieZPD0X6H+H9
	+WY3nfCo4TU5DlSBpuTRziYbuxV1UrqZjBj+UBL4K74JFOLiIlQR4M50y9oIuC8WQqlfn+9r9Bh
	PDyBLp16DXLZ0xUbp5cMuyCP/qM0QeFy3klf1jl4IIrfxDGPnl3Ap7PP3QiPPCbPL77E23VHU/G
	G4lXtTFuj7LNtJ28L26xotPfjUOlhbp1qcJr0rL5RdED4GGKMkD6OsFQNx9+MvOLdr8FJHfvd+A
	Gh0owH/S8uEVpTAkfXvX1f3BZfFU4HDK6ruT/QN9Kvq93IZv7nFRDxVi41xArPXgWAlRBPeB4qu
	Oph2cJ61HpBgdXh9iERuVuqkt6AgE2UU/NxpoYxYY7fL+QQlf+aKHdIKGCkE6Jz62hnoHN0jYue
	BiFVtnZDupL6mnH170pM1DQGyHVl4zbIl0+AsIh2VWd3U9guU4LwPG5XYqj0Rl4ERBNeb4xnpn2
	V9/PeM=
X-Received: by 2002:a05:600c:6085:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488fb782618mr367619265e9.21.1776966395897;
        Thu, 23 Apr 2026 10:46:35 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:3c42:f121:865e:1066? ([2a01:e11:202b:40:3c42:f121:865e:1066])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm916283675e9.3.2026.04.23.10.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 10:46:34 -0700 (PDT)
Message-ID: <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
Date: Thu, 23 Apr 2026 19:46:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mario Limonciello <superm1@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/23/26 07:15, Mario Limonciello wrote:
> On 4/22/26 23:42, Mika Westerberg wrote:
>> Hi,
>>
>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>> Assuming all the variants suffer the same problem would it be ok 
>>>>> to use a
>>>>> wildcard for it?
>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>
>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c 
>>>> b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> index a0116f004975..e3a6111854e8 100644
>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id 
>>>> gpiolib_acpi_quirks[] __initconst = {
>>>>                .ignore_wake = "VEN_0488:00@355",
>>>>            },
>>>>        },
>>>> +    {
>>>> +        /*
>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>> +         * interrupts involved.
>>>> +         *
>>>> +         * Found in BIOS G614PP.307.
>>>> +         */
>>>> +        .matches = {
>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>> +        },
>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>> +        },
>>>> +    },
>>>>        {} /* Terminating entry */
>>>>    };
>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>> remain as much as possible close to the CachyOS' one but hopefully 
>>> it will
>>> be implemented on 7.1, if someone propose the patch and it is 
>>> accepted. It
>>> would be amazing to see Asus more interested on Linux and more 
>>> strict with
>>> their BIOS but in the end I understand it's like asking for the moon.
>>
>> Okay thanks for checking. I guess this is what we have to live with 
>> for now
>> until someone finds a better way of dealing with these.
>>
>> @Francesco, would you like to submit a new version of the patch 
>> similar to
>> above or you want me to do that?
>
> Hans suggested that we might want to look at ripping out this edge 
> triggered events at boot earlier in the thread.
>
> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb 
>
>
> Hans - as you pointed out that the Surface lid state is the only real 
> issue left and you happen to have one do you think you could work up 
> some patches?
>
I see. Well, that makes totally sense
