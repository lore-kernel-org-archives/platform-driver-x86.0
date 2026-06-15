Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BBB3F23A4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528444; cv=none; b=tzJvdeZscIeGGUrXTwqifWZ0IO6pQWS22INOpHSigNjUyQR/KsGQisCHCs/Tt6ZpjjNeg0p3WGl3eAuaQgJMdui8WInyjp8G9NDYK2aT7YFHaS9szxYGxCK97fDfl6w4ksxj0EXCI2B237dyVORsEe02fPge/58z2PjNfhDjUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528444; c=relaxed/simple;
	bh=qs5C18/+H9AyHtb/11GGHII5EWG39bujftbaDo2RJy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1ypHFSBbR+ELxSM4TuqHA6C7iYUZKZ+Yw8+yLMJaZ7qrrfCzX7MXjU4XbIxkU/6OMs1Ni1EcbgeW6tdq5Y+hqfvcmUNO3eJWTq9KBddVfWQrUO9OKgs4ll7r/3flK/io++26kmD1ob9yua0iNdd6dgMnn+3eKFSSU6uakaF6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9fkk10N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9fkk10N"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so6635790a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781528441; x=1782133241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gv18xf2jcQ1AQAQKKfrWvkQrEUmUuEzoWqcmaBrax9A=;
        b=g9fkk10NkzZmWNlxcwpA+gB+mfxWAYAaYawpzpunmqb2qrN3HZ59HKFrQE3j0mW/IM
         4u7T6koeLnqi32YpQyAjKhHcedIRqW86Tumj1ivBMWaRQ+ofnzfJpWW3Kesuw08Cjuh1
         nSvGStgfgshJC2hprjELrggLWdGkBAdsn8sqT10Zi5XdfUvt5AoB9snlSt+Xf3b6/18D
         2rkTpX9cVys3E9r1hOmmDRpVYvcBoiidR0K0P+1fmfAfsvT4oTV96u0Tvvivm4IHvSoc
         gV5x5YAu2CWreF/V9o8l0QuY/QRTyzIjj7U+0ft7TB6HHSdkUA16efDTHYF6qk083Nog
         zLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528441; x=1782133241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv18xf2jcQ1AQAQKKfrWvkQrEUmUuEzoWqcmaBrax9A=;
        b=iWD6/Nti/cKpLOksTsd/iW1u38CNiOw7u8lmEE9VFS9tFc8j7aF0y/ztmjNQL41HsV
         r70ejOSjW/UIpFG4h2RUAIC4sNRCgc2la6/ECO7FaQ/wXjPRe2jKmxV6RtfL++5XPwsO
         JRekdD5Z727LUqhpAVDQgOJmpiXKK6gWCDlTo9qPdjNZ5N9/WqlOAxVdPd25om9bF8Ri
         2fGSzlcq25iaUqayX1UHEoAW5zPdX2zxX+/pWjdGXWHhKrVz96gG63wldQCCZZcoql2K
         fZxIoHUr4qqQYl671PurSVjVYkwxXPEu5dsBUOqVghhzpfsrN47sep2H9pfjNDA9sH49
         WIfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ordzx5j+U7oDfgY5m0wptdpzgzHwj19gADDDjvwitIPqUBwZrTGyz/0Kw6Svux1Uu7cbIp5nd0c/JubuuT6JkY3vy@vger.kernel.org
X-Gm-Message-State: AOJu0YzaT2YcA/XEQHl5RTCe0DqdCcTKLwC+hZQtr0gBbr9OiByG2L3F
	7m7wayhy6ZXbH/Ik8+6MMirn3UOjMZsl3fw70Jg8ydWqCf5DlJ5Q8N6l
X-Gm-Gg: Acq92OH/HzXgwOme/at1eIj5nXkdADpMBPu7kiZCjXW/58uhDVUtQAB1ZvfDP0DSep+
	lZpYs7k8ycNeZB9PWOzuvw7gH7CVoCg1gSjSmzrB9Q3/w5/ypqZqQ+83kgvFhamikdR5SPNvTf9
	rOQd0vdngeGufV41EPpNa/ecsglOCAvMtws7mFgsBej0E44TouMuNibLeZiCJIEX5zhSMfmXPWi
	VZB7dhMfJCfDrDvlIvtg+5c37obEFHKJhVuZ9Wd36JkdSgBl4Dqj3mbBI823r2lHuw0RPzU6Ebm
	zdadBYD0mqDw1tQaZqom4SJVm8dSUlrOE0MfwHCx6lwSWQwjfuCBkf7SJMl1YFW5Gw9ovs0zaiG
	aN9YvnE1TjTJMAf2hDDGi3T8TzZtgZ89hrMPlsm7RAwuXfEHWnRFHUOuAElYpSF5i0VAfEV5Sk2
	HCk2qfNx1rYNbfe7l1hpQRCdEcXkbErCiFeg==
X-Received: by 2002:a17:907:e101:b0:bfe:f92a:cb3c with SMTP id a640c23a62f3a-bfef92ad4camr310572866b.14.1781528440825;
        Mon, 15 Jun 2026 06:00:40 -0700 (PDT)
Received: from [192.168.8.19] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9113103sm473479466b.63.2026.06.15.06.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:00:40 -0700 (PDT)
Message-ID: <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
Date: Mon, 15 Jun 2026 15:00:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
To: Marco Nenciarini <mnencia@kcore.it>, linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
 <ai_TEj-_ije1XgYF@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ai_TEj-_ije1XgYF@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Marco,

The _STA read settles it, and not in our favour. Full int3472 _STA dump:

   INT3472:0c  \_SB.PC00.DSC0   status=15
   everything else (DSC1-5, LTH0-5, CLP0-5, and INT3472:00 = the I2C2
   TPS68470) status=0

So DSC0 is the only live INT3472 on the platform. DSC1's _STA is

   Method (_STA) { If (CL01) { If (C1TP == 1) Return(0x0F) }  Return(0) }

identical in shape to DSC0's (CL00 / C0TP==1, which is why DSC0 is 
live).CL01 and C1TP are NVS OperationRegion fields (8-bit, defined in 
the DSDT NVS block) that are only ever *read* in the ASL -- never 
assigned, and not inside any _OSI branch. The only _OSI use in the 
tables is the standard OS-version detection; it does not feed the camera 
gating. So this is a BIOS/NVS camera-config gate, not OS-gated: acpi_osi 
spoofing can't flip it.

C1TP is also the field CDEP keys on (==1 -> DSCn, ==5 -> LTHn, >1 -> 
CLPn), and with DSC1/LTH1/CLP1 all _STA=0, camera 1 (the OV02C10) has no 
live PMIC instance at all. And even if DSC1 were on, its _DSM only 
exposes func 0x12 (dvdd handshake) + func 0x0D (privacy LED) -- no 
avdd/dovdd/reset/clock.
DSC0's is the same shape (dvdd + 0x02 strobe). So none of the discrete
instances ever carried the sensor's avdd/dovdd/reset/clock; those come 
from a path that is entirely _STA=0 here.

The factory Windows install runs the RGB camera fine, so the hardware is
present -- Windows just powers it through its IPU6/PMIC stack, 
independent of these _STA-gated INT3472 devices. Linux's int3472/ov02c10 
path depends on them, and the DA16250 firmware leaves the whole RGB-side 
PMIC topology _STA=0 in NVS.

Conclusion: the second_sensor dvdd quirk is correct and worth landing 
for boards where the relevant DSC is enabled, but it cannot bring this 
camera up. The OV02C10's avdd/dovdd/reset/clock have no live provider to 
re-key to, and the disable is a firmware NVS config, not something the 
kernel can satisfy. Short of Dell enabling the RGB PMIC instances in 
firmware, the only in-tree path would be a full DA16250-specific quirk 
that hardcodes fixed regulators for avdd/dovdd and sources reset/clock 
directly -- which needs the board schematic and only works if those 
rails are actually software-controllable. I suspect that's not worth it 
for one SKU; this looks like a Dell firmware bug to report upstream to them.

Thanks for walking through it -- happy to file the dvdd second_sensor
quirk on its own if you still want it in for the general case.

Thanks,
Samuele

Il 15/06/26 12:25, Marco Nenciarini ha scritto:
> Samuele,
> 
> Thanks. The dvdd re-key worked (post-patch ov02c10 only logs "not
> found" for dovdd/avdd, not dvdd, so it did attach to DSC0's dvdd), but
> as you found it can't bring the sensor up: the rails it still needs
> (avdd, dovdd, its reset GPIO and clock) would have come from DSC1, and
> DSC1 is _STA=0, so nothing live provides them.
> 
> So before any kernel change is worth considering, the question is
> whether DSC1 is off by firmware design. _STA=0 is what you get from a
> device that is BIOS-disabled, OS-gated, or simply not fitted on this
> SKU, and the asymmetry fits: DSC0 (the IR camera) is live, only DSC1
> (the RGB sensor) is dead. If DSC1 is meant to be off here, there is
> nothing for int3472 to fix and no quirk worth writing, so I'd rather
> confirm that than build around it.
> 
> The way to tell is to read DSC1's _STA from the firmware tables.
> acpidump's multi-table dump won't feed iasl -d directly, so read the
> raw tables from sysfs:
> 
>      cp /sys/firmware/acpi/tables/DSDT dsdt.dat
>      cp /sys/firmware/acpi/tables/SSDT* .
>      iasl -d dsdt.dat SSDT*
> 
> then grep the *.dsl for DSC1 (the DSC blocks often live in an SSDT, not
> the DSDT) and read its _STA. If it returns a flat zero, or gates on
> _OSI("Windows ..."), or reads a manufacturing/setup variable, the
> sensor is disabled by firmware and that is the end of the kernel angle.
> If instead it depends on something a live instance could satisfy, then
> there's a kernel path worth pursuing and we look again.
> 
> If you still have the factory Windows install, whether the RGB camera
> works there is a useful cross-check (works in Windows means gated, not
> absent), but the _STA read is the real signal.
> 
> Thanks,
> Marco
