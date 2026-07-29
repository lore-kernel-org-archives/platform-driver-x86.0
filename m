Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA93368A7
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290928; cv=none; b=nDgviHE6JHhiV1gsZUx3t3JpEtbnMzmimO1BYep+dirwQjVOgW+IlSvfUHwvinrVbEXoARatNLcbHAzfdQ9Por3VeSPPSaLGuEIDwmOhMvcDChA0i3jCqJo/LVc9oQGVR4FydZ+ghPJGtTCct4qPEq9+VksP6FYstNJj82Rbt1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290928; c=relaxed/simple;
	bh=roYhyZV8X4uM/O+75tBihxvmxW4jnEm0s3TSZL3MJOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndWXeKE4a5MekQTeMhTevciT8T3NJTYOJV/As1WRelrfcP9qwJBa6Hmfq5QNg/0RHbO1uQYO9+qJvg3615Rb7De8KEiG4FkuWrjOwW4nNIl/W3BMnba4vKvi6UpEYDWBkLZHfX0FS5LIhJ/fbJWm9EC7KMww44Vu6ANz6vm8fAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ad65iZVY; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ad65iZVY"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so4132856d6.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 19:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290925; x=1785895725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8G4pIhNG8aXKSlvoYcB/w186WkTgZyB4Tj6gt5d/Gtw=;
        b=ad65iZVYEfcnzTzux+tFtRPzH+LbJqo+OX+dkCCJnYjc+6M+cuxUxM3hk9YeidmUSk
         yI22BSDzVUgDh50xBW95zDSxJsV2jjCHQsrYv9UQqUrfCz6E2vhtmW5TLnmCAkSFmlYD
         85AjMSyt4eTzz4Sf0KVM1b2rKlzCirgsYNnL1mW6k9A6NkwH3d4PqKgAcRv33eQuzulz
         mj7VKL04IU3XsaAH2GDx2kTLmshI/TVxPUqtATjo9pPw0hUf5VLyJZduOjp5gSNovYWX
         fen7nR9+xkINcre8jd0UQbf0td8sVTHMgIfxlGOgkgUwN2ds2zc3C9biSIptvmtFsJfH
         g5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290925; x=1785895725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G4pIhNG8aXKSlvoYcB/w186WkTgZyB4Tj6gt5d/Gtw=;
        b=rIH+9CO7L6qmvISDFs7u0NCbnQ8AaPn5JsVI+I0724o7eVxMRcU12/52ViWI7dXIAC
         6FLJlLvOcMxFDXbWcTszfjBRWQjsG/RgFDq6LPgurwCbGO/CP0Arli9OxX+HSQCp3fn5
         xhEXB6lp+w/f5f/u1AhSqe8q86ciOuNH3iTvXPI6zTK6WYPoiAIuYvsvqe9NR7D/Qykz
         4d6Gnkcy9OOl3B8zE7Hd0awS4ySq1WrHSEAQAYa8qnB7TNTaz8893wvJ9GUH0rxdTeKi
         1lPD00W9mpNDlOEx7Gn7StvuQh84cok4U+ICWvABrXt1NaFM/weNSF7lcI8AcVRSss/z
         u9Ig==
X-Gm-Message-State: AOJu0Yw9zJexQ+L8sIgoDbIvU7JRmg9VHtMNlSunNl0bDOf0vXtxWrf+
	NvzSQeZXcxTbanSC+jXkr9cbwwkE3wZwbNCtB5Ddv8M5jSOC/wLLCvXe
X-Gm-Gg: AR+sD12LjR+xRHqjOifnmj8TcqCcYWhkBh6PWgTd382rPcpYS8SswHKXq7gCeip7j98
	BCm8nyfCN3ZR+67pAn6qr1wvhoTKA1I2w3p4/p/3CY9yiX8jfp9NkFW18lCcrdkNyPwoXfIMT3q
	UE3hVegtoerdwMOmorUiCMelTyB9k11w9IbpjGKP8mScrQ4l0ANgU6+mupotgvZ8pl9b5f1aOU+
	xMp2pkVUnvDg6Jo+14J/mBv/BK8gegnlhBxsHZEwuO8MEbjpqkakQy3zOKjYLXgQpLf5rKwKyRq
	0NxFf5Mf1AWKdai+Jvz3tsvVn5M/1M6qlcOsh4YqZjl5oy1uXmN2588MDjVM+wucw8mlnNQBD5r
	D7Zs10xy/ov7pTgNZT45i0tOYDwBnYZOgURfk9QWbFIp/VLonkl4XaXWfxdsOiQ881b5xyKVrFy
	QaFYah7uXXYdkMfrdpBDdTVcvXq1X2xzLQg1oJ+0zq6v5FbjDSrqscfVs9m3jkiDLtr96+IKi6o
	oWC2H0HSwP9AjpR6L3t1Pq0jEcOxeja99/opo8eD9BEGYc=
X-Received: by 2002:a05:6214:29eb:b0:907:c234:809c with SMTP id 6a1803df08f44-90817378090mr52884706d6.65.1785290925173;
        Tue, 28 Jul 2026 19:08:45 -0700 (PDT)
Received: from [192.168.60.4] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081db0ddd5sm13656026d6.0.2026.07.28.19.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 19:08:44 -0700 (PDT)
Message-ID: <a7ee7c9b-8d23-48ec-97ff-c0b9bcf3bb63@gmail.com>
Date: Wed, 29 Jul 2026 10:08:32 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
References: <b557e1f6-2072-496f-8eaa-d2899d1bded4@linux.intel.com>
 <20260718185704.3466-1-alexyeo362@gmail.com>
 <fcf57a96-b2ad-c7d5-0d6d-6d760b915195@linux.intel.com>
 <531e3c48-bb61-4741-8fe7-a2dbc213eb1e@roeck-us.net>
 <84b521b8-112b-4fed-ab82-e1e16d770e66@gmail.com>
 <635a0d22-8565-4c62-94d5-2cbaff308558@roeck-us.net>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <635a0d22-8565-4c62-94d5-2cbaff308558@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026/07/22 8:00 AM, Guenter Roeck wrote:
> 
> I for my part would like to understand why hwmon_lock() / hwmon_unlock()
> (or the hwmon_lock guard) are not sufficient. You suggest above that they
> are not sufficient and that you need the additional pwm_fan_lock, but you
> don't really explain the reason. You do explain that you need to lock the
> thermal access functions, and I agree, but you do not explain why the hwmon
> subsystem lock functions can not be used. It would be important to
> understand why that is the case because those functions exist for exactly
> that purpose. If they are insufficient, it is important to understand why
> that is the case.
> 
> Thanks,
> Guenter
> 

I have reworked the code to use hwmon_lock() via guard. I have tested 
the code on my machine and it works as expected. As a result, hwmon is 
now the primary owner of the fan.

I will submit a v8 patch with more details.

Thanks
