Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B52EDD58
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630541; cv=none; b=sL9pqttefnTJcHB20vs7Ytx9WSPDmwJbcEafGL++1ICLMXC4MnrZjoVlvaJBrJQTFPmYlGT9FstgqxiTJuQt2ELp4BhCoIsCiaCgCBijZWNXXXT0+/o398dA3lC6QukyJgiUZ91MbflTNTIrrKR3a7Pg5yGOBcWFuy6yhBhEXYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630541; c=relaxed/simple;
	bh=R+eGFGf0cgc4eA8bhxZ+anUWM2eHOrWZeI2lNIAlZxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEMAam5conGaV8fG/vs/jAnszKtM3qp4HM7YZj7Nr1yTOdZag2klayer/lO1HMRvnMO+085rql3HJnxxoqN8pSq3dKJJZrksRiot4OfzbIedZeOjwiVYYYU/la8POIrGi3YoUuh1n6W+cZW3Tu8NNtGOpyzTeUD6EZlUP6FRmQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzudBkhx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzudBkhx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3963982b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630539; x=1785235339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6i/KJS3NLXhR3k/OosNO1oVTEegm0iAGuSI/Lf7jfU=;
        b=MzudBkhxCC1ewW2XuSlNYsMPKjpnMpKaEIAT5CwEKMFgQ6yB0mFfSeGOsXPa9nJVKC
         Sxo6OHO0qKCUKQGyBrxbeY7doFyl69vfCFR57mGwOIADs1VX3PeYFU9dPrM0jouArRSV
         n2ySkeJBJObobsUONEb/LCnY3Hy3mHUmsemEcAUVHk7vwRaz1/B59p/rrVwaSRhVVdLm
         McdsRgI6VdsdncP07bOwDOcggxpdZ2oxsR966iRq/2la4Lf5ULkYmj+xdRh++5uIhMj3
         aWxkG+ILYY9ENTgvu6660+cQRxKp2fszgCEsS+BVtzJhIGrHGUKHZT3UKOo6Ru76Yt8a
         aQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630539; x=1785235339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6i/KJS3NLXhR3k/OosNO1oVTEegm0iAGuSI/Lf7jfU=;
        b=CAnSwrzbWbgvBgjCHs9dpsKlg62wsrldgEFe/FUhr9eSyQMidWgDZaklcK64kFMCXC
         hpJPgWhhJPUXZusG6/tXOXHaRosXWhjj74D2Sxv6n1Wbbe0Wc2aMAIh3MteqvhzRnVh/
         Zn6EufuUYjlxBRD2x9bplmdQNaZ9gZMNWQOloJP0knzWzwhfRsCnD5qUOP0RmDeD93Xm
         pRL1MWruoEY/eUXVS8ehPO2eTtGXI6b2PnAbDEhDVdYqLKDi+5+kohZFE2vMtsn4PF5/
         TsrTnCHGacrd65IeN87fVkK9wzTD5DAV5L3v/KfW2wTwQW/HKj7+WuJ+6VqhK9x6PUUE
         YypQ==
X-Gm-Message-State: AOJu0Yxr7NV5JCbuzaBirpiRvHtNNudw9rQzmGqmBiYaUnCK3iHeneLi
	L+n+lFZqA82s+UzHFowxSo3VL+AtrdBJOq7oIr5ebsrnrZ/s2JuHFV9m
X-Gm-Gg: AR+sD11R3nWZKZC2rEU1ZYvAjogRmTdeHrf80cZKa0IyVvxIBqd4T1Ls9GBzpnNguO4
	GXnKteTRqExr7lr/h3Rh4heaUzcENu0bRNb4y/0/YIf+KdsYdEVrtjxxDl6daXWlmMdVOArjV2k
	sOAEGvnbH0tRTlH0rxxAv+f+RMGP8zenKgYtnJhJJHOIltdJtsoBmeg0gu2mXvuy4gR6yQhwnIG
	fg/L4ZIgfpGlIYFTf48El/pT+0nnz3pmLxMSei4dKpTkeu3ZmddJsMdG+HX3tcbIcKzTCCxzyvV
	d7CDQiGDOYBphjxPmyUwvQDvwfOBbgMbXYyjUfhtzBPGEcs4HoQSk1iJxKZjgH99H3KJe1p2vgA
	MQaIUCi10avbTb+/5TZz83dmGTmlVfjBVLcgfBXF28ZDc8XuSoVb0
X-Received: by 2002:a05:6a00:12e5:b0:842:446a:4cb5 with SMTP id d2e1a72fcca58-84be686c3c1mr21311072b3a.0.1784630539077;
        Tue, 21 Jul 2026 03:42:19 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb676sm5898806a12.19.2026.07.21.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:42:18 -0700 (PDT)
Message-ID: <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Date: Tue, 21 Jul 2026 18:42:15 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Gladyshev Ilya <foxido@foxido.dev>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 Robert Munro <robert.munro@ethicsbowl.ca>, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
 <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
Content-Language: en-US
From: cubewhy <qby140326@gmail.com>
In-Reply-To: <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 6:20 PM, Thorsten Leemhuis wrote:
> [top posting, to facilitate processing]
>
> Hmm, nothing happened here.
>
> Mingyou Chen, this seems to be cause by a change of yours. Not totally
> sure yet if this qualifies as regression (sounds like one), but could
> you maybe share your view on all of this?
>
> Side note: Robert, have you tried if latest 7.2-rc works any better?
>
> Ciao, Thorsten
>
> On 7/13/26 20:35, Robert Munro wrote:
>> To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede
>> <hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
>> Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted
>> but profile remains balanced on Redmi Book Pro 14 2022
>>
>> Hello,
>>
>> Linux 7.1's new bitland-mifs-wmi driver binds on my TIMI Redmi Book Pro
>> 14 2022 (TM2107) and exposes platform profiles, but selecting power-
>> saver is silently ineffective. The userspace request returns success
>> while the sysfs profile never leaves "balanced".
>>
>> This reproduces without KDE:
>>
>>      $ cat /sys/class/platform-profile/platform-profile-0/name
>>      bitland-mifs-wmi
>>
>>      $ cat /sys/firmware/acpi/platform_profile_choices
>>      low-power balanced balanced-performance performance
>>
>>      $ cat /sys/firmware/acpi/platform_profile
>>      balanced
>>
>>      $ powerprofilesctl set power-saver
>>      $ echo $?
>>      0
>>
>>      $ powerprofilesctl get
>>      balanced
>>
>>      $ cat /sys/firmware/acpi/platform_profile
>>      balanced
>>
>>      $ cat /sys/devices/system/cpu/cpufreq/policy0/
>> energy_performance_preference
>>      balance_performance
>>
>> I repeated the request while polling platform_profile every 50 ms. The
>> only observed value was "balanced"; no transient "low-power" state
>> appeared. The request completed in 162 ms with exit status 0. power-
>> profiles-daemon also persisted Profile=balanced afterward. There were no
>> relevant kernel or daemon log messages.
>>
>> Expected result:
>>
>> The advertised low-power profile is selected, platform_profile reads
>> "low-power", and the AMD P-State EPP becomes power-oriented.
>>
>> Actual result:
>>
>> The operation reports success, but firmware, power-profiles-daemon, and
>> all AMD CPU policies remain balanced.
>>
>> System information:
>>
>>      Distribution: CachyOS
>>      Kernel: 7.1.3-2-cachyos
>>      DMI vendor/product/board: TIMI / Redmi Book Pro 14 2022 / TM2107
>>      BIOS: TIMI RMARB4B0P1010, 2023-06-28
>>      CPU: AMD Ryzen 5 6600H with Radeon Graphics
>>      bitland_mifs_wmi srcversion: 0C0A58A1AE25437010C0B5E
>>      power-profiles-daemon: 0.30-3
>>      Power source during reproduction: AC online
>>      Active profile holds: none
>>      Other power managers (TLP, TuneD, auto-cpufreq): none
>>
>> powerprofilesctl identifies both drivers:
>>
>>      power-saver:
>>        CpuDriver: amd_pstate
>>        PlatformDriver: platform_profile
>>
>> The kernel taint value is 512 because of an unrelated AMDGPU display
>> warning during boot (dcn31_program_compbuf_size); bitland_mifs_wmi
>> itself is not tainted and emitted no warning during reproduction.
>>
>> This began after the 2026-06-24 update from Linux 7.0.12 to 7.1.1, which
>> introduced bitland-mifs-wmi (dc1ec4fa86b2). Power Saver worked before
>> that update. My installed 6.18 LTS kernel does not contain this driver,
>> but I have not yet performed an LTS or vanilla-mainline A/B test, so I
>> am explicitly reporting this as reproduced on a CachyOS kernel.
>>
>>
>> Regards,
>> Robert
>>
>> Assisted-by: OpenAI Codex:GPT-5
>>
>> Robert Munro
>> Director, Executive Team
>> robert.munro@ethicsbowl.ca <mailto:robert.munro@ethicsbowl.ca>
>> ethicsbowl.ca <https://ethicsbowl.ca>
>> Ethics Bowl Canada

Let me explain this,

The bitland-mifs-wmi driver was introduced on Linux 7.1

Previously, there wasn't a driver available for Bitland devices (Redmi 
hardware is OEM'd by Bitland), and |platform_profile| was non-functional.

This driver works well on my Bitland laptop (Lecoo Bellator N176).

The driver support for these generic OEM designs is pretty messy. We 
might need to introduce quirks into the driver because, despite sharing 
the same data structure, many implementation details differ across models.


And by the way, don't top post on kernel mailing lists.

--

Mingyou Chen


