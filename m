Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0C146A90
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254782; cv=none; b=TkU1SrV/1qKAAlY/EERU8yPSGXX6SDE41w8qoFWztTdIE4L3ckVCp5LDEsVOcdE3f8oSVR3vCgv5SrDfSmC6u4cxYcsMTJZGYBWTqvNfK3RsSq7UyGgj/f0Xe4C8efURAy99BHnG4hl7l48YYsT9zOzWEYoRnEqxdbAY7ZI0rIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254782; c=relaxed/simple;
	bh=pxujeUWOaC4/0iuTUGZmJPfTABOMi9367zVsLIgK5MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD0RiP9OXlESIFjNoll5mpeQOMqoDa8lNx18JRrn8akO5FTqq2ov2bHHD5NYW6qaDdPMhnzo7uYWXlQxhI6nFmpSll/PS+buL0cl3L1D6JK8bFv94xbFgYw+1ekihqY3hRobasu/x4fjQcDLZQTDYDJhIREC/y6NBXl0HZIAGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5wCj7Kv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5wCj7Kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722254779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNbccAVS1eUQeedHP76RKEIK/f3aKXQgMGxtoQxRCZM=;
	b=Q5wCj7Kv0XrlTIOWG171HkipSVuj8QmL3yI38V1oUd04n57PxP80cMxhQFBLYWzczL+7fX
	eXx4vyaVbe+sgUUXlTLxAMgOrqRzXF24/pRY/icIuLGOZ3B9rrEDqd+HpfgUTXo0+vkFxP
	FJWGUmbC9Bk68ZjthY77Ju0ocwS2sQY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-2p54aWVRMlm5Oxm97ShKpQ-1; Mon, 29 Jul 2024 08:06:18 -0400
X-MC-Unique: 2p54aWVRMlm5Oxm97ShKpQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42817b91d91so18200725e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 05:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254777; x=1722859577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNbccAVS1eUQeedHP76RKEIK/f3aKXQgMGxtoQxRCZM=;
        b=Bmb3sl7y6w6rdBciANGrt1NyAeqQ5BeRt2ksMFECD7L1UZNKlnBgnPtmLITBvpljZ8
         eMttQjOBTCPMhUqLsB0aqtGkDGx97y5UpmyLU8upqqjUDZU18XcU35Uj56/qg8lZxM9H
         Xr+Krcn+frrgHvq/yeptWac5y6AbRuE/cv5FHKvYShdgHYM1aEENcUvDD0FgkVohU/MQ
         GcgjrpuRkCrqZtN9+2zLdb3I1gOiomykhM5Yfq6IMoRjG9o+SGHmVW28i9zav7PBAoNG
         fuX6kfoqsbg+FogFQVyQ2DoJr73S2FahhQBl/rOz5e4+CLy8RjIT1720YJHkEt97mHa5
         ZBPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvvcG08tnnYK3HXKFITf7D/4UBgstjg+HTAOUF7qxeZC/guisCTlPSQcspYxhwlxcFVJlv943C2sct31CpWZdIdtk5sIxRC4NGE4c8DTw5kEO/ZA==
X-Gm-Message-State: AOJu0YzddDs9JnmqWMDTwkjiLZmn7FgVaZT2nEiUmstK1goh9coj5jAv
	tM48H69Ifcnn60MaxsuTmmw6zRZKOMd62F7+tZluLbc3mpXVxhnynWjOeok32zKtB9wQEV9XKjX
	6NPFfg1TYWtunBtYSCKIobuH+4hmRJt9YUYI02hRMzPnCI5OItRohxb6SmSHKDzWczc8uXBqQpo
	ZJGXc=
X-Received: by 2002:a7b:ce0b:0:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-42811e0b654mr67147515e9.34.1722254776877;
        Mon, 29 Jul 2024 05:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIJc+atmXp7DWj7ELWBIzsjqGh6jnZI6zs1kC/U2/2kFj89p6Y4jql8aWnviR9YKVQGqpvkw==
X-Received: by 2002:a7b:ce0b:0:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-42811e0b654mr67147255e9.34.1722254776336;
        Mon, 29 Jul 2024 05:06:16 -0700 (PDT)
Received: from [172.18.228.53] (ip-185-104-138-47.ptr.icomera.net. [185.104.138.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428183de078sm62787875e9.38.2024.07.29.05.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 05:06:15 -0700 (PDT)
Message-ID: <4d292401-bb15-4c7a-953b-a55872c5c9c6@redhat.com>
Date: Mon, 29 Jul 2024 14:06:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-vbtn: Protect ACPI notify handler
 against recursion
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 En-Wei Wu <en-wei.wu@canonical.com>, Kostadin Stoilov <kmstoilov@gmail.com>
References: <20240729110030.8016-1-hdegoede@redhat.com>
 <823cf3b0-5051-d0af-29d5-ebc83d37ccdd@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <823cf3b0-5051-d0af-29d5-ebc83d37ccdd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 7/29/24 1:12 PM, Ilpo Järvinen wrote:
> On Mon, 29 Jul 2024, Hans de Goede wrote:
> 
>> Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on
>> all CPUs") ACPI notify handlers like the intel-vbtn notify_handler() may
>> run on multiple CPU cores racing with themselves.
>>
>> This race gets hit on Dell Venue 7140 tablets when undocking from
>> the keyboard, causing the handler to try and register priv->switches_dev
>> twice, as can be seen from the dev_info() message getting logged twice:
>>
>> [ 83.861800] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
>> [ 83.861858] input: Intel Virtual Switches as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17
>> [ 83.861865] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
>>
>> After which things go seriously wrong:
>> [ 83.861872] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17'
>> ...
>> [ 83.861967] kobject: kobject_add_internal failed for input17 with -EEXIST, don't try to register things with the same name in the same directory.
>> [ 83.877338] BUG: kernel NULL pointer dereference, address: 0000000000000018
>> ...
>>
>> Protect intel-vbtn notify_handler() from racing with itself with a mutex
>> to fix this.
>>
>> Fixes: e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on all CPUs")
>> Reported-by: En-Wei Wu <en-wei.wu@canonical.com>
>> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2073001
>> Tested-by: Kostadin Stoilov <kmstoilov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel/vbtn.c | 21 ++++++++++++++++-----
>>  1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
>> index 9b7ce03ba085..93deda7daac4 100644
>> --- a/drivers/platform/x86/intel/vbtn.c
>> +++ b/drivers/platform/x86/intel/vbtn.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/input/sparse-keymap.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/suspend.h>
>>  #include "../dual_accel_detect.h"
>> @@ -66,6 +67,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
>>  };
>>  
>>  struct intel_vbtn_priv {
>> +	struct mutex mutex; /* Avoid notify_handler() racing with itself */
>>  	struct input_dev *buttons_dev;
>>  	struct input_dev *switches_dev;
>>  	bool dual_accel;
>> @@ -155,30 +157,32 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>>  	bool autorelease;
>>  	int ret;
>>  
>> +	mutex_lock(&priv->mutex);
>> +
>>  	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
>>  		if (!priv->has_buttons) {
>>  			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
>>  				 event);
>> -			return;
>> +			goto out_unlock;
>>  		}
>>  		input_dev = priv->buttons_dev;
>>  	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
>>  		if (!priv->has_switches) {
>>  			/* See dual_accel_detect.h for more info */
>>  			if (priv->dual_accel)
>> -				return;
>> +				goto out_unlock;
>>  
>>  			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
>>  			ret = input_register_device(priv->switches_dev);
>>  			if (ret)
>> -				return;
>> +				goto out_unlock;
>>  
>>  			priv->has_switches = true;
>>  		}
>>  		input_dev = priv->switches_dev;
>>  	} else {
>>  		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
>> -		return;
>> +		goto out_unlock;
>>  	}
>>  
>>  	if (priv->wakeup_mode) {
>> @@ -189,7 +193,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>>  		 * mirroring how the drivers/acpi/button.c code skips this too.
>>  		 */
>>  		if (ke->type == KE_KEY)
>> -			return;
>> +			goto out_unlock;
>>  	}
>>  
>>  	/*
>> @@ -200,6 +204,9 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>>  	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>>  
>>  	sparse_keymap_report_event(input_dev, event, val, autorelease);
>> +
>> +out_unlock:
>> +	mutex_unlock(&priv->mutex);
> 
> Please use guard() and keep the return statements as is + add cleanup.h 
> include if not yet there.

Good point, I've just send a v2 switching to guard(mutex)().

Regards,

Hans


> 

