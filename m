Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397D322B70
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 02:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372068; cv=none; b=DPEKbpLIbNT2WnXa+aZgWcDhHpBJY70YvSR1004uibiLPU2fq0H7DMvG5IfWyqxcqN/KMlzZye/ScXU/6boD1A/+yr8q4nMJRdTguMtNlV222O+kHxFj1dwqM5/GmWTzG8Hwy74jVzUupQmty1JElobpP/W3XN6mlMpgvXQPhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372068; c=relaxed/simple;
	bh=lLd2spigPhSoEVLn5Yii/HGcit4KBo0/QvPAmXWV2cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rgvLErqrp4Io/l1djvgL3UP5bbMuU0VBJhwxnGJH/lLPLN81oRNU0+l6QMp8f/qXq7cIFRlxwNLiVG7z9JZJAVE6uVGbueZLZ4q1v2YyFjOrKTqMbx/aNBeEvw0pS7V3xpb5mrrsOpn0Zt8Q4uoup9hteS5m34x1RhTcS4NDOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRSi+fH/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRSi+fH/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430fbb6012bso2700334f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 18:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766372065; x=1766976865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aoXxLcke/jz6ypuNN6+GEIA04oHuH9eiqJKba8WL+DE=;
        b=gRSi+fH/+RPT/v9aesA+FTa4AANAISOxoFcrM9irIXDkzfNroXNfq1BYb+6uYwxQ00
         f1yWoNECJqtJphnp6N9/LIAr5yW/CyigELiBaf0W5y4aQrK9jRDS1vCJF3DtzejN+yRG
         GxrQs/VkKjSGj13j3n+gLySwFuRDZIbNuOkEIpBLPIp6+w5fjOFxIAyjTENaP1sn7OhE
         8VUMWx8QHU3AzizR26whIyra4kREcvV7/dtLknTrqsuppp6NCd++egJHFrC+Srz3kZTf
         iG2ebFf0yjB6IodmEjY5pu4rKcqfq1ifeNjEnUP1QHKpMpLqTNa3bkFxNQmJliyrmfOn
         dr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766372065; x=1766976865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoXxLcke/jz6ypuNN6+GEIA04oHuH9eiqJKba8WL+DE=;
        b=HIUPO6Z+K3xZx+3vyd11ePdVhGGeEY8aJMJ6m98UW0aTAZMohbIddEIG1OGxSu1cQW
         BCLgnanPa47iIeoKUujzeDIO6FBHz2XMC01o/GehiIPA9FhmP3OdRjxVlVapxSI1tQtc
         yyG/imvMi+Hyhe/W8zr9WySEonD+v1IaeBZE6Mb+soMW0BkSHzAwt9uJrP0DECwOtFRp
         ZvD2rcFM066x+unlHdplHgcsujLb8IvGEpiBwWQpArNo/XfVdWiYMQKkW00UQishaFKz
         N08iUOfiS6hChoSCPcU2ojVpH6KvmE63vTFNngyz7VkYqj+mWHg8vLRSxvtWyPdaLWcE
         AAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXyeJjb04cRQX2aXSl/yw+dQE2K6z1Fb/u0raDIhOSUFyDQcXCiY2kFD2Szcz8huzmvKsVauvUaTwlz1dL7P06yc5mz@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBf9C1SpwOzaMcFA+CyOGRI3PfY5WiQRXwYOCbYSXXpR+czm8
	cB29SlAR8jSGqixsrm8atA2lE2jc9cABt4mJNUxXmnz8spIj11hOOmaJ
X-Gm-Gg: AY/fxX5cIcq6GWwb5zgWv9p33MTFGw4MzcXQ90zue8xDcfjhi/O0ZL4HB0eQl1JLIjb
	0n9ufmReKJWOi6CFKlWgwNXYRQMJR3RH3N4TpDAa40zZWAaqgvn5dS2nor7/yY4CV4kdthmeS91
	lpmwqCYOtA/Oa9JZXhI2r69meXFuTkmEtMzIdrpm1k0sPf9t9m6LPwpNVStCImI+Xdr6IwKJlmc
	6mU3emk+agffipZT56uhd+9SUtoai+tguL1zerFTDVbinX7dDn/upppOaDE/dvWvSNtMwpx1cWh
	jWjbDH25BsPCqpG7dZ1zNHVwO8dvijuSH4+ukrycgswxWVFTriHbTr9Fd4d4bZKvuKL1BDym3Ar
	TMbdQQfJcE2wazZVdtdTY2k/eSEo1wiqrUHkv28nheU86ubr2Mh9st4vNKgiAX5yoaDPaIZg7XM
	U3lBzyh9yipJGkA4WaHoQjrQenKbsScv4xLQ==
X-Google-Smtp-Source: AGHT+IGoOtScBOfSUHRKdj8U98PoFqERWaeIFx/99QTj4WweHImh/324KnIxFxAfUUcshhS6HgrYrA==
X-Received: by 2002:a05:6000:26d0:b0:430:f40f:61ba with SMTP id ffacd0b85a97d-4324e5063a2mr9790076f8f.41.1766372065110;
        Sun, 21 Dec 2025 18:54:25 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325c052d34sm10234278f8f.25.2025.12.21.18.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 18:54:24 -0800 (PST)
Message-ID: <b02a7c96-9653-4ab2-ac4a-86d365af1a2d@gmail.com>
Date: Mon, 22 Dec 2025 03:54:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add quirk_asus_ignore_fan for
 UX3405MA
To: Tim Wassink <timwassink.dev@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251221210218.12274-1-timwassink.dev@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251221210218.12274-1-timwassink.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/21/25 22:01, Tim Wassink wrote:
> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
> management that does not support the legacy WMI fan control methods.
> Currently, this results in ENODEV (-19) errors in dmesg when the driver
> attempts to fetch factory fan curve defaults.
>
> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
> signal that legacy fan control is intentionally unsupported, as thermal
> policies are handled through the platform_profile interface.
It is my understanding that this patch suppresses the error,
while maintaining the current behavior in every other aspect,
correct?
> Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6a62bc5b02fd..eaa8abe506cb 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_zenbook_duo_kbd,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS Zenbook 14 UX3405MA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
> +		},
> +		.driver_data = &quirk_asus_ignore_fan,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "ASUS ROG Z13",
