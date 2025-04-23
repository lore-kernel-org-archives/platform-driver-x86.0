Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644931A0711
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415905; cv=none; b=RRt6PFzCEeS1IekebIxynTwpnD0d0jyO/l1Vx5WtWGwrhoGrb6r29t/Vcw9qtSpM/nGCwy5Em9BY1TwN2pHifsvv8nByG8CRfDQY6v6TIXJTcA80Gze2C1prQpZ5fgW7vNyqkOc3CjjY72ZPHpWofNxCumobBIBh9esp9eWDg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415905; c=relaxed/simple;
	bh=Q1eChMXBb8j2AYX5Nyqb0wEoxk0iGX0vPs7ZqrzfVA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTcpF5dJHp1tdLjkkaVj0yClOZw8KteQWSblEQIW2f+0ba9DL9mGZJvYnuK7iAT1EnF7Xq5+kWQTPdFY2n1zMvCFvlwzUkKUaZi+5y5vAW0Vh4BFP2K927kiHAGRB72KzjwW2AtGvZ2S+YMgzTTCOCw7lZmfNWfrBuWetu/jyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDrz6tJg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDrz6tJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745415902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJ5gv09ygF35l1OaiXnZQcNcoSPfL4NpMVJ8pLBFjxE=;
	b=UDrz6tJgl7D80lpdsuXlhM80d5VSCo9zY1irNXEUNlbAJXKozY2qM+GYMwRKAZ7JaalVJV
	DVoNQJsgqthMSBos9DvapVYLA/l1EcACWtWHwUubHHQSYjKwrcFAo9iTeSd+zJrjdG8yVU
	sEpQAoiY4cX8Jm+VnQgOBPJIfx1MT4I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-fwdiiBR9PzavroWa1gvgDw-1; Wed, 23 Apr 2025 09:44:59 -0400
X-MC-Unique: fwdiiBR9PzavroWa1gvgDw-1
X-Mimecast-MFC-AGG-ID: fwdiiBR9PzavroWa1gvgDw_1745415899
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb67aad0e2so106372966b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 06:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415898; x=1746020698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ5gv09ygF35l1OaiXnZQcNcoSPfL4NpMVJ8pLBFjxE=;
        b=HSzI0Ff203sOoT1OhU+F0br+kCXviEmPLY+UT57bp30ruUqDoxXI9S+ORv968SFujU
         eoOYCa+qRhmR9fLk+xZ9d84xxeEN+7Ywv7ZQQtwngzw8rNQvdR9AGzO0c52ZxKpNSTfB
         T8e6hNInUhqZpYD6/2zrE3PCb4yof2hyZxQfFkFtQpiiwVtKQe6WVjyGcxKyeihX/UJ0
         I3SAEfx2wol3jXo51xYWd7MTu69OonKzrMVU15BLCgZ7qi7U+LIF41Pb41nEc5evtXPJ
         AZDmk1r9AwpY/A/p5k3Ed3Hh0OzaCrHTQGFWth7K1jmH01+nNze4VLUa1ZU7CCKTdLVs
         WhhA==
X-Forwarded-Encrypted: i=1; AJvYcCWAMX36NEhIchNoCQWwGVQHDt2PafD4vjcCIsOnVHIrTS16Kx71mhd8Ayr8cBiVaJmTH2VcTeodPVSxz76NeB2kLL1z@vger.kernel.org
X-Gm-Message-State: AOJu0YxAF+T59BBzq/4mx/7Vh7U7vcgUId6t38Aft/LLQr/Pt4Ko3FPo
	UY1mFQv7X038G97a+nufOrf8uYqzHp/nwC46Fsi/ciMMnKnCwq+h1NtbcMhz5QPJ5LmbHNqet28
	wqcZE5JBVnVcWw3p7tGTFUS1XFN8ALUfD0y8ijd73xWfdaVDMlrAyW1uyBi11ji+j/ezZItI=
X-Gm-Gg: ASbGncsW6AzSM87BFXE1A8CJ7K8olBwVw24O+4knUXWiBF0yadkowhi53ti319nRD5t
	TpsDiWWXHv0HNJNpT3rkoPeUxLcN5rSLf0WLwrs8L81xUWOugB0q1hEAMtwH1MjmjRlp9iVOBQG
	mLNkExKMNTPs/05VbLg7sPVbzlJ90twmB5B7a1e7fU05E5JXPjuhZfOoxOZ423lyjtI21N3bcgi
	IggJv20uJK166qyyu0BaucmJ2MS0sWH8cRGgBX4MDyvAMk8wf/rvnmrW6/hyTq8biw0lkmPq0Wp
	Co72zX9tvijUIUgExXTxndlFWWnKFQoCRRNpLeB8NRjQHI9Z4Vwgn//FwLhqb/7mi3YtnbfDWwP
	kFRUN5YqIFtT6VZbGRnJdUcadwHtB8YZ86WdxSy3M/7m5p0Umsp/ybJ/1Yzb7vw==
X-Received: by 2002:a17:907:d17:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ace3f5581b4mr199551666b.24.1745415898484;
        Wed, 23 Apr 2025 06:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElmZ/MasdCCvRghfoC8x65br1kPWD5m9cakkgObsOz40k4aovI6RQItljyVetzp7rYKVZ8fw==
X-Received: by 2002:a17:907:d17:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ace3f5581b4mr199549266b.24.1745415898077;
        Wed, 23 Apr 2025 06:44:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa17f9sm792314566b.165.2025.04.23.06.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:44:57 -0700 (PDT)
Message-ID: <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
Date: Wed, 23 Apr 2025 15:44:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Kurt Borja <kuurtb@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyndon Sanche <lsanche@lyndeno.ca>,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 23-Apr-25 3:27 PM, Ilpo Järvinen wrote:
> On Fri, 11 Apr 2025, Kurt Borja wrote:
> 
>> Use a faux device parent for registering the platform_profile instead of
>> a "fake" platform device.
>>
>> The faux bus is a minimalistic, single driver bus designed for this
>> purpose.
> 
> Hi Kurt, Hans & Greg,
> 
> I'm not sure about this change. So dell-pc not a platform device but
> a "fake".

Arguably the dell-pc driver does not need a struct device at all,
since it just exports /sys/firmware/acpi/platform_profile sysfs
interface by using the relevant Dell SMBIOS interfaces for this.

As such maybe we should just completely get rid of the whole
struct device here?

If we do decide to keep the struct device, then since the struct device
seems to just be there to tie the lifetime of the platform_profile
handler to, I guess that calling it a faux device is fair.

> I'm not saying this is wrong, but feel I'm a bit just lost where the 
> dividing line is.

In this case it seems to be clear that this is a faux device,
but I do agree that sometimes the line can be a bit blurry.

Regards,

Hans




> Is it just because this driver only happens to call
> dell_send_request(), etc., not contains that low-level access code within? 
> Or is that dell-smbios "fake" too?
> 
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/dell/dell-pc.c | 46 +++++++++++--------------------------
>>  1 file changed, 13 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
>> index 794924913be0c6f13ed4aed8b01ffd21f1d34dea..48cc7511905a62d2828e3a7b593b3d2dae893e34 100644
>> --- a/drivers/platform/x86/dell/dell-pc.c
>> +++ b/drivers/platform/x86/dell/dell-pc.c
>> @@ -13,18 +13,18 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bitops.h>
>>  #include <linux/bits.h>
>> +#include <linux/device/faux.h>
>>  #include <linux/dmi.h>
>>  #include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_profile.h>
>> -#include <linux/platform_device.h>
>>  #include <linux/slab.h>
>>  
>>  #include "dell-smbios.h"
>>  
>> -static struct platform_device *platform_device;
>> +static struct faux_device *dell_pc_fdev;
>>  static int supported_modes;
>>  
>>  static const struct dmi_system_id dell_device_table[] __initconst = {
>> @@ -246,7 +246,7 @@ static const struct platform_profile_ops dell_pc_platform_profile_ops = {
>>  	.profile_set = thermal_platform_profile_set,
>>  };
>>  
>> -static int thermal_init(void)
>> +static int dell_pc_faux_probe(struct faux_device *fdev)
>>  {
>>  	struct device *ppdev;
>>  	int ret;
>> @@ -258,51 +258,31 @@ static int thermal_init(void)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	platform_device = platform_device_register_simple("dell-pc", PLATFORM_DEVID_NONE, NULL, 0);
>> -	if (IS_ERR(platform_device))
>> -		return PTR_ERR(platform_device);
>> +	ppdev = devm_platform_profile_register(&fdev->dev, "dell-pc", NULL,
>> +					       &dell_pc_platform_profile_ops);
>>  
>> -	ppdev = devm_platform_profile_register(&platform_device->dev, "dell-pc",
>> -					       NULL, &dell_pc_platform_profile_ops);
>> -	if (IS_ERR(ppdev)) {
>> -		ret = PTR_ERR(ppdev);
>> -		goto cleanup_platform_device;
>> -	}
>> -
>> -	return 0;
>> -
>> -cleanup_platform_device:
>> -	platform_device_unregister(platform_device);
>> -
>> -	return ret;
>> +	return PTR_ERR_OR_ZERO(ppdev);
>>  }
>>  
>> -static void thermal_cleanup(void)
>> -{
>> -	platform_device_unregister(platform_device);
>> -}
>> +static const struct faux_device_ops dell_pc_faux_ops = {
>> +	.probe = dell_pc_faux_probe,
>> +};
>>  
>>  static int __init dell_init(void)
>>  {
>> -	int ret;
>> -
>>  	if (!dmi_check_system(dell_device_table))
>>  		return -ENODEV;
>>  
>> -	ret = thermal_init();
>> -	if (ret)
>> -		goto fail_thermal;
>> +	dell_pc_fdev = faux_device_create("dell-pc", NULL, &dell_pc_faux_ops);
>> +	if (!dell_pc_fdev)
>> +		return -ENODEV;
>>  
>>  	return 0;
>> -
>> -fail_thermal:
>> -	thermal_cleanup();
>> -	return ret;
>>  }
>>  
>>  static void __exit dell_exit(void)
>>  {
>> -	thermal_cleanup();
>> +	faux_device_destroy(dell_pc_fdev);
>>  }
>>  
>>  module_init(dell_init);
>>
>>
> 

