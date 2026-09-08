Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F3369217
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 05:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845109; cv=none; b=MlhZzksa4dMq5o3c5BZSRGgTbDVAYSYa69EOGshQqnr+LA3obQyJHmx9VfQX1b65MQZCyp9M3jJHLzwXKIFFiK44vvMmwNVWmfxNdasMPUmPg+Aq3f/yq7qg0IC6y3W8/MKdArDl+sO8vk0lMMEdRSNx7gxxRWg6oGgjknmgvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845109; c=relaxed/simple;
	bh=yr8hbTbeNs8s7he/80wXBeIAySSnmo+j47sPdYXRQRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2vDG4I4+XzcXa2s2Q6cNQq6OZ98863Z4ioXdqrNAV2dH4UUiid2IRS9h43u6+DdV7P4MszH5yOiIhY1a4hXD+BDMg3s1f6gILeQb4ctzLOD/ReCl1vv1+Uc114fIhiiVBkEjUUFMJVMuFO/O/5z5NaUXr4i3Bybtbk9/ALo/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tD2Leewd; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tD2Leewd"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3359003a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 22:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845105; x=1789449905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ym3WdTKLeGIRO2xfNfe+mh7R6C5MMc8hhWmJN+491nc=;
        b=tD2LeewdW73B8Gp1LgTUyYQEWZh2PcoWYwJpqUQUoIrp4MfDf0fGeq+oKiGBY2ZQ5w
         PL05/Q2OLSc/NIzCK1u0N3DT1/HjqYwnJBLZrl0vx9EoPSPrhDLF5NwVM+0Ukkgz/mba
         5R1WoKL5+RekBfwiVufy8kxaygCZjSEV6+qj9/6ONuPgbkhL5Gi+UuTvXnzYVOGFT7zy
         wnI69pZeWGYcwCkS8xxkokJHXBGiZ9O5hvMIYUl/4sExe5tsBt/FkmTjDhtkJ1LVmcs4
         r/yX7l4sgiskqfes1tTVs8E1chjAO+VlD3EUSsHVNAionhAvoNm4PHB7MtKJLE2MQ7WQ
         WQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845105; x=1789449905;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ym3WdTKLeGIRO2xfNfe+mh7R6C5MMc8hhWmJN+491nc=;
        b=fm++znDluIAYzS235sQQHt/r6gArfQdPQbc8zn3eFaBPP9gBT4ugonMzpD0XXxvOYK
         6cv8FRolxqxsyESudXcoQ1lCNT7Wb1uoYmv4KHZy/9eGb+lrMHo6Gs8Zl0XqmiKS3PAu
         QfZEAOSuU9sfL2zF58VbpIZyr4mTu/1AIC+B2mAuIh8o+EEv2t992QzqMW1KAs/j//Xs
         H2Jxm9DlRNpdq5s6s63cwWiQAl47vdP+CWtDtjOjghFw/elDqCvxJK2+eo14xuWSk6G1
         rBzqfiE/rH/xgiHUkaMFaDpvPKtbeCSO4tipqCG2h/oQZWU500xcCirWq4RQrD+ovQsu
         D1cA==
X-Forwarded-Encrypted: i=1; AKwUvBxZVDEVOtdBAT0oEJghdwjc2krF7R4MUpvWM+uRviR3fiRIn2PJe0nJmxlWQUWAwRx8jZj/3eMySM9s/0j99iGGypXU@vger.kernel.org
X-Gm-Message-State: AFuF++lV8kH+Ngw9iPpB4VvXXMRUrM0fHZDjaIplRTl7iOuCLFdJGzmG
	s9GEKp2Lt0Nrcae/7xXKdl/Ao1f3vHECWjyzhDTdOk39SLMNY+H5Uvh9
X-Gm-Gg: AYBFou1fFyYJel/Ma2P/r2DT8dysubE7Mj+1uJwbWJbqyKJgQ0zeIheQS5phEpYWRbD
	we1I8165OSsI0R953MiVU8TQQs74bFlolPFlI4mAOuATTS7ak1naSd6hNxLLBwjPLYI3l3LfEN7
	ckLRQl7j8JgEHJQvtyXlkhKVz0dFOpEzGjwa41d+CRvh1j5MuUDi7AfLRE3vvTXZnMByo8+SnqH
	Lo6aGl2zTECKj42XWBVEG6oRukR3ISvolMlXer8nkCt+bcqDHTgw00/o6ZP9zOmJdAmg4fsDgDC
	fVvgglH9hQc8srTvvETID/TEUN8iMSdIJW81iDuX2eMeHkjdzcbaPhN656QKR6VdX0Zzw8nhHJU
	65Es1zBtBpCxDm38p8r2HwJ3ahSBvXY/Z7ydDrM4zm6WBKUzOv1a9qF+ZAyOPrvwTpSLMDhrDje
	LAhW/KT0n813MylSZU8KS+vREsq1276AgcVBaDQhn77G2ipUghmPGqJV5sMhQ9uGiOT6eiTfflp
	E9MxQ6I1pnEX6bJXq6+Cm/S9RTO/wRViV6zUA==
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr45563264a91.16.1788845105216;
        Mon, 07 Sep 2026 22:25:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm30807563a91.9.2026.09.07.22.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:25:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2169e4a9-4e18-4cc7-8018-3c9db0891334@roeck-us.net>
Date: Mon, 7 Sep 2026 22:25:02 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim 7x
 legacy sensors
To: Birk Skyum <birk.skyum@pm.me>, Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908015650.84401-1-birk.skyum@pm.me>
 <20260908015650.84401-2-birk.skyum@pm.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908015650.84401-2-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 18:57, Birk Skyum wrote:
> The Yoga Slim 7x EC returns an all-zero response to the reference-board
> thermal capability command. Probe fails even though its legacy RPM and
> thermistor queries work and firmware controls the fan automatically.
> 
> Select a read-only path for the Lenovo compatible. Expose its first RPM
> channel and thermistor through hwmon, validating the transfer length and
> RPM payload count and treating the thermistor's 0xff sentinel as ENODATA.
> Do not enable SCI, register manual cooling controls or send standby
> commands on this path. Keep the reference-board behavior and strict
> capability validation unchanged.
> 
> The transactions are documented by the Yoga's FC22 and FC29/TZ39 DSDT
> methods and Maya Matuszczyk's EC protocol notes. Anvesh Jain P's pending
> fan-profile series also documents the RPM query. This change does not
> include its calibration, LUT programming or temperature reporting.
> 
> Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df017ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
> Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>   Documentation/hwmon/index.rst          |   1 +
>   Documentation/hwmon/qcom-ec.rst        |  40 +++++++

Platform drivers are not documented here. This directory is intended
for hardware moitoring drivers in the drivers/hwmon/ directory.

Guenter

