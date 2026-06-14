Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30838E113
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781447354; cv=none; b=NsV4g6VWef6lq/jyMKjgU9OZjTmr6ieJDillQysxUlaifR/Y7ICbavny/cQo8aHsOgVvMWZhPiLtw6Z7y626S2nNQqRnjWXFLnE+istE3yt+ZkzTCA8HDY94hTgHoySk5uu86jVy4YHNScuEMzynN2NOv/JT1w/kqwqO8yHidNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781447354; c=relaxed/simple;
	bh=tEVx64nm/3zi6kSwBnsD3arA30V9yGMYCcBOwi8wblQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhvZ1bnix3nhGscON0CpME1PFOEGC2seLT5RCEuKvSxCrjuTBwhKoOzcldFqR1lAUXoDvl6Zy3v+VAcRjvguR7m2NIlB6NVlYBjp5xoK5S0uMdq7eXpPTBkNKYdoL2YHwMTsnAFPLnFzo+rdUclK4DXEyDLbvOpxvawvIT60hE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmCDtxWy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmCDtxWy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be03d47bso25132365e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781447352; x=1782052152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HKdt1hpN3kONaCMNUBJ8wbaTh7eDMk+qZFrnfVPrZQ=;
        b=FmCDtxWyaoDSi/iGptV0B6M6NUMirLrpmbdz8BGfmnKkTNECKVnqDGm8SQvXZkC4hK
         8PRD4n7Sr/fDTCoaSZq3sWRVizejcRumy3BLXYHSU2dfbh4e76+Dn3rQVVmLDmWXI7bk
         tgpKojYAWi1PgVXTblEnnO4lEHIMtKFYG0oxfP57HwnCLEiwBhxcXLmOA/9UznoAmdQm
         ACQ6GTpCsqaZWQe06Y8sslrra6Sx/aolPoL8BbJwSU9tNkyehiKiIIQDJ1bRXNI78XK4
         pbnu5Ey6kYilsjxiyXT+h5kpRr8f695sCzx4h4OpzmOh8+4hH/WwLOBjNAjzzKqdjI1Z
         OTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781447352; x=1782052152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HKdt1hpN3kONaCMNUBJ8wbaTh7eDMk+qZFrnfVPrZQ=;
        b=TU9j/ajdhoyptqL9Pr3nzdm1Wkfo6g/UO12dfkNrDxGNPLB8m+wTjhNefP2FPGgXpv
         wcnR0czZTholobfVxfcxbUHWsw1Qx2emn0+oyLCB1c8/yfmTgdGeG/1VtlEbWjy8dCJR
         GOY08on553X431tudwVyVR36NduGnaVGBy0c9XIw+wOyQyxvRqATFRtsRN4vhkVxkSPg
         iQVrnir7xoh6Jp4Sxff4TG3P51/4QfBBWei73H9nOO8oIyVZOWWuRJyKrSI2EIty8LKH
         yp42aabEhsEv2pgx3bMDNAZjju/LExuB5uUUfnNtGqfLVhrxToJ6a1flhgrJ72vpJ6iF
         gb2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/5dd3+45+I9O8YtGIFUtdniWkKImRE3/cP7XJe2cNwHucNCi4GT0lX/srGxN8wHxOyFwG8MEnYWvE4uEA9jdG7WDeM@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkzfBvg2lUrKQAstDrQraQxEuqk5k7kcaFO7bxcMv39spMDrR
	fDZWUUsXqOm6u/6LMs2JMPOBvpJTvl7AGht25V+p8pFpDw68TlKEBeqs
X-Gm-Gg: Acq92OHq8k2e0ouSVBTReCRtm0JJrIRh0UJPUcuVU7JCRw1P3GBMOaOEj2tG3r1PO2s
	ujwesnxIL7Ut+K1wLmpImnLaUOrXK4GzTS1BXvxg9KIx+T9870Igts/VyqLbTy2APwJ6F0/fBkh
	JcLOHTmxjQAPzIo+/oQojhr75bYkp3VW/noyYGnq5Ehk4o2/Y17TwbqysudWZ8fuQcJfWaceAF5
	omAMU+pIEyiTE/zVqlhn2docbRFHvCT4ky5qOsRyDatZpMrBBU2ZM5mcRU5s0365nojLhZ2aQqt
	KK///b/mPmBwwl20Ihfop75SfAozPwqSuhiGEEh0iq4kAvFNTJA19ZJtoEBGKw/XmxijPwm+Fx8
	dhCW4HWED/UMtuvx1H0difzKjiyhgXCMagDlvLhRljWvL8S9Bpw5htHRNoGXN+5ydCYHQdT0K3/
	+wycoGDZfXHi8WmYra5agumCz7mARyAzDkagI=
X-Received: by 2002:a05:600d:8489:20b0:490:b724:507d with SMTP id 5b1f17b1804b1-490ec4cec11mr96194135e9.11.1781447351472;
        Sun, 14 Jun 2026 07:29:11 -0700 (PDT)
Received: from [192.168.7.105] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm160728655e9.8.2026.06.14.07.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 07:29:10 -0700 (PDT)
Message-ID: <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
Date: Sun, 14 Jun 2026 16:29:09 +0200
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
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ai2NAS5EnLaLoN2W@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

Topology confirmed, and it's the "firmware mismatch" case. In short:

- The sensor (OVTI02C1:00) sits at \_SB.PC00.LNK1 and depends on DSC1,
   exactly as the _DEP decode showed. DSC0 is instead the link-0 PMIC,
   whose sensor is the Himax HM1092 IR camera (HIMX1092:00, Windows
   Hello).

- DSC0 = INT3472:0c, DSC1 = INT3472:01.

- The clincher is the regulator_summary: the only dvdd on the whole
   platform is INT3472:0c-dvdd (DSC0), and it's orphaned (use=0). DSC1,
   which the RGB sensor actually depends on, exposes no dvdd at all --
   only avdd/dovdd/reset.

regulator_summary (the only two top-level regulators; all
regulator-dummy children are SoundWire audio rails, elided for brevity):

    regulator                 use open bypass  opmode voltage ...
   ------------------------------------------------------------------
    regulator-dummy            19   27      0  unknown    0mV  ...
       [ ~30 sdw:* / cs42l43 / spi0.0 audio rails -- elided ]
    INT3472:0c-dvdd             0    0      0  unknown    0mV  ...

   No INT3472:01-* (DSC1) entry: DSC1 registers no dvdd.

Direct kernel confirmation, the "Sensor name" line from DSC0's probe:

   [    6.301445] int3472-discrete INT3472:0c: Sensor name HIMX1092:00

i.e. DSC0 keys its dvdd to the link-0 IR camera (HIMX1092:00), not to
the OV02C10. So there is exactly one dvdd handshake and it's on the
wrong side: it lives on DSC0/link-0, while the RGB sensor is on
link-1/DSC1, and nothing connects the two. DSC0's reverse-_DEP resolves
to HIMX1092:00, the dvdd supply_map is keyed there, and i2c-OVTI02C1:00
never matches -> dummy -> rail down -> 0x300a -EREMOTEIO.


Thanks,
Samuele

Il 13/06/26 19:01, Marco Nenciarini ha scritto:
> Hi Samuele,
> 
> No problem on the timing, and thanks. The regulator_summary plus the
> _DEP decode settle it, and they confirm the multi-instance hypothesis
> from my last mail rather than the missing-map one.
> 
> One correction on the code side first, because it matters for the fix.
> The handshake path is not missing the consumer-map step. HANDSHAKE
> (type 0x12) and POWER_ENABLE (0x0b) fall through to the same call site
> in skl_int3472_handle_gpio_resources(), so both go through
> skl_int3472_register_regulator(), which plants supply_map[] (dev_name +
> supply, lower- and upper-case) the same way for either type. That has
> been the case since v6.16 (c5d039327204, "int3472: Add handshake pin
> support"), so your 7.0.10 kernel has it. The dvdd map does get created.
> The problem is the dev_name it is keyed on.
> 
> That dev_name is int3472->sensor_name, and sensor_name is
> "i2c-" + acpi_dev_name(acpi_dev_get_next_consumer_dev(adev)), i.e. the
> first device that lists the registering INT3472 instance in its _DEP.
> Here that instance is INT3472:0c = DSC0 (the regulator name in your
> summary, "INT3472:0c-dvdd", is built from acpi_dev_name(adev), so the
> provider is unambiguously DSC0). But your _DEP decode shows the sensor
> (LNK1) depends on DSC1, never on DSC0: ARLP -> {CVSS, HS09.VIC1},
> non-ARLP -> {DSC1, HS09.VIC1}. So DSC0's reverse-_DEP walk does not
> return OVTI02C1. It returns whatever else declares a _DEP on DSC0
> (plausibly the IR-flood side, given func 3 sits on the same device),
> the dvdd map is keyed to that name, and the sensor's
> regulator_get("dvdd") for "i2c-OVTI02C1:00" never matches. -ENODEV,
> permanent dummy under full constraints (the legacy ACPI dev_name path
> has no "coming later" signal, so it is a dummy, not -EPROBE_DEFER),
> rail stays down, 0x300a reads -EREMOTEIO, no retry. That is exactly the
> regulator_summary you captured: INT3472:0c-dvdd registered, use=0.
> 
> Note this is specific to dvdd. DSC0's _DSM only exposes the dvdd
> handshake (func 2) and the IR-flood strobe (func 3); it does not
> provide avdd or dovdd. The sensor correctly _DEPs on DSC1 and is served
> by DSC1 for the rails and resets DSC1 owns, which is why it gets far
> enough to attempt the chip-ID read at all. dvdd is the one rail
> stranded on an instance the sensor does not depend on. (avdd and dovdd
> landing on dummies is most likely the always-on-rail case I mentioned
> before, benign, unless you can see a gating GPIO for them on either
> instance.)
> 
> Timing is not the mechanism either way. Your own timestamps already
> show the sensor's get at 6.468 well after DSC0 bound at 6.135, and even
> a perfectly ordered probe would still miss, because the map is keyed to
> the wrong device, not registered late.
> 
> So this is a firmware _DEP-topology issue: dvdd is gated by DSC0, but
> the sensor is pointed at DSC1, and nothing connects the two. Could you
> confirm the two halves of that, so we are not inferring DSC0's consumer:
> 
>    - with int3472 dynamic debug on
>      (dyndbg="module intel_skl_int3472_discrete +p"), the "Sensor name
>      %s" line from DSC0's probe shows which device its consumer walk
>      actually resolved to. If that is not OVTI02C1:00, it nails the
>      keying;
>    - the reverse _DEP, i.e. which device(s) list \_SB.PC00.DSC0 in their
>      own _DEP (a grep of the DSDT _DEP packages). DSC0 bound rather than
>      failing with "INT3472 seems to have no dependents", so something
>      does depend on it; identifying it tells us where dvdd actually went.
> 
> Hans, Sakari, once that "Sensor name" line confirms DSC0 is keying its
> dvdd to a non-sensor consumer, the open int3472 question becomes whether
> this is a firmware defect to push back on or something we work around
> in-tree (and if in-tree, a per-board quirk vs. generic cross-instance
> keying). Worth noting the EPROBE_DEFER idea from last time does not
> apply: the map is keyed to the wrong device, not merely registered late.
> Let's nail the topology first.
> 
> Thanks,
> Marco
