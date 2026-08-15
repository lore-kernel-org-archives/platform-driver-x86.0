Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390735E1AA
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 07:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786778155; cv=pass; b=UsKk2eHPXR+JgDj4Fay7v+c2TiFJ72qnBm/6k77lZ9rucjYr6dvhoYj3fn97dQVC+pSYRyXXNuJg04KK0xy6PAFoUJtd3+RL2xcUfsAbLwn+bivwKsQmsQnA/cGtm3MPuYZHVUuhh2QuvKf1UM4inAtg6gDEaHRFfTCuvLmmK5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786778155; c=relaxed/simple;
	bh=CwrkqsJcku77ZhPBgigswgHH79R63wAvfGhINcl6oXo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJ4wHmdG46+0RFvejlBJKbhMi9wLCxozEXqx/g6dzk2QWLePRnvTInmxLlqLfVLfrAQgoXEQqj1DozhfmqU4K34576mjuiPSAdrS4OE4+914xhTdeou+Tv7Hdfe4LzLUu/forTdiFIBV8crXIy1/TEoZYhtLlphhimMFhywIWQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlXpDbjf; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlXpDbjf"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1323272a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 00:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786778153; cv=none;
        d=google.com; s=arc-20260327;
        b=lZgyQ8L6/VL58EEgKXEEVNIH5f50repsd5eQziPA/DUWNIMuVelFKeOkJrIDrNf2Rm
         4o6LSfVNdBF69eyljse/3nInz8EkS6upkJ+Ij4GqgE6m4GF/BozVxuPJ7COLweLOrNRc
         enOhEsFTNX+XgZKlVcm7vUb/t7hcuINSmDWB/FFvJDQRs3ZwmKSS9jotbfdnhyoUgvrV
         pLBHEdjnpqgqYGObx0ZfbCkcGxC67P1n0MKEFQqL8Im8T5NL9VewtQ8fQXNTphvQrcbu
         rTh1YEBTnwfxD+WCBmVOX8WuTEK0x5dA5vnGoLWELliD5iFB9FYUT7KrNEtITHuumwbt
         5X+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fkJy882kfaqhi1BSpDZnecPrcMCThmrZYPst9C10buw=;
        fh=UKwCrCb3bwA7jqxKoiS9E2kXG31mUqAUJGDHt6Cwv0A=;
        b=Lb/KnqyMU/wnfIQHQ/JNAcQb5RQIfBPF8sJx8yYmPSCkiZ9Q7lRzrrFWHmM436eOfv
         VGzXSWa7O2jaUvXBt8i7anhHJCB6EyNoU0lYVh7LTi4jkIgB4JgL48pBI3SKZCniFP8L
         rZDVhKBs7rkw6Lowj2hxx2ZWoHig53OB2Q4skY3ZDVnEE1iffLWKo/JbY/xSJWzQQtCS
         Cpx9KoNPVcUaXq5R6P1wvlZwI1CtLzaMWLG6iBrykZKavJ8dWv63X4SI8nEng/Z9Zw0E
         9NjCpFG4dxgNuhzh+yVsottmcpxFmJ8nTyVV1Ag/1FsJmBBuXm0fAjWL512pN1ZzXDLl
         OTig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786778153; x=1787382953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkJy882kfaqhi1BSpDZnecPrcMCThmrZYPst9C10buw=;
        b=hlXpDbjfiaEQ52l9CwHc7/GHohpKKDXaykB1wcrnlwoTQ7H9+A6xQfk7K4gRI4Jo0i
         QKDByl+14l2tMiK6m1ySqARs82E/YJ+MaSCoZXz95FwAOVlXKAAvod3wOOb68OR9QTir
         AYw/ujdf+AE3j3cONiQB+1TejL0qorcc6V+T1/pxeZfs3SXuaVq3SdDIjZvW1mB/N0Yd
         TjLN6OnjudiQBBpeuxB3oWBIh2l0dAA97NmDjH1Eykmd1s3dOaOZyGKSKruJYRJ+icAL
         asb9HNwIA7oVAjKTIO7OXqD3rVKal8TiP/A/7IHOav9NeOskgtg6gtMNewotGdxExA6I
         WYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786778153; x=1787382953;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fkJy882kfaqhi1BSpDZnecPrcMCThmrZYPst9C10buw=;
        b=fblg56ArGw9hPxkBVS5ma3+U78UoDJHmfwZ87NjcH3ohoWFwAHmO6Pf8/gx6lLey+2
         RPCubXpaiWjxB7BiwOGJBmRgtHukAtrjls4zT6pbId6ASwLjrXGqz2EwAa41e2lGjYSl
         Vc3wZ0iX1c4uS8t0v0EcU6GyGUmMaqYK+Rtg5H8q/VeW+EfoylolADSIzbhY+HnRK2ZM
         3xWOPgXSQB7dgR7RHGIcAQ138/2NzmKHgk0HBFBpoD+1pUcuND1GvD0GiGXgZopHNTKO
         k+onSRZtlfpMbBwwocAA5fT4tMOxL0SRN3S0h12vgtQti2Qb1VrL6lOFPQ8pQ4jDinTA
         ql/g==
X-Gm-Message-State: AOJu0Yy2CM7A7ZfmGqCcwgFUWPX3AQ4oyBzXKs1WvINvDKHIiZbJCfE0
	plNMuqAaa8fH2B0coy9V3BeoWM7126xvA0xRp8Datc3vM6lumaNDDPs8qPwzdNHpTohJ428ohTa
	SwKVrT/2S+dI5hpXlSzY1L7rxvzZCqhs=
X-Gm-Gg: AR+sD10YiYa55RfGyeQGYGgb4x27kPhkoIIQL9oxMuSXyF3E9UM+yC/pCG7Qomv1+WT
	n/uDoL/bjphkcgHa46LmEGJk2gfuQgVKO+TdvaRQ/XmVziN3f6XAqe8JtRIIanzfEB61yR1IUjr
	AvYapcfsh/iNdN/xiHcP40wWP5G9T6a6y+0PEzv3xwCCrvkCp1YUvIw6q+6idr5cm0NYjlTbCLc
	mQvRJcTYDFFu2nWYw3UKgj3Bw+cSxmtOLN32o2FuxzBfYREacyo9r37xkazW4/Np8W6FotoTKMu
	DWaGjJTCiyrUUotXg1u3DnzxgI3ma4gpZoaqmRJ/CdRFIIY=
X-Received: by 2002:a05:6a20:b40b:b0:3cb:b5f6:43d4 with SMTP id
 adf61e73a8af0-3cc71d5c2f8mr13773436637.23.1786778153119; Sat, 15 Aug 2026
 00:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Sat, 15 Aug 2026 09:15:41 +0200
X-Gm-Features: AcwNN1UMiwHkkQedO42J0f9A2P1_EPV-tNKUzO7dVDUgBJAv5_EhAszuHJUexIA
Message-ID: <CAObHBTxG=SqO0ZVJ6r0zyaQq3acasTUyj1Sh=H9xexgit_GiZg@mail.gmail.com>
Subject: Re: [PATCH v11] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
To: qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for the work on this driver. I'm testing it on a laptop that isn't
in your reverse-engineering set, and wanted to report that fan control
seems to be a no-op here even though everything else (sensors, gpu_mode,
platform-profile read, kb backlight) looks fine.

Hardware:
- Model: Xiaomi Redmi Book Pro 14 2024, board TM2307
- BIOS: V24C1, dated 06/10/2025
- CPU: Intel Core Ultra 5 125H
- Kernel: 7.1.8-1-cachyos (Arch/CachyOS)

Problem:
Fans (CPU/GPU/SYS, as reported by the bitland_mifs hwmon block) never spin
under Linux, even at CPU package temps of 62-63C (coretemp). Confirmed via
dual-boot that the fans work correctly under Windows, so this isn't a
hardware fault.

What I tried:

1. `fan_boost` sysfs attribute (WMI cmd 0x14, MaxFanSpeedSwitch):
     echo 1 | sudo tee .../B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4/fan_boost
   - Write succeeds with no error.
   - fan1/2/3_input under hwmon (bitland_mifs) stay at 0 RPM.
   - No audible/physical change.

2. Enabled dynamic debug on the module to trace notify events:
     echo 'module bitland_mifs_wmi +p' | sudo tee
/sys/kernel/debug/dynamic_debug/control
   - Confirmed pr_debug call sites are active (bitland_mifs_wmi_notify,
     bitland_mifs_wmi_resume).
   - Retried the fan_boost write with tracing on: no notify/state-change/
     WMI event lines appear in dmesg at all in response to the write.

3. Tried the standard mainline ACPI fan interface instead (bypassing this
   driver entirely). 5x PNP0C0B cooling devices are present
   (cooling_device0-4, type=Fan, max_state=1):
     for i in 0 1 2 3 4; do echo 1 | sudo tee
/sys/class/thermal/cooling_device$i/cur_state; done
   - All 5 confirmed set to cur_state=1 on readback.
   - Still zero RPM change, no audible response.

4. Noted a mismatch: the acpitz thermal zone that ACPI trip points are
   bound to reads ~27C (presumably a chassis/skin sensor) while coretemp
   reads 60C+, so even automatic/EC-driven fan curves triggered via that
   zone would never fire under Linux regardless of the WMI driver.

Conclusion so far:
Both the new fan_boost control and the standard ACPI PNP0C0B cur_state
override are complete no-ops on this specific model/firmware, with zero EC
acknowledgment visible even with driver tracing on. Since Windows drives
the fans fine, the EC likely requires some additional init/handshake/
enable step (that the Windows vendor driver performs) which neither Linux
path is triggering. Given the driver's docs mention it was reverse-
engineered primarily against Lenovo-rebadged Bitland units, I suspect this
Xiaomi/Redmi variant has a different EC command mapping or requires an
additional enable call not yet implemented.

WMI GUIDs present on this machine, for reference:
- B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B (control methods, hosts
fan_boost/gpu_mode/platform-profile/kb_mode/hwmon)
- 46C93E13-EE9B-4262-8488-563BCA757FEF (event notifications)
- 3F9E3C26-B077-4F86-91F5-37FF64D8C7ED
- 1DCEAF0A-4D63-44BB-BD0C-0D6281BFDDC5
- FA78E245-2C0F-4CA1-91CF-15F34E474850
- 05901221-D566-11D1-B2F0-00A0C9062910 (multiple instances, standard BMOF)
- A6FEA33E-DABF-46F5-BFC8-460D961BEC9F
- F80A5498-23F3-4053-A244-B39067EC476F
- 1F13AB7F-6220-4210-8F8E-8BB5E71EE969
- 2BC49DEF-7B15-4F05-8BB7-EE37B9547C0B
- 657B6048-310C-4A90-A211-10A17922A0AF

Happy to test patches, dump ACPI tables (DSDT/SSDT), pull the Windows
driver's WMI call sequence via API Monitor, or gather any other debug
info that would help. This looks like a useful data point for broadening
hardware support on this model, so just let me know what's most useful to
collect next.

Thanks,
Milos
