Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9B14F10E
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793341; cv=none; b=Ap1pA7+1HkobvmuAethlpPqRNyzRueZMBhXl/+HylOD0//QX5pzXVe6lgPQTwBXOqsYMEhWMDVYm6Caqgun4QvK7I/jMvVhhp9qZzjPqP9jISu2AN4GIe56h+abGd9YMpzM3xDIM2FyDHi8X4Sy4j2zhZYpm77b9DcGw+EAWm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793341; c=relaxed/simple;
	bh=2hQwBEpW01jp8qra2jvf/jNfR8J7cPQJApPJeAmp3hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thkerVrQmWH/R9oekyh4Uo/uYa86EJ81wv641Yzg0PvMnUCPYhPmXyEDfCeupUK8maIn1E7s8AOkwNVrnCWViGIagPnBxlOcUUMqwbZNaJegaE3uLiJVQQirtPKfCx7FxywKvdSNwfzmzH42DvntI1QzO/H4OQHWdbsfbPCANsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iu6p7yAg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iu6p7yAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjWK16yEpG2qC4sEpfQe3ru9FwvfTS+uslLAL5h78t0=;
	b=iu6p7yAgrFB/VWsW31UQD5c1uukqz2RiNfI/FZZnhy3iyVFRdzzjxM5PAwvcfNgqcxxWZQ
	/v47qcFf9y6G54f5bsk++8Tifv28o9tvLuOEFDaCE4G1WS11A63OslUwCtLSkXQyFGXbD7
	jkC0iTj5IthxtmwZacHVgNPyTTMJeXw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-z8cZbJ-rPjqBl5hFuArBqA-1; Mon, 22 Apr 2024 09:42:16 -0400
X-MC-Unique: z8cZbJ-rPjqBl5hFuArBqA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51fdbd06c8so309926266b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793334; x=1714398134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjWK16yEpG2qC4sEpfQe3ru9FwvfTS+uslLAL5h78t0=;
        b=FExBjbTHlSXuiBKpNz8FHxxPaDxlZfih7VElk0x6TpL/t92BEjWHpYW7X+NrAji9iu
         atCfES4bwOa76ZNury5lfQPaQKSZiw15EvcVdCxX1YFYAZoBW4KmaJ762oPcuz5OfYDS
         Hvqy62cBAnNAeIOAQUy9phBiY8HuatvW9Dl/oVGeTakHpqMCGC6d4+hQwMyY4CA/Lcj1
         zyLdd6nzG9BYfH2vPDRPIShuiznP0dX6oVeau+ZmtkJoi847fKXnDvCl2euFh/jbYJDW
         +afue4Kc5+CPzrvXYKsaqGyVW0L7s43JRnQASOm5WXCcBN9h2A6O57ERu2XhUGzlyuLB
         Z9zA==
X-Forwarded-Encrypted: i=1; AJvYcCUOHpU4WvYoq23DKw+2TfZvhZRa1zPp/aV3oAIHQ/IThVvInWcnZ8LPV06so88xLWF6XZ/AwBoBZQjectEgwYHTsMxQlRLI/X1Y97BMTpsOyS6obA==
X-Gm-Message-State: AOJu0YxjKlBLmI0W/KjVSFYF0/nlSNy3e7A+juLdKsPnE+lmaOB7bLZW
	zOM5VMEEs6gxmJnlOoK0W1t+8LJBe4W8Nca7jjWv5oV8ec1i5kBPlUcHkRIDlYx3wpQzuG50jda
	r/1AkMM5kG7hoAdVdm4nu6QyeAwu6tW0PRUEc84EVqBzOSKHkxgN5vAtOGjwrx/HOgqd98afBdp
	riJWDfig==
X-Received: by 2002:a17:906:c79a:b0:a58:7192:8fbe with SMTP id cw26-20020a170906c79a00b00a5871928fbemr405954ejb.60.1713793334605;
        Mon, 22 Apr 2024 06:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA47jcvWTws5tkGi6B6q4Akc3azNwMQOwXlm+C/+DX0XcvHM7e0vNZiFufhWREV6jXq2+QzQ==
X-Received: by 2002:a17:906:c79a:b0:a58:7192:8fbe with SMTP id cw26-20020a170906c79a00b00a5871928fbemr405945ejb.60.1713793334372;
        Mon, 22 Apr 2024 06:42:14 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906058d00b00a522d34fee8sm5759717ejn.114.2024.04.22.06.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:42:13 -0700 (PDT)
Message-ID: <3db76d62-114a-4703-ac88-8e1f26791a36@redhat.com>
Date: Mon, 22 Apr 2024 15:42:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: samsung-laptop: Use sysfs_emit() to
 replace the old interface sprintf()
To: yunshui <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
References: <20240419064106.2396705-1-jiangyunshui@kylinos.cn>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240419064106.2396705-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/19/24 8:41 AM, yunshui wrote:
>     As Documentation/filesystems/sysfs.rst suggested,
>     show() should only use sysfs_emit() or sysfs_emit_at() when formatting
>     the value to be returned to user space.
> 
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> Reviewed-by: Ai Chao <aichao@kylinos.cn>

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
>  drivers/platform/x86/samsung-laptop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index b4aa8ba35d2d..3d2f8e758369 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -661,9 +661,9 @@ static ssize_t get_performance_level(struct device *dev,
>  	/* The logic is backwards, yeah, lots of fun... */
>  	for (i = 0; config->performance_levels[i].name; ++i) {
>  		if (sretval.data[0] == config->performance_levels[i].value)
> -			return sprintf(buf, "%s\n", config->performance_levels[i].name);
> +			return sysfs_emit(buf, "%s\n", config->performance_levels[i].name);
>  	}
> -	return sprintf(buf, "%s\n", "unknown");
> +	return sysfs_emit(buf, "%s\n", "unknown");
>  }
>  
>  static ssize_t set_performance_level(struct device *dev,
> @@ -744,7 +744,7 @@ static ssize_t get_battery_life_extender(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_battery_life_extender(struct device *dev,
> @@ -813,7 +813,7 @@ static ssize_t get_usb_charge(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_usb_charge(struct device *dev,
> @@ -878,7 +878,7 @@ static ssize_t get_lid_handling(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d\n", ret);
> +	return sysfs_emit(buf, "%d\n", ret);
>  }
>  
>  static ssize_t set_lid_handling(struct device *dev,

