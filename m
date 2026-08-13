Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3F3624BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609432; cv=pass; b=GV6VFrAx/kaVhhx4BMWKlVE+PCIahFOESUEKr3XzJlPfLi1hEZW4QSuS3m0R2Zfvs3U4zb4Zz5uge0CjCIUY21nIbZaxUUc3N+VDsy6COMGwcKuT3ie1PutUi2/yYX8TjE3gW6PQdhv7J4yuYnahaE2MrX5SmD0bMU0ttrwfnEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609432; c=relaxed/simple;
	bh=NZyWeSWIcsWnonwxTcycT9OZ+spysx6eFvt+8XP4HIs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E8DYYnWiyyzZQIwmtnav6Kb139wtz05FHo2tIuRf8ysx7RMP2P9YQTvwi/tEtgi/6Ct3gq+jkIWBEQR2jSpjtlCDgDR8yI8laV01i2AkG145Xl5XzcDsdb94bFuowCcqHzNfiTqMVuae+vFfcSy8GQCUNYHR+qk6PAuKoDUFKLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsmLqyCh; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsmLqyCh"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9087fb771d3so8392116d6.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 01:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786609430; cv=none;
        d=google.com; s=arc-20260327;
        b=aCfgtpgTJRucdSvpAd0yMDxjMdZ9Bpn+SniJxCS0VQ88OQ52eBfCXANmsb9zXD6UYy
         kDxUMYuUrLpkSFr0wdQHXBDw3T1u4rP3HvzsuDzobfDo8odtE4WFKLiALOkJry15vd38
         4XY+btj3fq8iWiLH5R0Xp8hZYt72HOZAKsHrHHZUspqZwer9CmYbyZmMPrfoEGbnNQVF
         fp+APEGbYGQtaYRTzCa4uOx0qiODT9WuISozYY82HnLB490uLCv41i65FDiTcPQsDxsJ
         02EwLEXCsVLq0gw+AivN0+QfyjFxn+SBS7MQHKZ3icDr9EOV1JaURsAs286zEuZSOo7v
         D/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iSQD8MQkooKgEbyHsRN4HHwTQFp/CYaNMcgLTgWsn+Y=;
        fh=cvi9e687NNtOij8bET3HoOLmKeTVjxZUTzhihopSv4w=;
        b=qCfdT//NEtr1S79mr1sLopr24K2obZQTPb+g+CS+YMNmbZXwsp2kC6mnS/hYVAu8/8
         Fcvl4RdbK4Gmz10XCgfbgYy4mw8K5PKGc2Ps8hdoDpXaKlnxzTi9XjXX61gJFaul3l55
         x2Q4J4jS1klU9Qcd4eQFZfoE85BeZ6rJjdYfYQoRydjUVMUdwNyoSh7a7n5Ka6DvCW4/
         fq6nNGmDRkSmd8g2EkSZknmfMul6CupEUj6mB1nlMSNjrmZEAT7VhKfHOa2yHFCwEbJg
         YaKhdddOB8pDSR6zIS8yaN1MBPS4d4kfZbgb2/8RZyO2gQudA39i2tVwfQcZhVLyf1qh
         Xz/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786609430; x=1787214230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSQD8MQkooKgEbyHsRN4HHwTQFp/CYaNMcgLTgWsn+Y=;
        b=UsmLqyChliGvd8Yvr6lzFse2g9i16LKRNBMb4FOpaiOi75hzdT6lRAIbcbk+W8RHxb
         eb+8kU1PyDixcm8h8kIjrBUe6Sl1KGPa3WEGeqTDffVrM1kdAKvAVMCKPg3C/PHdyvTw
         8jyEXp7tSRO1cUsy5cGl4BYgtD//e21JyYJLdTp7ZX9sCg/5VGA3V9VqF8PpFPiQknVG
         mPR4hPxcx45TWprepfgZFaLk4b6yLfnU9HrdQHt14oufIv7yoPPSaR8OYr80HtRF1T4E
         sfCREyTeM5IRoMaYcAVV4KNESnM0R6JEGCO0QlGMO/n6GJ+pX1D3NmAzZKfuBXHaIjMu
         LO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609430; x=1787214230;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iSQD8MQkooKgEbyHsRN4HHwTQFp/CYaNMcgLTgWsn+Y=;
        b=H3YI3IJ8tSAx/WbyQtoLJ/jqyI+VPkM1CfGcjH8v9VIoEq83ja2zr11ayiSvVOshHn
         nbGjYXblzBa7N+8SbT3HpUyG6FKm3WDCCpFurC+JdC5h+Q75RXrPownUxXLlMwplwP4B
         GcdXhyoPsFgsnbabb8A6WehQzF+TA8FMiC+tFFb+K+xgkx6YJHP1SYdymAfNMmjEijhs
         wO1BVtIkgGCZuKT4RI9PhOtdDLQlB6vtNe4ByMJ2FO7m8xFhzpsmrLQPasXSIir/3oQd
         +7te/M29g382u8EpYBUAQxufkjj7yog9NCrZf5YwiGrb/WSyKMPnaPXBxgswplFCxJ+3
         mnYA==
X-Gm-Message-State: AOJu0YyRGn8uOeVWkpdiZCcWih0mnzXylXtVO/zMbX7XmjuhHjqWffDN
	bVZ8BHAZNzUzmgIgDuGx57I0BQ0JmqkRXLVxIA7pikLCLPtZivtRAh5h3GnkTloZjMpj20bAqNl
	53MATeYPktfaX9Jo/cxGJMmmNhw5WOJ6mYcdUe7uHS2+S
X-Gm-Gg: AR+sD11wxF9CStwoB8mx2pzZZIjirR1bNHtLDi9wqyxLsKOq9BjJR6YmIFoH4QJebqu
	q4Ci4Uj+Xr97II+1/ahBTOfxDqf9pdtUKErKZcBVEMMSEFSjk1zEiBaBKuYYXTnQ20oZ/9CpH3k
	r03YGPD0M+/lz7kp/Dmb/MwQuiqxrlwz0X4nfkaV7CMmcukYhbkbVAB6lwT+fj0rm/wE9rfGeeP
	JX6DzBWfTHAbIuzoj9X3gAMJsI8GV9zgQkH3lVFmwGk8Fgw2TVcCQh3PyPPvqO8sSBOSYS0IXFR
	bEjorpKn/Pp+GhjGmh8GyZjx1hhT2Wnl6/nZUoHiyXQ=
X-Received: by 2002:a05:6214:449e:b0:907:840e:bf11 with SMTP id
 6a1803df08f44-90a80b2dd73mr41893896d6.10.1786609430066; Thu, 13 Aug 2026
 01:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martiya Aryan Mehr <martiya.ar@gmail.com>
Date: Thu, 13 Aug 2026 11:53:36 +0330
X-Gm-Features: AUfX_mzpnD0-BCJzaC1FgOqy2Uo08eXqg0KTz77q3H10pSAuJb4RL8f1B6t6Igo
Message-ID: <CAM-sYPodAoU1Rr65=xMM_VZ8211ViQp1zC7eOZAOyx=0XzdHvQ@mail.gmail.com>
Subject: [BUG] Redmi Book Pro 16 2024: platform_profile exposes unsupported
 performance modes on 7.1.x
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am testing Linux kernel support on a Xiaomi Redmi Book Pro 16 2024
(TM2309) with an Intel Core Ultra 7 155H (Meteor Lake).

I believe there is a problem/regression in the platform_profile
handling on the 7.1.x Arch kernel.

Hardware:

Laptop: Xiaomi Redmi Book Pro 16 2024
Model: TM2309
CPU: Intel Core Ultra 7 155H (Meteor Lake)
BIOS: RMAMT6B0P0B0B
BIOS date: 06/10/2025

I reproduced the behavior on Linux 7.1.7 and again after updating to
Linux 7.1.8.

Kernel versions tested:

Linux 7.1.7-arch1-1
Linux 7.1.8-arch1-3

Reference kernel:

Linux 6.18.44-1-lts

The important difference is that Linux 7.1.x registers a
platform_profile interface and exposes four profiles, but two of those
profiles cannot actually be written.

On Linux 7.1.8-arch1-3:

$ uname -r
7.1.8-arch1-3

$ cat /sys/firmware/acpi/platform_profile
balanced

$ cat /sys/firmware/acpi/platform_profile_choices
low-power balanced balanced-performance performance

Testing the available profiles:

$ echo low-power | sudo tee /sys/firmware/acpi/platform_profile
low-power

$ cat /sys/firmware/acpi/platform_profile
low-power

This works.

$ echo balanced | sudo tee /sys/firmware/acpi/platform_profile
balanced

$ cat /sys/firmware/acpi/platform_profile
balanced

This also works.

However:

$ echo balanced-performance | sudo tee /sys/firmware/acpi/platform_profile
balanced-performance
tee: /sys/firmware/acpi/platform_profile: Operation not supported

The profile remains:

$ cat /sys/firmware/acpi/platform_profile
balanced

The same happens with performance:

$ echo performance | sudo tee /sys/firmware/acpi/platform_profile
performance
tee: /sys/firmware/acpi/platform_profile: Operation not supported

$ cat /sys/firmware/acpi/platform_profile
balanced

Therefore the advertised profiles are:

Works:
- low-power
- balanced

Fails:
- balanced-performance
- performance

power-profiles-daemon detects the platform_profile backend on 7.1.8:

$ powerprofilesctl

  performance:
    CpuDriver:  intel_pstate
    PlatformDriver:     platform_profile
    Degraded:   no

* balanced:
    CpuDriver:  intel_pstate
    PlatformDriver:     platform_profile

  power-saver:
    CpuDriver:  intel_pstate
    PlatformDriver:     platform_profile

Attempting to activate performance through power-profiles-daemon
consequently fails because the underlying platform_profile write
returns -EOPNOTSUPP.

The same behavior was already present on Linux 7.1.7.

Important comparison with Linux 6.18.44-1-lts:

$ uname -r
6.18.44-1-lts

On the LTS kernel:

$ ls -l /sys/firmware/acpi/platform_profile*
ls: cannot access '/sys/firmware/acpi/platform_profile*': No such file
or directory

Neither platform_profile nor platform_profile_choices is exposed
through /sys/firmware/acpi.

However, the relevant kernel modules are present:

$ lsmod | grep -E "redmi|wmi|platform_profile|processor_thermal"

processor_thermal_soc_slider
platform_profile
redmi_wmi
...

The platform_profile module is present:

$ modinfo platform_profile

filename:
/lib/modules/6.18.44-1-lts/kernel/drivers/acpi/platform_profile.ko.zst

srcversion:
1286B64F09D8B6244885873

The processor thermal SoC slider module is also present:

$ modinfo processor_thermal_soc_slider

filename:
/lib/modules/6.18.44-1-lts/kernel/drivers/thermal/intel/int340x_thermal/processor_thermal_soc_slider.ko.zst

srcversion:
583E680621918305EF374CD

The Redmi WMI driver is present on both kernels, but has different
source versions:

Linux 6.18.44:

filename:
/lib/modules/6.18.44-1-lts/kernel/drivers/platform/x86/redmi-wmi.ko.zst

srcversion:
369C9F3502463ADD78FDC0F

Linux 7.1.8:

filename:
/lib/modules/7.1.8-arch1-3/kernel/drivers/platform/x86/redmi-wmi.ko.zst

srcversion:
E64350B38255B1100E64863

On both kernels the system is correctly identified:

DMI:
XIAOMI Redmi Book Pro 16 2024/TM2309
BIOS RMAMT6B0P0B0B 06/10/2025

The Redmi WMI device is also detected:

input: Redmibook WMI keys

There are no obvious redmi_wmi errors in dmesg.

The relevant kernel configuration is enabled on the LTS kernel:

CONFIG_ACPI=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_X86_INTEL_PSTATE=y

The platform_profile module is therefore available on LTS, but no
/sys/firmware/acpi/platform_profile interface is registered there.

This makes the 7.1.x behavior particularly interesting: the newer
kernel registers a platform_profile interface and advertises four
modes, but performance and balanced-performance return -EOPNOTSUPP
when written.

My questions are:

1. Is this expected behavior for the Redmi Book Pro 16 2024, or should
unsupported platform profiles be filtered out instead of being exposed
through platform_profile_choices?

2. Could this be related to changes in:
   - drivers/platform/x86/redmi-wmi.c
   - drivers/thermal/intel/int340x_thermal/processor_thermal_soc_slider.c
   - drivers/acpi/platform_profile.c
   - the platform_profile registration/selection logic
   - ACPI platform profile handling

3. Why does the 7.1.x kernel expose the platform_profile interface on
this machine while 6.18.44 does not, despite platform_profile and
processor_thermal_soc_slider being present on the LTS kernel?

4. Is there a known regression or intended behavior change between
these kernel versions that could explain this?

For reference, the ACPI errors seen during boot are unrelated-looking
USB _PLD/_UPC errors involving the RUCC method:

ACPI Error: Missing argument(s) for method [RUCC]
AE_AML_TOO_FEW_ARGUMENTS

These errors occur on both kernels and do not appear to be directly
related to platform_profile.

I can provide complete dmesg output, kernel configuration, ACPI
tables, or perform a git bisect if that would help identify the
change.

Thank you.
Martiya Aryan Mehr
