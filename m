Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870103D969
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389032; cv=none; b=QdXikr96E4ohoJjAQJ1L155U0PuYlGefGHxZYrqBBZcaH75SmsCIVfGBjuetLoNzJJyQZGGsX8gmv3aO3SVcQvvxpp7K6tiRSib2Z4WFhHYfXrCCnwE+ob+Ar7dA6rWtnJ8SVkyFOxE5hx/IyJ2lEV0M/fro4gRD/wAnlrwrj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389032; c=relaxed/simple;
	bh=xtfhi2lRXFAsjd8WJbAKjr5hr8U/HWoTLSYoTbffFwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=buPQI0FaO0srUjnecCZJ0hbGanwmTdAThuQphV9iqyxq9lsW+ZefZgT3xouP9Hw4HdBgq4mfGmabD5OwJ9apkvqtl3O9xwjZwapv+odklnhUOHp+7jIP1jBPApSQC6HiEN1hZwYYfAiImz/AfP9a/X3Ub+lVSvI2M2RpM8wwykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5qVjIKH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5qVjIKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714389030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdqbQcKjEI5vcuFU2p8wlb5cXeIYqE2md5KD9zgkjwo=;
	b=U5qVjIKHAbu8w+Ewc3AtNMFLKFbRM66UupShlrR3uMHAzVo0OYxHwSIrShAeOhXVEwxFJm
	yx+JKGxfwEvIWp7Dv3RUGoEsp1UPXVlCbKCKXl2hH0Qk7i3XurxnLQEUN2Ej0DxG7l93yK
	xicd9QUn319MhAOeantrHPK2RZxFM2Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-LSmakIYfPTerV0suEWy8zQ-1; Mon, 29 Apr 2024 07:10:28 -0400
X-MC-Unique: LSmakIYfPTerV0suEWy8zQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c1ac93679so3396259a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 04:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389027; x=1714993827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdqbQcKjEI5vcuFU2p8wlb5cXeIYqE2md5KD9zgkjwo=;
        b=TV3lU73V8VVPn4RqjjRH8aTDhCS5iIITQZaYrfAHQ8MmnnKn1uSHHy4EarMnB6njva
         a5fo1Fg9+viD1HyzTqn5ntC08v4i3aHy6XRQK5N9rJmlwdFENSS1Q0tkjRHgUsmuFAxe
         5WLmHvReSfnMZv/JShxWy8LxxyJZ1/pcN5KJSwxnAWxR79X2tR6RAZTHob2xHAAG6GnF
         4B/bERCrsnDAcJYu+9+CALO5tJJhIZ2fVGyeZBo/jtJZMnp/pZo4rrXhAfkxXnnDs3wL
         2BsiD/BV+gNmfJQjmE3mxSXAHo9MhZIBmY3dbW5Og+I4dpAZJdgvkF1zIntn4G98ssjD
         C0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1PPlgEmfVPzBjDd3vRxljEhERtuPd9JV9odF3qhfKk/ntXi301BRsMfz2we7vGF3+sZnkUNYbo9ITrK/XbS0FKaE5D8Vh7ghANaaIDanSb0uug==
X-Gm-Message-State: AOJu0YwYJWhfohtT1FpF5S2MSlJ4a+AbTjUKyqtAYsjTIN/xtCYRvVbB
	V7cai7YhSFQ4p3UlcGVeV2aRlFS6Qp9LKuqowKKkYswutO9Ycnz9F2cYGBT3FpEKtTkhkmhqQDZ
	aKIOB5qAauhSnlds3DdHYlUBd00C9/clYwKlEkAfzYAsL9SV+tfgML0WYR130M8jxNlEb5SU=
X-Received: by 2002:a50:aa93:0:b0:56e:23e3:bdc3 with SMTP id q19-20020a50aa93000000b0056e23e3bdc3mr5865167edc.16.1714389027235;
        Mon, 29 Apr 2024 04:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+GeBDgDo2JBd+tgDcSYk8RG5tx1gn1dkUHGjKY1XaEOpPVLbqDyaIMP5fCJYqIgZOrL2blQ==
X-Received: by 2002:a50:aa93:0:b0:56e:23e3:bdc3 with SMTP id q19-20020a50aa93000000b0056e23e3bdc3mr5865151edc.16.1714389026997;
        Mon, 29 Apr 2024 04:10:26 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d19-20020a50fe93000000b00571c2402e6dsm12261753edt.0.2024.04.29.04.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:10:26 -0700 (PDT)
Message-ID: <27aefc94-3bf3-44bd-8689-22e0c984855f@redhat.com>
Date: Mon, 29 Apr 2024 13:10:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] platform: x86-android-tablets: others: Set the LED
 trigger to charging_orange_full_green for Xiaomi pad2
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
References: <20240424065212.263784-1-hpa@redhat.com>
 <20240424065212.263784-7-hpa@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424065212.263784-7-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/24/24 8:52 AM, Kate Hsuan wrote:
> Set the default trigger to bq27520-0-charging-orange-full-green. The LED
> will show orange when the battery is charging. The LED will show green
> when the battery status is full.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets/other.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index c77d56454f2d..52032a874b7f 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -610,7 +610,7 @@ static const struct property_entry ktd2026_rgb_led_props[] = {
>  	PROPERTY_ENTRY_U32("reg", 0),
>  	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
>  	PROPERTY_ENTRY_STRING("function", "indicator"),
> -	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
> +	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging-orange-full-green"),
>  	{ }
>  };
>  

