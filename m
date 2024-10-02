Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35561CFEAD
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Oct 2024 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727872520; cv=none; b=ArxPIeqZJ91Ax9c39zJ6rQL6rpR3FmxMAKxXvQSYOipn42p6Sm/xp1zI3yuCb2oks3+uasppzz3TIcev+WuVz/xL+XEW8ilFR22ePn+6uyTzm1WmHqEtG/tAvpuwu9pmxOgXDqYys/NvaGPqpqD2sjA/Kf+II4uCtFpPMNu5smY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727872520; c=relaxed/simple;
	bh=/w0+6cd+hbeMW+ipGN774Tj4cMLGVHebRzaAYr+UC/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lc61/VR+PkV2kkPb+TohmeHDrew+jtFd/3Wd0xKuJnWC50hJYfgz1W4ZNAnhF9HcjYJwNtoNeyh88/3bD4ULffqbFcRAenb51Oktj+HGViaZIrI7uVieYCJb7TBttPjeIGgSWQONGCKBRrQuIVrrhHKpz/MEoN0klP0OfwzDuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCPRe8g/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCPRe8g/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727872517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSEsK0rh/QeUS/t8G2KMmdNRmVd+6fD0oOLOmeE69U0=;
	b=PCPRe8g/8m7H1zEsygKisZbTtjwdkVZOZlxzSR5KfT7YCyN+6vUNhtCINVCslswebJVF4N
	ymHG2JM5OhK3PgmT69vGjfvWlwKXFog2/DnKXDx3DeW2YG3fgh1ghHx9t/GN7ThE2eCbO/
	sz/reRXLrdbjYtOyag4PfRJmReAA34w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-VdywkPR7NA-XZvHOWOXErg-1; Wed, 02 Oct 2024 08:35:16 -0400
X-MC-Unique: VdywkPR7NA-XZvHOWOXErg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8d10954458so509879466b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Oct 2024 05:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727872515; x=1728477315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSEsK0rh/QeUS/t8G2KMmdNRmVd+6fD0oOLOmeE69U0=;
        b=lv+n5HreXyDSIcx55jaoLueEs4RWg754OekX6U/YQCsR0Gi0kFk4jlho8cUxmOZVUD
         J5E1N/ZUDKKOoXvypEACx6q0+tcd7cA7Qo83/jn6B9ZP4nsN7KxxZ+uqgATzulgMmucX
         UiGC530SFhvy5wSPtqH/T9gftbjbEjNirIrcCY9lbMYukrn9Q/nCvnMIWlcFtOJRgxCK
         j5lV3AepL3bk+/+s1Z4UfL+9JrIUeVEozCA3WW4dxpBOikBwLFxNriJqjZN5KKUYzsTr
         ZYEKvQBZV5rIKn0pj9L05Qjyp1yfw5y2NlWkHtsqhBu7QAH7nQYK00Cz0lHwA6V1aIHY
         Ylpw==
X-Forwarded-Encrypted: i=1; AJvYcCX4V2mCIqp4p1tDESSu9TsAE3QlDnbXxIc0b6Zh71UUvt2ouh9oRPXQPVMbcKCpwPHg/w4s32X/xwZstTDkoUoKG8gj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2cnMIAoQqZCcWgULHp0uagiIRtcxKXghQGO0+zLhSBruj3MiD
	hjtrguR2c7Zr3k8iQKMkNg46szvmh05hLQ7mg0IoWv5S/PVpRPdPha87hRy4slg0SS62ag0E5dd
	0mLLsuC8RGaWLlehes/ybBLNRyu0TBWb5qs3fGfY70HFzbE0UOqfdC8iXZEdJB+O92gEguOQ=
X-Received: by 2002:a17:907:1ca0:b0:a8d:35cf:85f6 with SMTP id a640c23a62f3a-a98f838bdf4mr271741466b.57.1727872515327;
        Wed, 02 Oct 2024 05:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAcDBl8oud/YVHjO5L2jwtH7Aoi6ik2xgh7z9rYEDo73FiEesYboUK8tdayUNjiZIFRJpwow==
X-Received: by 2002:a17:907:1ca0:b0:a8d:35cf:85f6 with SMTP id a640c23a62f3a-a98f838bdf4mr271738166b.57.1727872514888;
        Wed, 02 Oct 2024 05:35:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27da39bsm859892066b.90.2024.10.02.05.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 05:35:13 -0700 (PDT)
Message-ID: <ab75a39e-94e2-4b1a-9406-e05ebc816b03@redhat.com>
Date: Wed, 2 Oct 2024 14:35:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] ACPI: battery: Fix possible crash when
 unregistering a battery hook
To: "Rafael J. Wysocki" <rafael@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, dilinger@queued.net, lenb@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241001212835.341788-1-W_Armin@gmx.de>
 <20241001212835.341788-3-W_Armin@gmx.de>
 <CAJZ5v0gSYp5Umo-wsKvQ2Nff7YZ=_3-4bzG3TnKqMpHvxCmR5g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gSYp5Umo-wsKvQ2Nff7YZ=_3-4bzG3TnKqMpHvxCmR5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Oct-24 2:08 PM, Rafael J. Wysocki wrote:
> On Tue, Oct 1, 2024 at 11:28 PM Armin Wolf <W_Armin@gmx.de> wrote:
>>
>> When a battery hook returns an error when adding a new battery, then
>> the battery hook is automatically unregistered.
>> However the battery hook provider cannot know that, so it will later
>> call battery_hook_unregister() on the already unregistered battery
>> hook, resulting in a crash.
>>
>> Fix this by using the list head to mark already unregistered battery
>> hooks as already being unregistered so that they can be ignored by
>> battery_hook_unregister().
>>
>> Fixes: fa93854f7a7e ("battery: Add the battery hooking API")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Hans, are you going to take this series or should I apply it?

AFAICT the patches don't really depend on each other, so my plan
was that you take patches 1-2 and I take patch 3 as a fix for
6.12-rc# .

Does that work for you ?

Regards,

Hans




> 
>> ---
>>  drivers/acpi/battery.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
>> index dda59ee5a11e..1c45ff6dbb83 100644
>> --- a/drivers/acpi/battery.c
>> +++ b/drivers/acpi/battery.c
>> @@ -715,7 +715,7 @@ static void battery_hook_unregister_unlocked(struct acpi_battery_hook *hook)
>>                 if (!hook->remove_battery(battery->bat, hook))
>>                         power_supply_changed(battery->bat);
>>         }
>> -       list_del(&hook->list);
>> +       list_del_init(&hook->list);
>>
>>         pr_info("extension unregistered: %s\n", hook->name);
>>  }
>> @@ -723,7 +723,14 @@ static void battery_hook_unregister_unlocked(struct acpi_battery_hook *hook)
>>  void battery_hook_unregister(struct acpi_battery_hook *hook)
>>  {
>>         mutex_lock(&hook_mutex);
>> -       battery_hook_unregister_unlocked(hook);
>> +       /*
>> +        * Ignore already unregistered battery hooks. This might happen
>> +        * if a battery hook was previously unloaded due to an error when
>> +        * adding a new battery.
>> +        */
>> +       if (!list_empty(&hook->list))
>> +               battery_hook_unregister_unlocked(hook);
>> +
>>         mutex_unlock(&hook_mutex);
>>  }
>>  EXPORT_SYMBOL_GPL(battery_hook_unregister);
>> @@ -733,7 +740,6 @@ void battery_hook_register(struct acpi_battery_hook *hook)
>>         struct acpi_battery *battery;
>>
>>         mutex_lock(&hook_mutex);
>> -       INIT_LIST_HEAD(&hook->list);
>>         list_add(&hook->list, &battery_hook_list);
>>         /*
>>          * Now that the driver is registered, we need
>> --
>> 2.39.5
>>
> 

