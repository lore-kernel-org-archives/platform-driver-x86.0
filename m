Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F621E7660
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 03:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392626; cv=none; b=KaRhbbuSp0GWXZtOhPbH/L1zXEGRamyDFYwcWKzOfXm7jqtsONudP6RPoNiDABsP+AgJF0huVvRyEWG3XvD+GX0LlTZXjL410QZHmU5231OTAIbwKSDy7ZUWj3NCu5+DjvkrwM9GrfmFLayNZTWgfnF+/s5ViWCc+7Tz3A7eaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392626; c=relaxed/simple;
	bh=phknDJXD1KlqoZHqZ5ocEhqcTX7mgaI53rUlpuJRH1I=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=Itpz6Mr+VNVmTtw/sThNWgwYRdXf4FuQBdoDXwlDbRrxqkMec7QfPItUe3pLm9DwgxuEjZEDKsx8CvMZTs/O4tH1hA52UZlVuHOp3G4RijCipWwo6BMetUAOO56AmDJluwzP1aUjwDZ+9HTinAeKLSlccA4FT4bDIEOou6rftOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDphLuzh; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDphLuzh"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a65680ea30so6989791fa.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 20:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790392623; x=1790997423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q9o9fUdFoS9dQFqXio0ki/Kh4RtXh0+/vyhCM0NKki0=;
        b=JDphLuzhVL9kxTSxvc75BLBlcy6+AQyrPwQus7mthm1W/PhxHyPZDWszApTa10m5dQ
         nDcyg74F/th+yx+B0PdTqGmH2BuJiG4ryDcKnlm57HS5ny9kJS8lg52fA4VOV9yw5MAn
         amueCjFQTR4K/AAT6oeF7izPYPYvQQjc6N0kjwvCYPfksnFe6BnP1oSvaca2+2R/qD1I
         zeaWwg4G4DEGu+x3Wm6IjYtuCTveTwi3LtEbaEGr1KhnKXYkgjQSWiC0CQmXBUq0/EGK
         +/MgIFuUlH5FQWRWdGLLfkCPphVP4X+oYZw1EW90rWFCke2csonvaheyO9dxxyrs4f+T
         EYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790392623; x=1790997423;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9o9fUdFoS9dQFqXio0ki/Kh4RtXh0+/vyhCM0NKki0=;
        b=ZhLjBEfqmTWscw1Z/iWBUxj0B8fn0vfeh8IdYMCCnF9veuCPA0aTmBOys51K7yLMYs
         T5uR/nDMDet2JDlUDnVH8uEikcvjWhXvxTcWN1OBgqyfIBNjeM9zys9e1uzH6tHfcAS0
         Mmp7YiumckHmANMh0/8/p/oyXND+FCGVAS6xKT8tK2v4ZQ0lSzOmdR5qf6O8E5B0nqhH
         FK3hCNQH+PqGHT0NWvQE6+7s5yc2knS4IdmU3ohdxn1Db28Y2TEM5oyBcQiJMUEe3VUE
         +y3OYw8Uku/nnF5idjG0Vza3A1820THreL1u4De8lyV0WauO/EbuNWOuRpGNEHxKe9f8
         aGXQ==
X-Gm-Message-State: AFuF++mTr/5Fq6NIga2knA5rK3UlJL+03BT39PvgX23cGUqI7k1Q/EDi
	1DTM9jp+bTcPmT9M3NI7EpR2TqGcxZgKN3CbpylGYthHyKIsihgyX4xa
X-Gm-Gg: AYBFou3vLnoIWVwiR+ZaDLYEn8qgb1ZIPXdMGhwXsSJcQntA9ZWrBIk9tuzVoepK8yq
	XLXti4EZrCKx5madmjVkIjRsdMVFrIOPUcXBZZvZsQG9ALoTdTjFFovdKsddTy70bJJdmeaRZrM
	xSNd/xm6STs1A0K1Z5vIuZ4JlC2YW3EvLAZw6a/lkOmgp0b/0BnlsggZvLJTvb2qVn4WyaCDcha
	xcfUCEHe9aLQwtyAVvzB7FqvDI8VV9IzMjN195oegxWCyVZyIq7RjyMLe524krlieNeJ/F+PADa
	JRamJdFmaK4KhwHXan9AGVqxfoi3xTZ55Fj+nqwhdYyopAK/HT2Qg5m7/5UJY+Yf2+Xj1VvH8OW
	k66PYfdKwdLr2W0rxR1IoCxVlYdyiP3hHyIKoiHxh14312vpfyIgDjOksavIaganzwpIXIcHBe5
	XFzu9pFP6yqV9F0oRVMafwbfzQRUyntxNN8EQ0h+88DqdElzQ95eLAj85Gt1qWtVm0kJLB+p3Bs
	oh+mdptdIReq3p4FnTDICxsnctLAZM4v+kTM7hM51tLIABm3w==
X-Received: by 2002:a2e:bc04:0:b0:3a3:7681:6d6a with SMTP id 38308e7fff4ca-3a64c7b73d2mr10278121fa.19.1790392622865;
        Fri, 25 Sep 2026 20:17:02 -0700 (PDT)
Received: from [10.132.90.172] ([176.15.202.27])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b581741sm10597841fa.9.2026.09.25.20.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 20:17:02 -0700 (PDT)
Message-ID: <46b1ac40-053a-498c-84b8-00aab55a8c82@gmail.com>
Date: Sat, 26 Sep 2026 10:17:01 +0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: bitland-mifs-wmi: wrong platform_profile values on REDMI Book Pro 16
 2025
Content-Language: en-US
From: Aleksey Irlik <aleksejirlik@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

on a REDMI Book Pro 16 2025 the platform_profile support of
bitland-mifs-wmi does not work: reading the profile fails and writing
"balanced" is silently ignored by the firmware.

Hardware / software:
   DMI:     XIAOMI REDMI Book Pro 16 2025
   BIOS:    RMAAR6B0P0808 (01/30/2026)
   Kernel:  7.2.6 (CachyOS), driver source identical to mainline
   Charger: USB-C PD (the machine has no barrel jack)

Symptoms:
   - "platform_profile: Failed to get profile for handler bitland-mifs-wmi"
     on every read of /sys/firmware/acpi/platform_profile (EINVAL).
   - After switching to low-power, writing "balanced" returns success
     but the profile stays low-power; power-profiles-daemon gets stuck in
     power-saver until reboot.
   - "balanced-performance" / "performance" always fail with EOPNOTSUPP
     while on AC.

Raw WMI calls (via acpi_call, \_SB.PC00.WMID.WMAA 0 1 <buf>):
   GET 0x08 (SYSTEM_PER_MODE) right after boot:
     {0x00, 0x80, 0x00, 0x08, 0x09, 0x00, ...}   -> mode 0x09
   GET 0x13 (SYSTEM_AC_TYPE):
     {0x00, 0xe0, 0x00, 0x00, 0x00, ...}         -> status 0xE0, unsupported

Firmware analysis (SSDT21, method WMAA; DSDT, method Q_EC.NTDP):

   GET 0xFA00/0x0800 only ever returns 2, 3, 4, 9 or 0x0A.

   SET 0xFB00/0x0800 accepts FUN3 in 2..10; FUN3 == 0 or 1 matches no
   branch and is dropped, but SGER = 0x8000 (success) is still returned:

       ElseIf (((FUN3 > One) && (FUN3 < 0x05)))   // 2,3,4 -> QFAN
       ElseIf ((FUN3 == 0x09))                    // -> QFAN
       ElseIf ((FUN3 == 0x0A))                    // -> QFAN
       (5..8 go to SMMD/SMMT instead)

   The mode is passed to Intel DTT via NTDP -> ODV1:
       0x09 (and default) -> ODV1 = 0
       0x03               -> ODV1 = 1
       0x02, 0x0A         -> ODV1 = 2
       0x04               -> ODV1 = 4

   So on this model the values appear to be:
       2    quiet
       9    balanced (firmware default after boot)
       3    performance
       4    full speed
       0x0A low-power variant (same DTT policy as quiet)

   whereas the driver uses BALANCED = 0, PERFORMANCE = 1, QUIET = 2,
   FULL_SPEED = 3. Consequences:
     - 0x09 at boot is unknown to laptop_profile_get() -> -EINVAL;
     - "balanced" writes 0 and "balanced-performance" writes 1, both 
ignored;
     - "performance" writes 3, which is actually the performance mode, not
       full speed; full speed (4) is unreachable.

   Also, bitland_check_performance_capability() requires
   SYSTEM_AC_TYPE == 2 (barrel jack). This function is not implemented in
   this firmware (status 0xE0, data 0), so the performance profiles can
   never be selected, even on AC.

The semantic labels of 3/4/0x0A are inferred from the DTT mapping above,
not from vendor documentation. I have not checked whether other Bitland
based models use the 0..3 encoding; if they do, this probably needs a
per-model (DMI) value table.

I can provide full acpidump output and test patches.

Thanks,
Aleksey Irlik
