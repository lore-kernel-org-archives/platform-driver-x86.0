Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3540DB5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422011; cv=none; b=KqGQfFiBxPWtBFQD053iPjiej8S51ykqFUnSrpbqdJNUwYGkyj1mVmYQ4jojeZT+kHRN6b81uWcrBDUAIS8GgFqAY2PX3ph5U9l+cvpdeN8X2eZNuNGJQag4FZqdRDQte7FKIUy/6LAijYgSxr6fmD0bocLGNd02Tf3zko7BlPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422011; c=relaxed/simple;
	bh=1009E+OV49y9ei1QpwSQlS0Y23MikCdVe5F5Y36Ggls=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Ho0yDbVtKn+l9YCF3IuOMw8v31+uZoMJC5FSCsYAuAixz/7ZnvHjNB24NpsYQTy/dU/K7OlYCLBwwEliRyox3dRmUnDtO4/PilB1fZ2oeGkStdpG+w3I6pk737wVZx7EqZwXU0MrjbiJsPupGNl/jzUzPNzipz3O4rbxCb2w30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTph+3Su; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTph+3Su"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso418634f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790422007; x=1791026807; darn=vger.kernel.org;
        h=content-type:mime-version:date:subject:reply-to:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHPaExtfhluSdFU0L46Z8nZGmiV0E/2V9Ek+p9fDWZM=;
        b=QTph+3SuY9X7QpKZJF7A9o1vCffV/4nZPtqS4DhbpLFWPasGqyYny19CSHrNVUf0J2
         0xH7Wl7Alb0y6OMhsnyXOahXX5gwPTWP396rxgw7LtkI+I4xXu+0ZB4MtGqvevEoOikh
         jOj8P+dOftkdpfBZpVnLMN3QWgNRdKuckVOqi9PtXR3BqfXI+kBjCMraEBcBt1gt23dD
         QuRkqDvGcJPxplqCkTFFiGjdWCZ9rWJ0kPHIaM20WfXA0fRDjdUd+Irvc4IIzL1m/F3P
         jwKIp3juqwY+vyet6p79W7yv2LfIbpbF11ytnF2gEs85yAXdmqt5xveLw8k5jWehxppZ
         jUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790422007; x=1791026807;
        h=content-type:mime-version:date:subject:reply-to:cc:to:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHPaExtfhluSdFU0L46Z8nZGmiV0E/2V9Ek+p9fDWZM=;
        b=BQ1urxn7vuua9zbeq5PFmvwq++xVjl8Be/KaCRW3x6MQ2KdHdFkQKOE9vy7T4b8rDg
         kGX1S/5ELqWJE/NJbmgmJmpMUD9aCO/MWBUiqNhax75+bkR4SCT4S5mP1swpKsgbcp/Q
         /GupavDUI0DcJ3gb7+jmaqKt1V4lemYCdcdmU11Ye3tkpzVijMGsj0d3RYnQlJVxMd5N
         BEXaE7SQVJmdSv9ztJULtFit3OOtCtAPOA934ZWG8VwPHyjLx7xO6SjVV4AsLnITuI1K
         42ojxyFVthCnx0bwiDK4a32SS7nN+dQr3D2Q03sl6/XRXvcxHznQOgc5wnx11OtNwCxU
         twTA==
X-Gm-Message-State: AFq9FYLiCJQp6cNcpZ4IwijtjcVZFRdzj2olmDbPmN7U0AjH3jyaRLT0
	A7A2oAuJbIFraechkKE09SNmJfdECbs36T0mzyCIoQkJW23r64COnHtipWpjeA==
X-Gm-Gg: AYBFou1WFSic3HpmHDkSIjzLtyzJ8ScczYZGSmqRNpnnANKnxDwl8XKg3Yj5R3JujGj
	21TA+Yzuk/UZEUL20adlyy/S7wEG/fX1r13Egij7kwEpvdF+gUQeIpQYDJKygw+nVknbQv2cNhz
	HkJorKFuiQmJkFAIq88oRBl3KJ+b/9m2V1OFYjCYGu14SdP/4b9UX86B/ZKgg/S8LxXLtvYUA8n
	P7FBBlAisz99fkAawHSUHP5DVYLTn5G7iKhckndgOn+gf3y9VUqjLBnWF1uw3Bj5y3SfdXbznkp
	X56AEJ0XVLzAKohbwwVzae0tXvr7ZgURuNZK2VJltWRUoxctmj26wxiprDkTusA99wLk9PcIGMI
	S6ro08QyPDDkqrUCL1lUZK0mlu057rGAvpuJfvwKOi44SvBUHY85grxRWRLnRqWG+G93Mnowb/U
	a84X2tmRMRy9lxtOWY1lQnfeauteJUl9NRj5cbgBLxPpYFzSaDec4NnRxzPIx8+WBrTgEO4aIdO
	89yNoHIUR+v3EnYadGFxD16+czEvJ+iORgu3djSnXc=
X-Received: by 2002:a05:6000:4a1d:b0:487:1470:52d9 with SMTP id ffacd0b85a97d-4887d9fa527mr8926154f8f.3.1790422007420;
        Sat, 26 Sep 2026 04:26:47 -0700 (PDT)
Received: from bugreport.eml (211.red-79-146-43.dynamicip.rima-tde.net. [79.146.43.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm13310130f8f.37.2026.09.26.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:26:47 -0700 (PDT)
Message-ID: <6ab7abf7.09148f95.17f923.ff4b@mx.google.com>
From: calvitohq@gmail.com
To: linux-acpi@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Reply-To: soytucalvitofavorito@icloud.com
Subject: [BUG] ACPI battery: BAT1 status "Not charging" and capacity frozen at 99% while discharging (ASUS TUF A16 FA608UMI)
Date: Sat, 26 Sep 2026 13:25:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Hi,

On an ASUS TUF Gaming A16 (FA608UMI), running on battery, the ACPI
battery reports status "Not charging" and the capacity stays frozen at
99% even though the battery is actively discharging (~11 W measured via
current_now). Expected status while on battery is "Discharging".

Hardware:
- DMI: ASUS TUF Gaming A16, product FA608UMI (1.0), board FA608UMI
- CPU: AMD Ryzen 7 260 w/ Radeon 780M Graphics

Software:
- Distro: Bazzite (Fedora 44 atomic)
- Kernel: 7.2.4-ogc3.1.fc44.x86_64

Symptom:
With AC offline (ACAD/online=0), repeated reads give a stable (not
oscillating) "Not charging":

  /sys/class/power_supply/BAT1/status       -> "Not charging" (stable)
  /sys/class/power_supply/BAT1/capacity     -> 99 (frozen; no change over ~40 min)
  /sys/class/power_supply/BAT1/current_now  -> 617000 (~0.62 A, ~11 W drain)
  /sys/class/power_supply/BAT1/charge_now   -> 4379000 (frozen)
  /sys/class/power_supply/BAT1/charge_full  -> 4424000

UPower consequently reports state "fully-charged", percentage 99% and a
bogus "time to empty", so the desktop shows no meaningful percentage
while actually discharging.

This looks related to the existing report for the ASUS Vivobook 18
M1807HA (Launchpad bug 2152185), where status oscillates between
"Discharging"/"Not charging" while on battery due to inconsistent ACPI
_BST values. Here it is stuck rather than oscillating.

dmesg shows:
  ACPI: battery: Slot [BAT1] (battery present)
  ACPI: battery: new hook: ASUS Battery Extension

I suspect this needs a DMI-matched quirk in drivers/acpi/battery.c to
force "Discharging" when no AC supply is online, as suggested in that
earlier report.

I have the DSDT/SSDT (acpidump) available if needed, and I'm happy to
test patches.

Thanks,
Marco

