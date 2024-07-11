Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7E16CD1A
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720711051; cv=none; b=ISVytKvaZnitk+Kxu1iOwFF9WpA6mWNVcXNtkQR2eWblYlul9IwdAz9QJ4F0TViZnTnMvFGaOBwi8PRO1Axk/3sm+L2cUoRey8x/Ss8tnrRTx41JfM1lkzMOododq9MO19JRQ3megf3PZAyk7/YFwxYYxrtZ6mXCZaumpz9dXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720711051; c=relaxed/simple;
	bh=EpZgJ8CQ9N0rfJxBFPo4GhnNPAEKGpuPfx2yb0F94CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Up63LWxmV1/vcqOpX7wmdUH9fN+Jp1CM6+MbTg4+EVanoAoPvaPFvpQoM4ld5FAsWg7exrhEWdCzVvhyKHgwSNDCXpwjLxsdseehYqDHewMpW2ItvaOam0NzSiMbsLQA8ft8CL4GE6ix2PmbH6jy0sjkYJMuYRpuCT5Ams/Okfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PNYuCZNm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNYuCZNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720711049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvcjybqPHzlQzi++pVLDJbA6O/40LXVR87iFWMUpfmE=;
	b=PNYuCZNmHodCiAPaY5rrEYOk0qSWvdbXK0VTbpY3Sr9v1B96D0DCwmURhbJf0qN2p3c+JL
	51L0bmIuB4+mmWo0mPeyArF22cJj8fDLfHn8B1vMBgwMO9hzX9mu40oIrqhZpWt1kCVt5N
	AKquRjDA9/mL58dQPIJ/sdkwa4elmSo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-bDl-qJaLNpSCN35xCvJ8ng-1; Thu, 11 Jul 2024 11:17:27 -0400
X-MC-Unique: bDl-qJaLNpSCN35xCvJ8ng-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-58c7800d03eso668945a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 08:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720711046; x=1721315846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvcjybqPHzlQzi++pVLDJbA6O/40LXVR87iFWMUpfmE=;
        b=MrwA0pOn94QGEYj73L8t+V6VJAQjQxRrCtzBCozwIJH1QsM7FOa1+ErHIZW9w7CAyA
         9S4qCrC6O5HJYqYauW7IB8F425XchzEg0WFMzj1bIJXidmAhceu9cqByNHIZgxcg98b0
         DemgVw2jS1D1jFjqp5icZZdxsznXvxXyasDwdKLaaW23gF7GFKPJyCHdvo5h9hyVF4NU
         D8XbLR8Kj1dOocwqEuA31T0vTR1Ugi6rwI5dg8Js/mt2lUfQIMaHaSLQwVhzRSs9ti7G
         Qv2e+zW8gXlaV++1RJigjsKrK2VHKByyF3wfXIrwmZwAQzh/IXJIE5qXZPfb+z/DG0YP
         g4dg==
X-Gm-Message-State: AOJu0YxcvVRtT0ENb45kgwfOrAira3Yl8zV1cBc7pD7mlqnFOtkfCwBz
	frBiFUGGn/G0rvZLaYAcYSYBWT0isVeg6QIWKtdk0kPqOxDmZ/OrnfBi+vA72bHMG98FN0/u8WY
	DMbPpU/IB5/76wUIq90IQKTCOSzxG8+Lw6zfoLWGI1nlEoId/g+7PLXNwX/nHgAeDkntGNkA=
X-Received: by 2002:a05:6402:354e:b0:57d:1696:fd14 with SMTP id 4fb4d7f45d1cf-594bab80ab5mr9064475a12.8.1720711046530;
        Thu, 11 Jul 2024 08:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWaholCedjUASVrq0V/4fdSiV4EtfSitNCOr5n41JWw+r2jeZ9UnIusYhu48h6RTYBsgNwlw==
X-Received: by 2002:a05:6402:354e:b0:57d:1696:fd14 with SMTP id 4fb4d7f45d1cf-594bab80ab5mr9064448a12.8.1720711046100;
        Thu, 11 Jul 2024 08:17:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd45a1absm3585530a12.77.2024.07.11.08.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 08:17:24 -0700 (PDT)
Message-ID: <bb74a97e-3f25-4d56-9733-46e5325c47e7@redhat.com>
Date: Thu, 11 Jul 2024 17:17:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] HP: wmi: added support for 4 zone keyboard rgb
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240707175613.27529-1-carlosmiguelferreira.2003@gmail.com>
 <20240707175613.27529-2-carlosmiguelferreira.2003@gmail.com>
 <71874c5e-b6d0-d05c-3b07-d1add491dbb6@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <71874c5e-b6d0-d05c-3b07-d1add491dbb6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for reviewing this.

On 7/11/24 10:41 AM, Ilpo Järvinen wrote:
> On Sun, 7 Jul 2024, Carlos Ferreira wrote:
> 
>> This driver adds supports for 4 zone keyboard rgb on omen laptops
>> and maps the wmi backlight toggle event to KEY_KBDILLUMTOGGLE.
>> For the backlight, it uses the multicolor led api.
>>
>> Tested on the HP Omen 15-en1001np.
>>
>> Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
>> ---
>> Changes in v3:
>>  - Moved to the multicolor led api
>>  - Mapped the wmi backlight toggle event to KEY_KBDILLUMTOGGLE
>>  - Some other minor changes
>> Changes in v2:
>>  - Rearranged code to remove forward declarations
>>  - Changed from sprintf() to sysfs_emit()
>>  - Fixed some identation and coding style problems
>>  - Switched from manual bit manipulation to GENMASK(x, y) + FIELD_PREP(XX, )
>>  - #define'ed magic constants
>> ---
>>  drivers/platform/x86/hp/hp-wmi.c | 248 +++++++++++++++++++++++++++++--
>>  1 file changed, 239 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>> index 5fa553023842..5eae47961f76 100644
>> --- a/drivers/platform/x86/hp/hp-wmi.c
>> +++ b/drivers/platform/x86/hp/hp-wmi.c
>> @@ -14,6 +14,8 @@
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>>  #include <linux/kernel.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/leds.h>
>>  #include <linux/module.h>
>>  #include <linux/init.h>
>>  #include <linux/slab.h>
>> @@ -24,6 +26,7 @@
>>  #include <linux/platform_profile.h>
>>  #include <linux/hwmon.h>
>>  #include <linux/acpi.h>
>> +#include <linux/bits.h>
> 
> You need to add #include <linux/bitfield.h> as LKP found out. The 
> MODULE_DESCRIPTION() ones you can ignore as LKP unfortunately spams some 
> kernel-wide problems to all patches even if they're entirely unrelated
> to the patch in question.

Actually the LKP / kernel test robot email with the MODULE_DESCRIPTION()
warnings does contain useful, new errors. The problem though is that
the bot prefixes new (not seen on builds without this patch) messages
with '>>' making them show up as quoted (replied-to) text making the
actual new errors harder to spot :|   The 2 new actual errors in the
email with all the MODULE_DESCRIPTION warnings are:

ERROR: modpost: "devm_led_classdev_multicolor_unregister" [drivers/platform/x86/hp/hp-wmi.ko] undefined!
ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/platform/x86/hp/hp-wmi.ko] undefined!

I agree with all the other review remarks and I'll do my own review
soon.

Regards,

Hans


