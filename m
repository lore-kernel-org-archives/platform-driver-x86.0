Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75F2DF156;
	Sun, 30 Aug 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093217; cv=none; b=CocFVp/rGXsGNamV/JxP5p6AIsvpYThzBELuzIX4ODizRTESUj4upNKN+TgYEbAKB8A/s5bFA6ANtUdBjdgyuANuJ7Vl/K+FhwcQ0ZEm3hPost971i06Ffr0XODApxuuIh7ALFc1k+uJkS8mX0kZX6guireQZ7mG+IIu1cA6W5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093217; c=relaxed/simple;
	bh=DbS4K0kZj80XZmqjo44t/Qjn+1io5xEwIT9YkDGH9+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnTUjK6LEcc1AScYgxYk4X9DhAnBl5cbrHPrK9nK021a427xmb4PYY6RC1qTRu9Rvfi9+SJZ0I0YGqEvn6XZxjx2HZwW2OXpL7PYQgNtdX75fJxSYx744q7DrqCanSxG8lVTRtQa9J9wcXFAvH9MVkot955T+f4xLmnM8snd0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlK1wUhc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlK1wUhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1221F000E9;
	Sun, 30 Aug 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788093216;
	bh=4r6vDlF4GeRZu+YbnR/Ofgz9TBi/72A0IMpB00yGr6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hlK1wUhcEZFVy1sf2jHxjutcO4rR3Lp9F0A4JZNm7rR3cz1uJokSofUA1uejeGazq
	 549fQcZY5nOWLyuMplQBZOr6hUZRVxeUBq34TVUBY1GiwBjdUdKxJ5gQxkugHrZUN9
	 8lFQ2eZ0cUzi0NEj2rLABip/BhoJRsPM+ps3u6Direa/KRed9ir1iFOOrR7J7qrT9W
	 kKOnlxGpkSOWRkS/YzYaKbjh1XD2MFvd9jJunKPuvPUyazmIgRTMPXioMikRMrs+Kw
	 ruuf4VeXGZkMaQAtp+/IP0X1H9CXjT4xL5ZkqnELhgoOqLoxXyEep5+heJn5f+o5Q1
	 Cx9XdlpNnjfnA==
Message-ID: <75a42495-d6d0-4ff2-ae05-a0a1bbc30261@kernel.org>
Date: Sun, 30 Aug 2026 14:33:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: unhandled GPIO type 0x08 leaves the rear camera dead
 (Surface Pro 11, Intel)
To: Sergey Lebedev <lsa.uz@pm.me>, Daniel Scally
 <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830112736.85573-1-lsa.uz@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260830112736.85573-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Aug-26 13:27, Sergey Lebedev wrote:
> Hello,
> 
> On a Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) the rear
> camera does not work, and it traces to a single unhandled GPIO type in
> int3472-discrete.
> 
>   int3472-discrete INT3472:00: GPIO type 0x08 unknown;
>     the sensor may not work
>   ov13858 i2c-OVTID858:00: failed to find sensor: -5
>   ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

There already is a patch which should fix this on the list:

https://lore.kernel.org/platform-driver-x86/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm/

Regards,

Hans



> 
> The result is 32 /dev/video* nodes and a media graph with zero entities.
> The IPU7 itself is healthy - firmware loads, CSE authenticates, the device
> reaches secure mode - so the failure is entirely on the sensor-power side.
> 
> Reproduced on 6.17, 7.0.0-28 and 7.0.0-30 (Ubuntu 26.04), and the switch
> in drivers/platform/x86/intel/int3472/discrete.c still has no case for
> 0x08 in 7.1.0-rc7, so I do not believe this is already fixed.
> 
> What the firmware describes
> ---------------------------
> 
> The DSDT declares three INT3472 devices. Decoding their _DSM returns with
> the driver's own field layout (type = bits 7:0, pin = bits 15:8):
> 
>   Device (ICL0)  -> INT3472:00, the rear sensor (OVTID858 / ov13858)
>     0x1000070B   type 0x0b POWER_ENABLE   pin  7
>     0x10000500   type 0x00 RESET          pin  5
>     0x1000060D   type 0x0d PRIVACY_LED    pin  6
>     0x10000408   type 0x08 <unknown>      pin  4    <- refused
> 
>   Device (ICL1)
>     0x1000200B   type 0x0b POWER_ENABLE   pin 32
>     0x10000810   type 0x10 DOVDD          pin  8
>     0x10000900   type 0x00 RESET          pin  9
>     0x10000A0D   type 0x0d PRIVACY_LED    pin 10
> 
>   Device (ICL2)
>     0x1000170B   type 0x0b POWER_ENABLE   pin 23
>     0x10001600   type 0x00 RESET          pin 22
>     0x1000250D   type 0x0d PRIVACY_LED    pin 37
> 
> ICL0 is the only one of the three that declares a fourth GPIO, it is the
> only one carrying type 0x08, and it is the one whose sensor fails. I would
> not claim that proves causation - the driver returns 1 for the unknown
> type and carries on, so POWER_ENABLE, RESET and PRIVACY_LED are all still
> registered - but it is the only resource the kernel declines on this
> machine, and the sensor then does not answer on I2C.
> 
> The question
> ------------
> 
> What is type 0x08 meant to be, and should discrete.c handle it? If it is
> another regulator - the shape of ICL1's DOVDD entry suggests the encoding
> supports several - then adding it may be all this machine needs. If it is
> something else, I am happy to be told what and to test whatever you would
> like tried.
> 
> I have not sent a patch because I would only be guessing at the semantics,
> and guessing wrong here means silently powering a sensor rail for the wrong
> reason.
> 
> What I can provide
> ------------------
> 
>   - full acpidump / disassembled DSDT for this machine
>   - any debug patch or instrumented build you would like run; the machine
>     is available and I can rebuild and boot kernels on it
>   - dmesg at any log level
> 
> Two adjacent facts, in case they matter, though I am not asking for
> anything about them here: the front (SONY0681) and IR (SMO55F0) sensors
> have no in-tree driver bound at all, and intel_ipu7_isys still announces
> itself as a staging module.
> 
>   Machine: Microsoft Surface Pro 11 for Business (Intel Core Ultra 7 268V)
>   DMI SKU: Surface_Pro_11th_Edition_With_Intel_For_Business_2103
>   Firmware: UEFI 17.100.143 (2025-11-19)
>   Kernel:   7.0.0-30-generic, Ubuntu 26.04.1 LTS
> 
> Thanks,
> Sergey Lebedev
> 

