Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3733C1B7
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413218; cv=none; b=d/UAttBODsuPjzmXvzHxLxGs7wAIGnnNSuKbs5eBb9iwEX4tfIOdb49Bi3Y6pexQiII/V8Hjd/9nWI2aLeaNJGNvvY1HNZzCo1BDSaGT14iLNOh3T/Qy4pHKVqjGswA2aKIzE6QnIeHk4Qzn/+hZBOkzF7JwwEYa/HOASnsEdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413218; c=relaxed/simple;
	bh=KAX9YQP5cGpxrtt3URBNcaKlaJp2vRWcwjDUMjceQ04=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r31/0rh9XC+l5pxPHU0p8NN+ry/MJp0ShnoFQSHHZud60OlfHkPa2vNrw3W0yBNO7WqKDken4gz/9Ia6r2EbJ2+rQJtO38Que0fX7yjsJZZwcNV+O5x1ZV93owv0cqnxra1rFhiy639Ng7xDqc4wBhhZZQnLY9Ln4S9Tgo0Z6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+J1MLd3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+J1MLd3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f236418so1231309b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jun 2026 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413216; x=1781018016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gm0KskA3rtBak3PjZ6QJxPkUshUw3fvUVnX0VQeFXO4=;
        b=Q+J1MLd3mVoryhDW/rZZiqaqty0rQLBBtrpjS0GHU2L9QVjqGfgXDcs47e/GOKPeTw
         V+RYNMlx6Wyl4dsOHl+f3ZCZ6kGV4x/r7zTsYnjO+2iwd3Kww5udE712Bg/5UT+Azg4s
         aXKeFqvX55OI18L5TL2b8hUf/8smHJMBtSgV5RyPgFllSdqvrPXSGPyNGQcV2gPRjXDW
         KjZGzZZ0FN5WJ1kNuPFALVv3zIjysK/ZlUkUGoFh1tJF227YMaVAtHwGIbN7Ag4YXpBi
         xlW9G2bVloNcNS1n5toSyzV+pZAm04MTBRV5lfcKgAJfdL1CwjMnRva4SEAVXHttEykE
         Dh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413216; x=1781018016;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm0KskA3rtBak3PjZ6QJxPkUshUw3fvUVnX0VQeFXO4=;
        b=VdZZkJFvMqvoe6OrXpiZhQbQWHdpmbheViBu7xu7Zkm6VGcDdFduqTOupBEYRTKAZQ
         U9LvN6p4Is2+qVjtWBmMBsnBFzY2K1by+c3/W+hrMqt2tL2+v1MfXh7Yrbx8saknMkeY
         7IFYAVMEFF3roQOXjlswPsHCWTIQyr54OcKwJPtaRdwZA6tVGYY6qaIv7X+evNErEyTK
         WRW0+XPMvPTltf2/WOvreqU1p7MJg5WAUfdgMVNKMK7y0Ciz1otCzyA2KWb3vxHkfkRe
         q1EEubcWs+bljciJl7GaCf+O56po74EMt5I1SMu0sbx8JvoTCyp8GqkeNGf39zPaMuZh
         nsNQ==
X-Gm-Message-State: AOJu0YyBkGfxYhTXPhHKA0PWaA+C/1YNiIsizrboX20uPeL2Ym3H0aPl
	8ncYafbnywtPOQ+7Ocj5upfkY9E062mnvvUKg8oggiOqNHV+eP377pvMldnei7+F
X-Gm-Gg: Acq92OHH4kfNjWAbo8hKXQk1it5kyOduW7xuIBcB9zG7hf7uFEJ3nN53TSJYc95Cyqc
	Zw4xe9mhlwgXI9/CBnBly7e/DGaLrrEimSw/l+DboO0PsE3uffcIaqn9roSwi+bnLro7TE29Om/
	E32ruiPqcampxJKJZ7zkMKCrOjK4G20vrMJcNfPVkmYckhCogtUFzagz2GWZkBOb4GfhSX/rhpb
	sbOUooWqg1CpEuvFgVEe7jq0NfHGrsn9KP6vZV2kGLvoSbrp6JSmPYsmVqP2DVfMsL2/Z0yiPLB
	ABdLzj3bNKNRGnIzQLpDQUsqxHC9S/cKyWt90TmnSoEY1eK2wwt+GX2PsuE1OlePmqjv7rNDHYG
	K0FL5OqoGAWa+gB4MfPYIqOrVay2Zp0ntHC7yDV96dSwuQPGtBlJayxAVjP8MB3kVVceCMfHx5e
	I+qN/LKf81hk9pe0m8aMdNVfCBh5hyUIvf8jFED7YjqcUinlJpfUuj4/FLnDPA4nMl70j41sXkQ
	gCyoNVggczjLBSpMKFgRPYMOOEWmqWsjYvkATF+
X-Received: by 2002:a05:6a00:12d6:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84282f93abfmr13157b3a.30.1780413216004;
        Tue, 02 Jun 2026 08:13:36 -0700 (PDT)
Received: from [192.168.1.41] (utm.nitt.edu. [203.129.195.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821d0sm97645b3a.28.2026.06.02.08.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 08:13:35 -0700 (PDT)
Message-ID: <49faacb7-3e01-4d01-80b1-4b939a904138@gmail.com>
Date: Tue, 2 Jun 2026 20:43:26 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ideapad_laptop: fans do not ramp up properly under CPU load
 on Lenovo IdeaPad 3 15ALC6 Ub (82KU)
From: Sourajyoti Basak <basak.sb2006@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>,
 ikepanhc@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <CAA7g7-S_nP+jPfi7pJKj0a0g-gKXMJ7+fMH_+v11JbRRm96b9g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAA7g7-S_nP+jPfi7pJKj0a0g-gKXMJ7+fMH_+v11JbRRm96b9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/26 9:00 pm, Sourajyoti Basak wrote:
> Hello,
> 
> I am using a Lenovo IdeaPad 3 15ALC6 Ub (82KU), and I am encountering an
> issue where the laptop fans do not respond appropriately to increasing
> CPU temperatures under Linux.
> 
> System information:
> Laptop: Lenovo IdeaPad 3 15ALC6 Ub
> BIOS version:GLCN46WW
> System performance mode in BIOS: Extreme Performance
> Kernel: Linux 7.0.5-1-cachyos
> Distribution: CachyOS
> CPU: AMD Ryzen 5 5500U (12) @ 4.06 GHz
> 
> Issue description:
> Under sustained CPU load (for example using stress -c $(nproc)), CPU
> temperatures rapidly increase to around 95-100°C. However, the fans do
> not ramp to maximum speed as expected. Therefore, the system begins
> thermal throttling after some time in this state.
> 
> As a result:
> 
> - The CPU reaches thermal throttling temperatures.
> - CPU frequencies drop significantly once throttling begins.
> - Fan RPM appears capped or insufficient despite high temperatures.
> - The issue appears consistently reproducible on my laptop and another
>   person's laptop.
> 
> Additional observations:
> 
> - The issue persists across multiple recent kernel versions.
> - No hardware issues appear to be present. (Verified that the fans can
> indeed
>   ramp up to max speed by 
> `echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/
> fan_mode`,
> which makes the fan enter "dust cleaning mode," causing it to ramp up to
> max speed
> and then back down to 0 RPM about 10 times.)
> 
> Attachments:
> - DSDT in `DSDT.gz`
> - `dmidecode` in `dmidecode.txt`
> 
> Data Collected during `stress -c $(nproc)` until thermal throttling:
> - EC information collected in a CSV file named `ec.csv`
>   (using `sudo ec_probe monitor -i 0.5 -r ec.csv` from the NBFC project)
> - `sensors` information in `sensors.log`
> - CPU frequencies in `cpu-freq.log`
> - `dmesg` in `dmesg-live.log`
> 
> Thank you for your time.
> 
> Best regards,
> Sourajyoti Basak


Hello everyone,

Just a gentle ping on this bug report. The thermal throttling issue is
still present. Please let me know if there is any further ACPI/EC
debugging information I can provide.

Best Regards,
Sourajyoti Basak
