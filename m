Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874233A256C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264273; cv=none; b=ZBoUT9DCqZdbA7R50rVoiVW6EKnUMP7eK0jUBMrFar1nlGds2YqVFcQ8O5mnmLGXslPp0B3vVrGPTYrxuZLaZln8BN0/pFD9r1omhEzzZ18DtEil9JsKzsT6uepqYbVOc3Kgne3/d+Af9Zi+BhtqRe8dkfp3KPN+JZBBAjs83yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264273; c=relaxed/simple;
	bh=4mBQzgtUilGm3j3LHtdoW6iuQxFcKuqX7R8vzQ1OZhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rg9hUndjmPMwprwlxaI0ildvoFptZDWEclokLrTBOwEWv5IgjtmGR264KSu0ZDu6Vo7bM4meniWiJtxBMGgrfTKKSRDV03pf/khnV5i2egt9g/0bsoQhZDsy8VB0T9T5O7OmU7SLvOysgIwK+mdNii75tFqs98LwFoSAF3tKTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ptbK9yTl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptbK9yTl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1713411f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779264270; x=1779869070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0EryyNkSEn+Aox11/sMGRRYM7e36plfJffBsTvhT6Y=;
        b=ptbK9yTlcnU4nVZvTRXXUOIjEJ59WqlXiAihJowg7SEFV4PwfBsr5M3ktBXR4CWIOB
         XGgAxw9T6AfPCPw8tnx3GViQSbEBo41ThApiKaVoWr4Ge0VX5KG/SiN+zlnatwa8LlGa
         kzIDePf++R5pyAVchALk0rHWV0TzHxx2GyICiD8dWZc0nMNDGc3WiBEUe2QOe03BfATp
         SUu9eocjte+eXBAUL/yd3yFhvZIr+0IcY07l66Reb+IqRMcvqgAnWa8ckyQRCTWxM1At
         Aa/mVN+dehqGeu2esocVNSvudBP9JpeKcdpw/EaxmGe+0tHJ8AkgK5K8DTY+Cc6FTinF
         WIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264270; x=1779869070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0EryyNkSEn+Aox11/sMGRRYM7e36plfJffBsTvhT6Y=;
        b=kpMm882Ro10nleLBecw9/iHgG3Jbs7aImj58OTXOkGSMamu1Fx6FvE1YbGKQ56GfRR
         cgTrcFC6xQQ7tMasCY5GPCk+gkXE1xHykrYt6DeAL1rx8Z8ioC7AOkc9yBGXpclTwT4I
         ugP/8vFJcn4xQ7XNoZxTCwEgpy/zv1Q06LKBWTb0IaMIWxgPq62FS/0uwBdd8tizzsJp
         qxgO8kKR78/0RW694Z0M8miJg2LQ+H1D1MGdLTDDHlnIsoTuWyE/2VkrEFYFBc4XOANh
         1XE5PF4UXG0903iFJH6bMpJGwXcpJ2Odp4Nn7QG3WAUzE5d2OtBkDkScwk1/1WdwCRbI
         vZ9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8uzTu7j6CihEYLOFnL9hOwR0J8qjVW2EzzInBBBDDTqGmboqYXHrM3VTxxXzfW7RrPIqeIvvCnJTyMlpYIxRfkhr2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RJRp6R82/mAnmdulSyQng3rCS8X348hE6tpmPDZzLfNyEfbZ
	2/W7GGHaNhbqE1YPc6LYfiDjeMcO6essqYATTv6/n/3yk0/guOkzipLebvvQWV1MZao=
X-Gm-Gg: Acq92OHfuUJJySoPWekXEZhzTe4w6u8Q2d3UKNyj3k4OLdQKOhs5Cjjysl+csrwvimU
	8gArlFLHPNwI7eVmjddgDq8y+BJjqPUZppRgzgkoXepsVrek8usVp3hMk4aRyUJmhDyOee3tMEW
	57ILmngWuQpSOE9PlOtayd/yW2+eNo/rt+NgxZsS47w9aGL1sJDDhyJjei88Ir5Z063FuUst6Nf
	RCLXjz+rTRriw31TkccLg7ZbdfGBJTDdmKS8qbuQXU8ZeqmxkpLMOss52D2rwVNmt7EMJpkkXel
	DzlLn5SEc6HyDuhNkay2Sc3WJPJCJUzdWMLaFX9i/2Abc8HA/iSOO5hIfvGzBLMNDHel8DbCQTZ
	7hwHELcwSEgsYqWHRb1c8W7wYElzesbLLcDwBrA1QMLMeocnNYrXaUFYAo8F4fuK+qlO9s69np+
	U6UBm4dS+/6WiNx5oUiDmEOwU2hUYFfMffHdU=
X-Received: by 2002:a5d:64c6:0:b0:43d:71b:204b with SMTP id ffacd0b85a97d-45e5c5a518cmr35400637f8f.39.1779264269799;
        Wed, 20 May 2026 01:04:29 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.255.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0f72sm55299581f8f.25.2026.05.20.01.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:04:29 -0700 (PDT)
Message-ID: <2497c7dc-2325-476e-ace5-1fb2d9aa3aaa@linaro.org>
Date: Wed, 20 May 2026 09:04:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform: arm64 Use named initializers for struct
 i2c_device_id
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519144341.1589034-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519144341.1589034-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/05/2026 15:43, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> While touching all these arrays, unify usage of whitespace in the list
> terminator.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> this patch is part of a bigger quest to use named initializers for
> mainly struct i2c_device_id::driver_data to be able to modify
> i2c_device_id. See e.g.
> https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
> for the details.
> 
> This patch here isn't critical for this quest, as no driver makes use of
> .driver_data, so apart from the better readability this is only about
> consistency with other subsystems.
> 
> Best regards
> Uwe
> ---
>   drivers/platform/arm64/acer-aspire1-ec.c      | 2 +-
>   drivers/platform/arm64/huawei-gaokun-ec.c     | 2 +-
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 4 ++--
>   drivers/platform/arm64/lenovo-yoga-c630.c     | 4 ++--
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
> index 438532a047e6..08d0b155a197 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -532,7 +532,7 @@ static int aspire_ec_resume(struct device *dev)
>   }
>   
>   static const struct i2c_device_id aspire_ec_id[] = {
> -	{ "aspire1-ec", },
> +	{ .name = "aspire1-ec" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, aspire_ec_id);
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
> index a83ddc20b5a3..80a8ba8b8dda 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -795,7 +795,7 @@ static int gaokun_ec_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id gaokun_ec_id[] = {
> -	{ "gaokun-ec", },
> +	{ .name = "gaokun-ec" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, gaokun_ec_id);
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694..e7acb66b77f2 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -637,8 +637,8 @@ static const struct of_device_id t14s_ec_of_match[] = {
>   MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
>   
>   static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
> -	{ "thinkpad-t14s-ec", },
> -	{}
> +	{ .name = "thinkpad-t14s-ec" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);
>   
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
> index 75060c842b24..a8600a977fbc 100644
> --- a/drivers/platform/arm64/lenovo-yoga-c630.c
> +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> @@ -238,8 +238,8 @@ static const struct of_device_id yoga_c630_ec_of_match[] = {
>   MODULE_DEVICE_TABLE(of, yoga_c630_ec_of_match);
>   
>   static const struct i2c_device_id yoga_c630_ec_i2c_id_table[] = {
> -	{ "yoga-c630-ec", },
> -	{}
> +	{ .name = "yoga-c630-ec" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, yoga_c630_ec_i2c_id_table);
>   
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
