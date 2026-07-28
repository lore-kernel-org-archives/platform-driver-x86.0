Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D363F7873
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237934; cv=none; b=YIQdbPzCPk8vBmTCYc9MBlkVQeJc04WPxNPW8O9xBrg3G1VuHKtdCIZPjPuyqUU2gQZH3EXu8ZpgiHPgZnL88L06IgEgrSvbBNr1bbHM0AEA2/IQ04uVbD2h1dbb6tNn0gABjqSqRa7Sy2UAw+Gw231KuvkFYnNzo2aLPMqrPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237934; c=relaxed/simple;
	bh=GRvQok03sDO5u5bualr1FcMN2sXMmI9o2IF5sy5sCaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrKyhP+mqp9MaPU0XcX9lxaMfOMiD+/2RFF3uJfNdvWAy9NGNx1ZaQ8lbOOi1xwPzx+OowiMtKTDG8ubfNMfdtwaFmS7rfWHz23APlhGeu3A6pAt3N5WIFeTFBKkmLO/Tx6dge8aKwJ47CfZwoN2lPKvpFwnBqSdPEL0po5ARYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTtc247X; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTtc247X"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so5740034a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785237929; x=1785842729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKk4D5oLmF34jzx/xObJOPUPk5RaNdaAZHJaNSgH2SQ=;
        b=RTtc247XBrsk/EULMGTbhMCeg/KEndiQmaKppeCd2MeiPbN3zmE1IUpqA0JxtYgftq
         l9zCwk7qQ3qLkGczkNmKGOgKj2qCvMQhRhExUNpzIJrnjJFsQJ56TTjEnuGCDJRIqLZV
         jLP7PiSoMkJpkg7++bwIcKqCk+2dwBv+n6F+Ycofr2dJdGAX0G5X6hbqu3MA68Uah8Bg
         Ar+DzQyWKRatO5SOl9M22yVCwH5kfJciEhFN2K7hcaTDTrDaiNS8uwfIg7sK6muBG9L8
         VKbjHUEYdWjaPE1b7bMw0dhv64yw+SN64R7wQje9I9X8YEVqGgHsmHGgt+AgTzxOqOfJ
         1C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237929; x=1785842729;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKk4D5oLmF34jzx/xObJOPUPk5RaNdaAZHJaNSgH2SQ=;
        b=q0gz4CrcEbOQ5BYkqrK/XxPEKKNBU97IWSR+xz2njwkhkQ8hKk0p+xtEtONW+e2PSX
         UaFEWqGzX0CzRpXWtyGBUYsXyW/2vAmP58Gtf9xBBYQYIPL1Aufw8dVwDWkZE0W9czjv
         +TV937yZR34tQVTgJGgTk23bfWOiCLi3ijHv4I/53BUwDwRr1MZgALQWCRiWkl7QNhjV
         0Y9QYRmRQSKxEbMqtDfx0VFUo+HlEsF9cUXrKiilfXtfnTPav8HH8myEagROrFpF5WBY
         HHPeZMdVer36gL0e3QOMqZp4ZWwoNmW5cvYVVRDdPf90bt3yHILAOCYeLUPaolgy1TTL
         Vt2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9cizJkeL9k9MbiqKGlzSI3WSn3yStNyG8mrWSYLtuaTIwDUnderOVxt1gC5F6MMh87AZsBYcM5gTclZU9ulImnYG5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgaU7FEmPqrcwlkZXedJQf1fcnRJp0MJ0M0k2ykcri4SVuH5U
	IkjLRYyQzMIIJp8Q7wnSpjo5aYfsVL8eBj+B1PBeWD33v+HIlshf38/pQr5QdwmVZjQ=
X-Gm-Gg: AR+sD12ebxybCqWjdPLbKFBPFhtFZVkxCHDG3YhfjDa58UWa0A+PIqY2bbrS2ePpzIc
	w7PcVSqQ6sRPY/c512MtgHxaxkdWn1Zn8e7H1ruivoEd9R1SbxL8icTqe+hVXURMhPaKQWf0A+x
	Zmh1uLbuk/QJo/k1ytx+e5o1JX9gwjf2Iy15Exq6O3+5q1oQlRj+y79Aig6Z9wXR2YrWxtK4TZS
	0IwoK9NZo9hrw1GUoWx0mAUPlQn87JEL1OxkA+8CIbf3t/lmh4lQrvni8jX/ayfZe/QOzPKe2su
	sIbT7NwBFobuhwFdW9jE0rHv/dirQY2NSUhc4KBxs2cGZVpde7LL8WqNFot0shVlPTERGQphiS1
	nCRGu7ZQVeeI8ievpNN8M/7Afz5wzctiGIRkENK8qSVXLq0mvSidJhkQGnBNq1Hx6E1mhWFtGvL
	d2oWIQ6+e/yNz5z5ftMmkVOjWu
X-Received: by 2002:a17:906:9f8e:b0:c16:e3b:7d6 with SMTP id a640c23a62f3a-c1f72178947mr99632966b.54.1785237928716;
        Tue, 28 Jul 2026 04:25:28 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c9030dsm751652266b.36.2026.07.28.04.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:25:27 -0700 (PDT)
Message-ID: <21d292bb-83af-4bd6-b76c-005914d9a080@linaro.org>
Date: Tue, 28 Jul 2026 12:25:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
To: Linmao Li <lilinmao@kylinos.cn>, Anvesh Jain P
 <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728111924.4106898-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 12:19, Linmao Li wrote:
> qcom_ec_read() accepts short positive transfers, while both callers
> unconditionally consume every field in their fixed-size response. A short
> transfer can therefore make them use trailing stack bytes that were not
> returned by the device.
> 
> The first response byte contains the number of payload bytes, excluding
> the byte count itself. A complete response of resp_len bytes must
> therefore report resp_len - 1 payload bytes. The existing check only
> rejects counts that do not fit in the response buffer and still accepts
> an incomplete payload.
> 
> Require both the SMBus transfer length and the EC-provided payload count
> to match the expected response size.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
> The resp_len - 1 requirement is based solely on the response layouts
> documented in this driver. The EC specification and hardware were not
> available, so please confirm it for supported firmware revisions.
> 
> Compile-tested with CONFIG_EC_QCOM_HAMOA=m.
> 
>   drivers/platform/arm64/qcom-hamoa-ec.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 5ca7308c6077..4d2ad042a7f8 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -92,8 +92,10 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>   		return ret;
>   	else if (ret == 0 || ret == 0xff)
>   		return -EOPNOTSUPP;
> +	else if (ret != resp_len)
> +		return -EIO;
>   
> -	if (resp[0] >= resp_len)
> +	if (resp[0] != resp_len - 1)
>   		return -EINVAL;
>   
>   	return 0;
> 
> base-commit: c5e32e86ca02b003f86e095d379b38148999293d

The logic stacks-up, interesting to see if the hardware produces blue 
smoke though.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
