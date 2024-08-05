Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88E2BCF7
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870869; cv=none; b=kxyj8rXAJhztc/TJyOrLryZfwx/+Ojxd5vd0mOP12D4bav2e6gKFe0FnpZHXTZn1UtCGaUdvJAnfNlBYqEhO77K+LrHtQ9PbN3a2kZLMFUCMUuwnqwuC5DgQbWZEAxrGhSj0w+rWTi5vR33aH+IrI/rg7WqBMPssmZVlfNej6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870869; c=relaxed/simple;
	bh=7OvJAJgVYRx1Z/arwi9q84O1QkjILFe2oIufbyEMxq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6WqWTgAz9GvLMr/Uxp72//xZo3jw7isXnGVrCWtDXSZOImAzVQPs1YswgBVAu4V9cEB+IGwbkx5YC5DBDVTwmnQN3McvbKSkO39O0l586ucri8O1F0nNE35n6nN4a/aSt/Pl18ATaUvYc77vg2X23OZlOLBn9lQBHF1pOf8y6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdjpAPIS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdjpAPIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722870865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Zs9SN3PXCVdBxc7PU119vQ+FwJ4nQwvm9D43mIbl8w=;
	b=MdjpAPISIXjV9C5KjPqxGPyM8UHOb6ZjXuLlX3O5OYUbAIAx0eb4pBDlj9CqKy4QVU+htV
	Nb/ek7U56fDEBeQJUcr0FSeQeD9ISJO8V/Ynte2KUu82bkzIJecBTNs1haoEiJ2xZD0zGd
	CykOaKeg6DCFE64fkG2I4GH8HEdqfCg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-WLcdEFeiMp-rJ1UBbhFaGg-1; Mon, 05 Aug 2024 11:14:24 -0400
X-MC-Unique: WLcdEFeiMp-rJ1UBbhFaGg-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7f6218c0d68so1657886439f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Aug 2024 08:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870863; x=1723475663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Zs9SN3PXCVdBxc7PU119vQ+FwJ4nQwvm9D43mIbl8w=;
        b=oyLOIZlKy8jKPiitx4t+XAj2VTeYIOcj/9SBoNWHclTXq25OgolrQrvNxHXB8k2uEq
         U1jXUiuZ+XRgh1ercddTLiU1BIEgjtk2CHUiN8oasKqMO7XUd2528cGOBF4kUt4XjTn9
         knTY0JGvgDknQqJkQAJPKr60jA7lRHfagUxReGAY4eynki3IIbwWHZARgLPIxiWMrvEp
         12opIuVgyC1AYmb1FHLH8bsu04s6XRJCmGk5biinFj+Xo1Ag94QxxRLPU6R9NBMVB21a
         L29kCngT/Uz4agJHdqMrvQGYB0Wdkdnz4HFltQXY3RKGVFzMEBG3FQgsDcJvhva7qEyk
         D1aA==
X-Gm-Message-State: AOJu0YwEkgSAe7LrOYMkCOpOQ+mwy2p+a4qYLfAtEaLqhGj/LHzcJ8Cz
	OKAXMvDGZiY6UiJxgE4j5nI+Ew3x3doCdT8ZTySqlR7iUfFbEfeW+hHrwPzn0bJK0aJ/5rbt4Tr
	H3z41tjpDvFdelS11AT/U6QPSRgYbBN8rPPc17a/yDSJgYCi7S0PbZDVK5d2PIydihtCGVj/qaO
	RnV60=
X-Received: by 2002:a05:6602:6414:b0:7f6:83da:dd12 with SMTP id ca18e2360f4ac-81fd43924d3mr1806526239f.11.1722870862897;
        Mon, 05 Aug 2024 08:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHp866FKs3N0GAgAGdS61eDS2I3H5Lna3kaCdTin0enIg/S6Ey8t4q8U4PgiqLnDyzbuWh+A==
X-Received: by 2002:a05:6602:6414:b0:7f6:83da:dd12 with SMTP id ca18e2360f4ac-81fd43924d3mr1806523039f.11.1722870862491;
        Mon, 05 Aug 2024 08:14:22 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d6a27a68sm1755135173.110.2024.08.05.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:14:22 -0700 (PDT)
Message-ID: <ff683cf3-1b0f-4110-82b0-ed6889151bff@redhat.com>
Date: Mon, 5 Aug 2024 17:14:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: Add quirk for ROG Ally X
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 LKML <linux-kernel@vger.kernel.org>
References: <20240724222852.44378-1-luke@ljones.dev>
 <056b599c-4d29-a743-ad7b-055e951e9e39@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <056b599c-4d29-a743-ad7b-055e951e9e39@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/29/24 1:44 PM, Ilpo Järvinen wrote:
> On Thu, 25 Jul 2024, Luke D. Jones wrote:
> 
>> The new ROG Ally X functions the same as the previus model so we can use
>> the same method to ensure the MCU USB devices wake and reconnect
>> correctly.
>>
>> Given that two devices marks the start of a trend, this patch also adds
>> a quirk table to make future additions easier if the MCU is the same.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c            |  2 +-
>>  include/linux/platform_data/x86/asus-wmi.h | 15 +++++++++++++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 2b968003cb9b..bac2945b0e48 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -4694,7 +4694,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>>  	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
>>  	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
>> -						&& dmi_match(DMI_BOARD_NAME, "RC71L");
>> +						&& dmi_check_system(asus_ally_mcu_quirk);
>>  
>>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 74b32e1d6735..fba9751cda5b 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -196,4 +196,19 @@ static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
>>  	{ },
>>  };
>>  
>> +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
>> +static const struct dmi_system_id asus_ally_mcu_quirk[] = {
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
>> +		},
>> +	},
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
>> +		},
>> +	},
>> +	{ },
>> +};
> 
> Why is this in the header? I see your comment but this means every file 
> which includes asus-wmi.h will have a duplicate copy of this array.

You are right, although asus-wmi.h is not included that often it is only
used in:

drivers/platform/x86/asus-wmi.c
drivers/platform/x86/eeepc-wmi.c
drivers/platform/x86/asus-nb-wmi.c
drivers/hid/hid-asus.c

But all 4 of those usually get build as separate modules, so it would
still be better to move this into a .c file.

Luke, the comment says that this will be used in hid-asus.c too, but
I think that is a copy and paste error resulting froom copying the comment
from the asus_use_hid_led_dmi_ids[] DMI matches array.

It seems that this DMI matches array will only be used inside asus-wmi.c,
in that case it would be better to just declare it there instead of
in the shared asus-wmi.h file ?

Regards,

Hans



