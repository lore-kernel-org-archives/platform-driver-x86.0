Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11C18A959
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jan 2025 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458572; cv=none; b=C4ZEa3Z1GyBgSiQ08/EWftvkvjja5109OIrRyhGDfRp55kVKQuyhqw6yxkhmN5dveJTJEWCgg0Zq5GwxuRkXRHZ66NqzrVHHMvoCkYMSwTLXQEr/SG9noyGyPJuIo0i60fcE9tbi8m41L5/Vs1FrT1EWmn+3ye/9hper57K0k1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458572; c=relaxed/simple;
	bh=nbxjV6qH6DUpf33ktiDfaWFETdM3EiHJyKTeJVx0V54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOaItekBQnUIYVjH5xg0ACCdQ/ca0kD0JzeG+0KA5jyZcsroWnGyVrY6pnMYfRkewU9JLh/nYWf37/0JX18vP2vH66MSFq1Vwbs3sE2WnvnekAmiu4i39ySc08edJr4PJXcKfX48qFYOMVUNr7u141h9kXnuS1XEbHL2fpbh3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXAqpExJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXAqpExJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd730so10848355e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jan 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736458569; x=1737063369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9HPQZCVUAnZ7shlzpjc+vwRiCC2uUgOzI+dVfgh5t0=;
        b=qXAqpExJbMxlHiQiayDWaVGxG6w3ALvCr+w65mAIMPqeM5pOeQ3WtmN7pb7fy8ucL0
         OnLMUSK5sW1ZxT2cF9og3ZIIn+Xt3tFFHWd4nkl0jYsQw2cY6V2m3GBL89pQZtT1as4K
         q8Ehdtc2KSgvTHGpLBS8AtUIaULFmpl/wwCrgtHItjhNzVlt/yDhJtltDg7qYWGucRuE
         +tzb54JIN4QowCcTEV0HuSb1ZGbihh1el4AvhJFycgt2bSF8Fgv/vTEIx0W6RjpkQAnm
         aumxc3UOx9fhr263SspdGLzoy2swZtWblV5jmWphmu8k8396PAIg7ec+bAKZNlHpZJbz
         76JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736458569; x=1737063369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9HPQZCVUAnZ7shlzpjc+vwRiCC2uUgOzI+dVfgh5t0=;
        b=b+YPnBtyMW5LkRRxfi72zc6wdJtQyAW7pWwwO78GzV2B+O041hNttJaAimMDy1Gd0C
         yBGLonnb7P5HWRNC6ejFdsNiLEGFRXA57/Fyy0zZCnZ+5m6EV0RMuMgtPGT3pCSUKmEc
         wIti0MXSxxRYFP6Axo0SQIxDtKdHQoMPt4Z7TnJfhwukmQKx2ht+j82aaOU7Z/88jmrr
         qe6bRK+OtwnjmfxAZS81a/+xjq23mwnjUsIgyPClVnsmJmPJby+Fadd1jA54lfpvQ0nL
         6+/biR4lLu8beJqZjIIbbQbY9MoM7xgHN14od2Bd63Ukn7pUUxBbKeBPUfwuFyvsgPPc
         afgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjCOddNxs7phtquCSwKTaIH/QJl/RICI5YG2sqQKK5u2qiYzZhZWjc3rHZHHFhzScsVr4w0STGQdLXelmlOmEE4B4K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6MwLvYNknfD0xsDHtNmdE1nQqcFsc3+rUnI3TldvFX6mg0BVZ
	21FMi6peuwaG/gnYxmzBGpQmGhlaKcmR0iy2zyuF/6jZ2ZZEsdF4I5ihpza6Uxw=
X-Gm-Gg: ASbGnctHBDnxoS7va9oDlQzDTispxsX2mgDNOwzAC/adchZagrAQc6LNjtDjUL+SjuF
	iV1jPJrHvmemLOeeHKoC35c1DiTEmcz+32N/2HMJASFpt9oKJGOd7svPU8xnwnDrwQ/XV0VlNfM
	DvF0RRz4OOJhqtFH3SUXDz2L4YfAkR5WNUZj2ShbjQNpyQhGRMNX8UA72ojZBaPFkme+cgRxyVl
	wE7jbFp6yQiNnDrJlZ4Q3H5L3Nykd2uXguS55iTebW/RJIbyXjugqYkYfg1du7vMMKBGKaXGHro
	NRIUu2lkqrTnD6u6XlVU
X-Google-Smtp-Source: AGHT+IHX1eZQUCDD13aWYdJo9a1TwhTHPCfOsRihU3pob2ooEDoyXQhIkgJP+CnttpbBtjp0u3RDiQ==
X-Received: by 2002:a05:600c:4e92:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-436e2707f4amr75406735e9.29.1736458569346;
        Thu, 09 Jan 2025 13:36:09 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38ef6asm2845178f8f.60.2025.01.09.13.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 13:36:08 -0800 (PST)
Message-ID: <6ed0eb0c-c31b-41b0-93ca-c6581249c7b7@linaro.org>
Date: Thu, 9 Jan 2025 22:36:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thermal driver with safeguards
To: Werner Sembach <wse@tuxedocomputers.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: rui.zhang@intel.com, Hans de Goede <hdegoede@redhat.com>,
 Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <41483e2b-361b-4b84-88a7-24fc1eaae745@tuxedocomputers.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <41483e2b-361b-4b84-88a7-24fc1eaae745@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/2024 15:52, Werner Sembach wrote:
> Hi,
> 
> given a pair of a temperature sensor and a fan, I want to implement a 
> driver. that allows userspace to directly control the fan if it wants 
> to. But have a minimum fan speed when certain high temperatures are 
> reached to avoid crashes or hardware damage.

 From the userspace, use directly the thermal-engine which is currently 
under development [1]. You can add your platform specific code in a 
plugin while the thermal engine will catch all the thermal events and 
pass them to it [2].

The thermal engine has a configuration file which will setup the thermal 
framework to be woken up at different temperatures.

The thermal engine will be proposed for a distro package, so the 
platform support will be automatically supported.

Beside the trip points can be setup in the device to act on higher 
temperature.

What is unclear is how the fan is managed. I suggest to have a look at 
pwm-fan.c in drivers/hwmon

> e.g.
> 
> - temperature of target die is 80°C -> fan speed must be at least 30%
> 
> - temperature of target die is 90°C -> fan speed must be at least 40%
> 
> - temperature of target die is 105°C -> fan speed must be 100%
> 
> - temperature of target die is 110°C -> device shuts off to protect the 
> hardware
> 
> Would the thermal subsystem be the right place for this to implement 
> this protection in driver?
> 
> It already has functions around periodic temperature polling and trip 
> points.

[1] https://github.com/Linaro/libpm/tree/master
[2] 
https://github.com/Linaro/libpm/blob/master/thermal-engine/plugins/te-plugin-example-game.c


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
