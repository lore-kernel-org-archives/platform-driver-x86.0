Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C210942
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758874883; cv=none; b=FJHYvoA1sg/gVywXvMe+2YSp6E2D62Tvgo2yvdU4LO07HZconXNWc4aWzxCsBEqr7yUVETsQ0DOEQHTx8iINUqgezsSAKURJMZG++ZXMfhLDjGozjQaebAGU/h/3iXTFMyelJFvfXOfgFH6vNs08NSX0IfoZNufoRBjdhukGHwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758874883; c=relaxed/simple;
	bh=HNadxYrXKBxG+es9Wwf3kkJTuTewMLB9poqxJhntsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2Z0tUNLH14X9IPcjUeji47irYJA3x5aLTO3n0qW7OHNZyTM4V8LEt0TaxahuJ375/zhZjJvkDLzgtdzWnP4tOXwviG6Fb4eTepc/GsP7MQBkU5SAhKbnGDVJT1CKfiCOwPXSDdPDf/KbOL1EYItH5LSlUec91Ho7Q2VzA7XGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAn9C7tE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAn9C7tE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so1497951f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758874878; x=1759479678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtlOdHVQKyDFwlgLpYjWciIJdDWqMWEqc8oTUdiH9po=;
        b=rAn9C7tEShSkFpqpEGjuWwOa57MjOlje4O1s1JeylKQvWc8qz/t9NC/4aLns5DwGTW
         TBPK1F39Syr66HI9D1gKpkoKmqaOyZXrorikh5s6W8pejbRMDP1xSod4DMs3DOBKToc2
         xBzx8spYZS7iK09f88WN1+q7RcEx4lsLV4sal0Srfj7MgQtWawqGRw04kaDR8n2mp0AW
         ROLqqHC0CjILgPvH7jr/iLEh9Wf82tsd9B96ap9654TjX8oQph63lGlB+InPxmD/Uez1
         KHm+itP4VOxnLRxoHmnpEJzr9znemCuwmpQQY7LIxELvzOqLD6m90NvizdaWt7g7bPHB
         7jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758874878; x=1759479678;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtlOdHVQKyDFwlgLpYjWciIJdDWqMWEqc8oTUdiH9po=;
        b=cCLRPM9dVkW2r9t54z80JP/awVhUMlU6KsUU8i4i44FlWDdqaM4QdE7XbhoWcWgcNe
         CRu39kkuagk8pe5SZ/SqvOTC7xkDs/y0gEE9YtIUA4ufCDaQEOWY27EIH6fAATArIip4
         nirBDSh43l8QgAYkyoNPsD9/QnckmoICzFDfmoILeoAhduJ1eOLkthpFTnHgx/jCmXgq
         p7vNrgdL5xKQYbAC7TJvQp4wtlsUH1TmueORduyvdo9HnJgtif9+RLikGvMTKRiywsSO
         VEiMYFZIjQhICLl0KIGRLpMN7SWWfNqE/oADCT0nhUSVQH1sPLb7eKGkqMEg4ef5hY/D
         ayhQ==
X-Gm-Message-State: AOJu0Yw5Xd96BwRkSqI/nKa9E9rqRVBkPJEPBeDO6575ZgLMEgTh/fNz
	3+PBSjzPSD8fdDchfKDvI7ZebRxeedwS4okdkspVyZJY80HZWXc8DgZWttb5zFQXrv+tBYX8eCQ
	wEzgwiYU=
X-Gm-Gg: ASbGncvvLI5um1uv2SZ+3I0ACsWRMsTKcRFUuh3U6kzV10Lfzq+Wd9tBFfehWWutuCB
	2CzhVHWzUhUqyUXLg/cgp+i+3vqhZXAy+F7yBs9/ekf4uUMN7EIfXoZ9jHKGnBDnEdO3UwcXghE
	UMQpXdwKCMGz7/F+nzyBsmMhrXqX1ALpKppWhHDSPeIG/gfrKtg0ygKAhJV5CfxYw9pmjl3hUd5
	LBur/rBA/H0S7Erf+Id2E4xEl24Nt2N1j2hMhAb8WZmgTnFSbabjJG2HM02+7zOfxCrY/EH5isl
	42maHZRXL2FCkfopS5BBg4bk0kVMmyDyHzX6v6Ta6Ex+c4i3WJMZ5Vo6Lsrg5MiGQcUZ1gg60IC
	iDqjROebV/UsfYxUQo9xcTIF2UTL8GD+sG0C+glbF8NIZ+0hZdU7n91+foaqMfhJDUnm+yPLEqm
	xhILN5j5WguITXtBEMO1LeYVA1bOzSsfE=
X-Google-Smtp-Source: AGHT+IFnD4bbmtza7gIkFTVOHPWGUxGK2GEJRJeFtGzkAHojXdJuptg+w2G7NqbWxgBQIDg4CRmB8w==
X-Received: by 2002:a05:6000:2308:b0:3ea:c360:ff88 with SMTP id ffacd0b85a97d-40e4ba3a4e9mr6134848f8f.31.1758874878274;
        Fri, 26 Sep 2025 01:21:18 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e3bdsm69822625e9.2.2025.09.26.01.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:21:17 -0700 (PDT)
Message-ID: <2c915fe6-a6c4-4814-a7ba-8f9682775951@linaro.org>
Date: Fri, 26 Sep 2025 09:21:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: thinkpad-t14s-ec: Convert comma to
 semicolon
To: Chen Ni <nichen@iscas.ac.cn>, sre@kernel.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250926014345.651176-1-nichen@iscas.ac.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250926014345.651176-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 02:43, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index f721763e13cc..1d5d11adaf32 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -401,14 +401,14 @@ static int t14s_kbd_audio_led_probe(struct t14s_ec *ec)
>   	int ret;
>   
>   	ec->led_mic_mute.name = "platform::micmute";
> -	ec->led_mic_mute.max_brightness = 1,
> -	ec->led_mic_mute.default_trigger = "audio-micmute",
> +	ec->led_mic_mute.max_brightness = 1;
> +	ec->led_mic_mute.default_trigger = "audio-micmute";
>   	ec->led_mic_mute.brightness_set_blocking = t14s_mic_mute_led_set;
>   	ec->led_mic_mute.brightness_get = t14s_mic_mute_led_get;
>   
>   	ec->led_spk_mute.name = "platform::mute";
> -	ec->led_spk_mute.max_brightness = 1,
> -	ec->led_spk_mute.default_trigger = "audio-mute",
> +	ec->led_spk_mute.max_brightness = 1;
> +	ec->led_spk_mute.default_trigger = "audio-mute";
>   	ec->led_spk_mute.brightness_set_blocking = t14s_spk_mute_led_set;
>   	ec->led_spk_mute.brightness_get = t14s_spk_mute_led_get;
>   

This definitely deserves a Fixes tag.

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
