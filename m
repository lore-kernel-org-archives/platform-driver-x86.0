Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC61158543
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728212053; cv=none; b=KQ2Hu+Igf4n3d7wOOF5FiF4OVhavLqefegnhehvuJWqHR4Xbsyu2yNwn1wx0MuYn60+Amjj4VsoKaRfQnXfrguFo8GlTL+HE6DjBFO4cklUUcGsqvTI6AQTUJoSe8yS7LaSBR1ajTozw6B0ac2cSDI99wiJfNnZ66yk8DYFNFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728212053; c=relaxed/simple;
	bh=cROfBe+SuXo3lMivgnlQ1uaVsQV2kqIj3TiAGDMsXlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2z0lw+qbgfjfw3ajN5l0ppPHIsTrVevCOXrumUIlgBZVv7cBJ+2hbadGVZ5nvw5eah2zV7C4MtrPZvBMK58LOFs1/QWMUpt+VInRqh7iqMn2pDSydgT+DflRZ2A76ehNo+0kodrFMqd5WZqSBxCl3ZWpQA5WMcRv3iZXIGeyvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJDN6RNQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJDN6RNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728212050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wze4sPIle4n2qrkbkZBehw4qnRWlVkQAptEEcDKphSA=;
	b=PJDN6RNQPLsbHTSIrrMzAZlLCkSkgdeVuF8X6oZtoYm6y3zYtPMQD8PbGXjt/NxpvAyXZf
	AAYxI8qO/cxZ7KmOk4HKIB4dqDslWRB3R95kW2uNG8JvRPCzNOTTnQlDEOX7NwPIygrvha
	myEnCV2nKRkTQ6Y23dIHqxvfrJDpFUk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-SWcQx9czOmSfbiEOScF4Jw-1; Sun, 06 Oct 2024 06:54:09 -0400
X-MC-Unique: SWcQx9czOmSfbiEOScF4Jw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a994dbc405fso37264866b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728212048; x=1728816848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wze4sPIle4n2qrkbkZBehw4qnRWlVkQAptEEcDKphSA=;
        b=g0efF0SZSyg8749QceppEDpJu8WcWzMOb8olg6OlKqioutoeX6o55GiVcSQoh7tT4n
         f8CGdRlDWorXy05OWYBMN6L1iP+R0KwcQO9lWGsXWIXnduUwst9h0uaPwX5xWykEVtCT
         u6Rito2v7EjesegljH7UIRiGwQQ+/DhU61egE72KFvZiqCxNvOruVDdkESa7AN6yyzzX
         /5C7eR9cBQz81wvmGZ03OMt8tKsHbPtm4RICsJAU3UyYBmq3/fJnYLnnJYhWTOdxZ7JR
         cJX/VKBhgYDfjY/cjC4SYxCUdiDmkMxMFjccTg2Mz/1S0ecvzFvAMxlt9DtJSL+8qN7v
         rC0Q==
X-Gm-Message-State: AOJu0YxsanBDEz6AzbJDD24oyeItThYuT/ASlr4qEdq3iuZpaE9w0o8Z
	4V7zQ9NNiGySvATZCpzodsrIxD/jJRIO082j9VmVdKlj6PF/3AqpVKY/nz0fPYIEh1LW61Vrzgf
	nzBY9l10QmIvlLy+rZjotxP1KjliJ1tGZBPFIynf89RgEnTELCqZNEX/yDdC54h+W8hqcR74=
X-Received: by 2002:a17:907:3d94:b0:a99:3768:7501 with SMTP id a640c23a62f3a-a9937687755mr512946066b.51.1728212048253;
        Sun, 06 Oct 2024 03:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc2+Sj17Kre1jLRnbj4ZNu1RI2dem3EerE/noc0fzZWy++oF6vuwN9OnjAi/egLyoN1MXBqw==
X-Received: by 2002:a17:907:3d94:b0:a99:3768:7501 with SMTP id a640c23a62f3a-a9937687755mr512944666b.51.1728212047770;
        Sun, 06 Oct 2024 03:54:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7bab77sm240217466b.153.2024.10.06.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:54:07 -0700 (PDT)
Message-ID: <b54c7d52-d566-4e11-ba87-56b51d641ab5@redhat.com>
Date: Sun, 6 Oct 2024 12:54:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix use after free on
 platform_device_register() errors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, stable@vger.kernel.org,
 Aleksandr Burakov <a.burakov@rosalinux.ru>
References: <20241005130545.64136-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241005130545.64136-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Oct-24 3:05 PM, Hans de Goede wrote:
> x86_android_tablet_remove() frees the pdevs[] array, so it should not
> be used after calling x86_android_tablet_remove().
> 
> When platform_device_register() fails, store the pdevs[x] PTR_ERR() value
> into the local ret variable before calling x86_android_tablet_remove()
> to avoid using pdevs[] after it has been freed.
> 
> Fixes: 5eba0141206e ("platform/x86: x86-android-tablets: Add support for instantiating platform-devs")
> Fixes: e2200d3f26da ("platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()")
> Cc: stable@vger.kernel.org
> Reported-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
> Closes: https://lore.kernel.org/platform-driver-x86/20240917120458.7300-1-a.burakov@rosalinux.ru/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 1427a9a39008..ef572b90e06b 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -390,8 +390,9 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
>  	for (i = 0; i < pdev_count; i++) {
>  		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
>  		if (IS_ERR(pdevs[i])) {
> +			ret = PTR_ERR(pdevs[i]);
>  			x86_android_tablet_remove(pdev);
> -			return PTR_ERR(pdevs[i]);
> +			return ret;
>  		}
>  	}
>  
> @@ -443,8 +444,9 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
>  								  PLATFORM_DEVID_AUTO,
>  								  &pdata, sizeof(pdata));
>  		if (IS_ERR(pdevs[pdev_count])) {
> +			ret = PTR_ERR(pdevs[pdev_count]);
>  			x86_android_tablet_remove(pdev);
> -			return PTR_ERR(pdevs[pdev_count]);
> +			return ret;
>  		}
>  		pdev_count++;
>  	}

