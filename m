Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE81DDF4
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612722; cv=none; b=lzmZxNVyTmd5XRIxxf74hHc/7Z8i+tAQu/fKXQzLom76gDT8C1cuVfT+Uj8upsph/okaYgVCtw1qtHrc6Uso9mIU+xld+Fuljs9pgvEdmdKQr+aOFmTBg1UwaHYOX748IrHORWEJeMqoPa3r6d5gwg5YpT4HuGgPwBBKdy7Lq4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612722; c=relaxed/simple;
	bh=REYLXh0c5O0KVoQWB8LzifXLO6n0dHF820MpmDJDSY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVSK1lrehD1uryAzs1uXSnO+IYw1oU/5NWwDGjEiKy3saZGSr35o7mo8cU52lrqaLNlIfOcY8+EZ2wAkaa3UZDmuudJYN/V5fkyEl//RTcG5ptZbPHHRsgs9uABIl9V4fbREH7C9v9On8Ry2ykDFU8RUA/pfTUdfijHpX4EbZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TbFAILZr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbFAILZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715612719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vq5XZEU34+kRsMUlzQxhoumdWV6C5baQbTMosTkq4w=;
	b=TbFAILZraRIdC4/NRCoz9/flIRcRdmoSFO4xiPMb6TS29I+fmIq7eifWwvEUp0i73WM9n0
	9e+AKX+Ftg6ac236HUqp1Juem/PMFP3NUigUGjy6P3/qjw+H1ev2goncWKnpyf60t8/E4r
	3fwGhzDy8524JtwL5T/UZaH12o+Hdok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-eEDurjSgMdiHPVa3iwCdew-1; Mon, 13 May 2024 10:59:15 -0400
X-MC-Unique: eEDurjSgMdiHPVa3iwCdew-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34eb54c888cso3634845f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 07:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715612354; x=1716217154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vq5XZEU34+kRsMUlzQxhoumdWV6C5baQbTMosTkq4w=;
        b=wfxY60joR1olHeb0cJAJ1z5bqle7YxBZIx5pj+1QCn5qL8uMK+MCafgfk5rup5W2yN
         U1iLLU5Go9KAomFkEiTKIjQvzq8PyazGFzyqkB9b5RDrcRrHhvrLcuZE4pprzv/cuOTa
         tJCciMO0pEsP6daiVDeJuSgF6wLCVjYL+MG6MpXYVQTn3e+n098OHxHEWOdwEwIoKQXg
         1xF58ZKQLONENgPeW4CLloNZ61qmRV/GZ8edRFI2CvIo3KBzPVthzfQepQ0/d/0Bts4k
         7nDkRnQIiXez0uKKCl1764HZZbBT1rOl1Z20RPZkpxn1bcTFF0mt5Iqv+DEMbJB2+IPD
         N1rw==
X-Gm-Message-State: AOJu0YyVYyuCVB3wgCpZSmT7qIoiQCIrVPat518rmIazkDKigZSzs21Y
	zWQNb/nh8l0szl2jLkQEwy8uyOzFn5woMOzrWbD7q7JRry46cwS65Xw2b4KuDAocPTkXjJkDnEK
	gSY60egYcCjGHB4W4cRmrZn5iri0z6VeTYvMzJelXegGmp8ju7mgauQemWMV5yd/Zb7229ZvZx6
	U8iBw=
X-Received: by 2002:a5d:530a:0:b0:34d:9aca:f4bb with SMTP id ffacd0b85a97d-3504a73727bmr8441037f8f.19.1715612354116;
        Mon, 13 May 2024 07:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFypdiCh86OewDrFILPLT7/ALN8ECLX2p1gAqpRbQbDzCh097E8/xag6lTnJu5G78nQM7h0Zw==
X-Received: by 2002:a5d:530a:0:b0:34d:9aca:f4bb with SMTP id ffacd0b85a97d-3504a73727bmr8441024f8f.19.1715612353745;
        Mon, 13 May 2024 07:59:13 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0173asm615820566b.179.2024.05.13.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 07:59:13 -0700 (PDT)
Message-ID: <dd5e5d77-a0ec-48d5-9135-34b6d9b3b8f2@redhat.com>
Date: Mon, 13 May 2024 16:59:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] platform: x86-android-tablets: Xiaomi pad2 RGB LED
 fwnode updates
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20240504164105.114017-1-hdegoede@redhat.com>
 <20240504164105.114017-8-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240504164105.114017-8-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/4/24 6:41 PM, Hans de Goede wrote:
> From: Kate Hsuan <hpa@redhat.com>
> 
> Xiaomi pad2 RGB LED fwnode updates:
> 
> 1. Set "label" instead "function" to change the LED classdev name from
>    "rgb:indicator" to "i2c-ktd2026:rgb:indicator" to match the usual
>    triplet name format for LED classdevs.
> 
> 2. Set the trigger to the new "bq27520-0-charging-orange-full-green"
>    powersupply trigger type for multi-color LEDs.
> 
> 3. Put the fwnode link for red before green in ktd2026_node_group[] so that
>    multi_index becomes "red green blue".
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/x86-android-tablets/other.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index ce487b3c972c..198ea894d071 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -609,8 +609,8 @@ static const struct software_node ktd2026_node = {
>  static const struct property_entry ktd2026_rgb_led_props[] = {
>  	PROPERTY_ENTRY_U32("reg", 0),
>  	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> -	PROPERTY_ENTRY_STRING("function", "indicator"),
> -	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging"),
> +	PROPERTY_ENTRY_STRING("label", "i2c-ktd2026:rgb:indicator"),
> +	PROPERTY_ENTRY_STRING("linux,default-trigger", "bq27520-0-charging-orange-full-green"),
>  	{ }
>  };
>  
> @@ -656,9 +656,9 @@ static const struct software_node ktd2026_red_led_node = {
>  static const struct software_node *ktd2026_node_group[] = {
>  	&ktd2026_node,
>  	&ktd2026_rgb_led_node,
> +	&ktd2026_red_led_node,
>  	&ktd2026_green_led_node,
>  	&ktd2026_blue_led_node,
> -	&ktd2026_red_led_node,
>  	NULL
>  };
>  

