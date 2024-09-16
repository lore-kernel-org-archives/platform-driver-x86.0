Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48A153BEE
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726492235; cv=none; b=uWcCVWlAaHI4R4yioYuuyRWgmIQFwQY4g5bWspUllQlU0MpkOKvpaj1XsagVvl2dXYfJk7+WPsDsa2HWKAspWrIN18HmT2DW7yo4OZ+rGecppvV4LkHpUnphyHWVna9n3WQAQd+HaYBXyuPTGs0xNuzwagsEBxl2AyhGYEDquIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726492235; c=relaxed/simple;
	bh=vHS8+50ly9WpUk46/ZUx7hwLbbRQzdWVucEMByme3BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQkLn1xCKNf1Xcn60wZiKLMN61dk3dll5a0SZ9UNip5Khd5+MexFqykXF9SYKO2rZGby6LGaRaon4bFsIjmC39OlBnE8x+zzwcZwEzxQNC4wQ2sS92FWixi8FHnEyZnW8GVqip0l0LWcjwjvjQMbjktNONe73XfScI1nxvwUIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdVagBm3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdVagBm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726492232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a900XejWkEV3/drQlJeRMCoQ9/CRvzYF6kefkEgbOLI=;
	b=GdVagBm3tHRUgGFWmx414RVOL3x/CQSTTG7blJWFw1Fcbk74bcNN7RAnGjNHFbl6aMk4rt
	TjaJOgGW1X9xL7t9zPt6ugDYdKWa1XSSnhZESYva99Y/HnB/BOWTiYVeeZzW5krLXhCAQL
	XmICriKdEZXlSIdqW0HyskI0qQ1jGTw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-w-XwJjSdPg66It_HnIjP_A-1; Mon, 16 Sep 2024 09:10:31 -0400
X-MC-Unique: w-XwJjSdPg66It_HnIjP_A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c90d24e3so2174368f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 06:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492230; x=1727097030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a900XejWkEV3/drQlJeRMCoQ9/CRvzYF6kefkEgbOLI=;
        b=RoHBsBB0/8cIglT/koJAvEEpcXX4615mwdmyY8asdqoT1syT5DN9rBctjcXWHLesAO
         ccIyzCjXv3aalyT+aOS/3M4o8qffg92Pb/Ev8VLm2ooKYB7fIo2bJdmMTK2gI+FoFlVU
         VFOnQAe0L3NcKC8mfRCsJI2EFmlRFwAWOPfs57DFGsalISVDCAcHk+logdGlyoLCRejQ
         YhLDtiIvkPlSZnQn6FEavPRv6plMG+QeviJqVS20z/SGZvgYsdfT+pS8lwV033H5FJ7q
         UI5mUN1I6CIKj5tTwkcDXq0tuE5wCGTWk0EDnIlTEg+JIfcA0+hxIOZQcyqbEpMohdR3
         sj6A==
X-Forwarded-Encrypted: i=1; AJvYcCUcwnopLDYlaG7rLLoUk6KK+lYrgODyxEKIOsxFBkjeFVLum/ds49T5Vhx4tK3XwbUq0aN59ONq1k5+c927QlEFkNN5@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1AlyO0MyYf/tMVJbUWDp+rBgabkJBa55gGMU8fpWaJkmtbvJ
	zDEYd/7lWeamwixv8a9OrAylBhOYGlvrWBtYmS06/ZWpe5hdOy8+M+MjjLAb4VguBqTDZLVir+E
	UtFVDakfiLvT/WX+GQo08vBNRKXO41c71Lcwm6Wh5nGoZNfluTfmDonHWPQG/f8XFCfFujOg=
X-Received: by 2002:a5d:6a84:0:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-378d61e2b0emr9936754f8f.23.1726492229836;
        Mon, 16 Sep 2024 06:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZRpu0HLmS2wmnxdLcq/xCrCZV3L2bFhSv0+by6Di2swr0Wh4e+jI9E6gPc6jK7CSeHqoFuQ==
X-Received: by 2002:a5d:6a84:0:b0:371:8dd3:27c8 with SMTP id ffacd0b85a97d-378d61e2b0emr9936728f8f.23.1726492229298;
        Mon, 16 Sep 2024 06:10:29 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061096762sm314123466b.37.2024.09.16.06.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 06:10:28 -0700 (PDT)
Message-ID: <4993f4c1-3105-4001-ab46-c1a92e585064@redhat.com>
Date: Mon, 16 Sep 2024 15:10:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Adjust Xiaomi Pad 2
 bottom bezel touch buttons LED
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20240916090255.35548-1-hdegoede@redhat.com>
 <ZugfD9O7UqR-Ielp@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZugfD9O7UqR-Ielp@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/16/24 2:05 PM, Andy Shevchenko wrote:
> On Mon, Sep 16, 2024 at 11:02:55AM +0200, Hans de Goede wrote:
>> The "input-events" LED trigger used to turn on the backlight LEDs had to
>> be rewritten to use led_trigger_register_simple() + led_trigger_event()
>> to fix a serious locking issue.
>>
>> This means it no longer supports using blink_brightness to set a per LED
>> brightness for the trigger and it no longer sets LED_CORE_SUSPENDRESUME.
>>
>> Adjust the MiPad 2 bottom bezel touch buttons LED class device to match:
>>
>> 1. Make LED_FULL the maximum brightness to fix the LED brightness
>>    being very low when on.
>> 2. Set flags = LED_CORE_SUSPENDRESUME.
> 
> ...
> 
>>  #define XIAOMI_MIPAD2_LED_PERIOD_NS		19200
>> -#define XIAOMI_MIPAD2_LED_DEFAULT_DUTY		 6000 /* From Android kernel */
>> +#define XIAOMI_MIPAD2_LED_MAX_DUTY		 6000 /* From Android kernel */
> 
> Perhaps + suffix at the same time? _NS? _US?

Good idea, fixed in my tree.

> 
> ...
> 
>> -		.duty_cycle = val,
>> +		.duty_cycle = XIAOMI_MIPAD2_LED_MAX_DUTY * val / LED_FULL,
> 
> I haven't checked, just to be sure there is no overflow and 64-bit div on
> 32-bit machines...

all variables are 32 bit, so this a 32 bit div. LED_FULL is 255
and 6000 * 255 = 1530000 so the maximum easily fits in 32 bits .

Regards,

Hans

