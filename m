Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF297174D
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188718; cv=none; b=KO2+hjVSjA5PPtHFjwOQkLnP4DGpvJFHk8CSKuoP9PrF3gw6kwWfA1nMngPsEUpiKgJCz/wtI9SLEnLhDxjBcJ6ZEiD03RMkAjICSOTMm8sf99T9ewcdIfwCXmwpA7ixT2d/iR8jm304gmIdB7LtaFRxB6rr73n4EikF9PJyyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188718; c=relaxed/simple;
	bh=H+B3pQuhxCA59NKCu+q5vitH+TN6tJ22oaJoMn3xZ/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0HMcEBXeN8ZFFx54UDHbwrQmyF3mubE76E5SY/HGTt7Jr7536b+/aTPDj2n7k9mQvi9UnQ/QbJY1sxahhDwoMyh7zpH+YqCWBkbSkS6OwqO5sb5DnXF5USamMWVue8TLaEPCMgbcEAjEeFcAFpRWTwoM+lX5qpRzA3SnOi1R2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ss+5wTps; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ss+5wTps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713188716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wqce/9raECD4n9z1gyCEXu+9q/G8QA4dWvqni2YgFJ8=;
	b=Ss+5wTpsXfx10K4zJxX29H04LRwP8WjflSh/OmqkWWLHqEHFOpC8u6tNy1xhb6/t5YwrzT
	y32lyt5tw3jK2qhPMpUU8ncAFdmQtLdBR9oUr5HKCLzcGrcjPQYpyKoPhMH7ymodMUCgYx
	dl1cVoJw1sJhrogHP4hz7OJ1s32sCdc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-TJ5sLLizOqmnZhylYJvlxw-1; Mon, 15 Apr 2024 09:45:12 -0400
X-MC-Unique: TJ5sLLizOqmnZhylYJvlxw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a52233a228aso230126166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 06:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188711; x=1713793511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wqce/9raECD4n9z1gyCEXu+9q/G8QA4dWvqni2YgFJ8=;
        b=jXiFQTa/LH5T7XZyrRCGa4yyaXP56cct2KszeNQCsueTClR567QMbtlxsryT1YRgbU
         DV6B0WyRZyVlvM/k/RGIbc2xzyFPPMOB8WQvmw2+YMBhUpCPDOSFArwv4u/S+3L7QtVi
         Q2CfQrxexGzMMSe22Mb/yIj3lXhIlaqobcxg2616xyLaDBeIuXXbrrEDv+aH6WZZdKgh
         ZdjFMFzSgbZmeD/0SlSAzLCUT1jOBT3WONnVf4/eCmzjh2xaZBJTe5WRa0bBPsYCxyvn
         IBl9Bx7lv+gSNhpSrjOYMJ0ZjAq9OvGdJQFv0R9ZtjMjMkoVJYToeJx85Dtn3t0wHutC
         klPA==
X-Forwarded-Encrypted: i=1; AJvYcCUgT2QvNJSY8Ox7G5hcweUjeD4SZCoSSHeQWmDEbc2YwqVDD6PrEascMC8xIKnLgSPQVtE47t7KK4u05aPwSn0OcFyeCBPZbDkJojhJXKKKs1EBtw==
X-Gm-Message-State: AOJu0YzbU6/NvCyuzMYi7m/iWx6SGYHpCwSNcJwemGGEQb+I3xOYkeSw
	zp6kkxMY1MbOv3ZeXQc7WkZi2urXCgbeQdVg+mN6o738IE5DOkzfX5xxluwrqdresVndvFDt2km
	Rf+ifzKTkH+ybxFoaJnsoOTGWkk3wqtsz4Z3drOoK0HaEsFs6ENTrqvt8py+PW0sGNSrcKX8B8N
	XqETF7LQ==
X-Received: by 2002:a17:906:ae8c:b0:a52:6fca:eb57 with SMTP id md12-20020a170906ae8c00b00a526fcaeb57mr1733607ejb.45.1713188711207;
        Mon, 15 Apr 2024 06:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESSJzHoNootY7yTStSalob24MtrnXEF6BFFSwuhXN7Wy3qvNO5UaWy+uXLPG1CLzmr3h4+Ww==
X-Received: by 2002:a17:906:ae8c:b0:a52:6fca:eb57 with SMTP id md12-20020a170906ae8c00b00a526fcaeb57mr1733593ejb.45.1713188710851;
        Mon, 15 Apr 2024 06:45:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qf30-20020a1709077f1e00b00a46a27794f6sm5443325ejc.123.2024.04.15.06.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:45:10 -0700 (PDT)
Message-ID: <e6cf5488-8c80-49db-b67a-0effd4c3e782@redhat.com>
Date: Mon, 15 Apr 2024 15:45:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: android-tablets: Use GPIO_LOOKUP()
 macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240408153749.119394-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240408153749.119394-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/8/24 5:37 PM, Andy Shevchenko wrote:
> Use GPIO_LOOKUP() macro which provides a compound literal
> and can be used with dynamic data.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index a3415f1c0b5f..3f56a9dcba52 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -52,10 +52,8 @@ int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
>  		return -ENOMEM;
>  
>  	lookup->dev_id = KBUILD_MODNAME;
> -	lookup->table[0].key = chip;
> -	lookup->table[0].chip_hwnum = pin;
> -	lookup->table[0].con_id = con_id;
> -	lookup->table[0].flags = active_low ? GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> +	lookup->table[0] =
> +		GPIO_LOOKUP(chip, pin, con_id, active_low ? GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH);
>  
>  	gpiod_add_lookup_table(lookup);
>  	gpiod = devm_gpiod_get(&x86_android_tablet_device->dev, con_id, dflags);

