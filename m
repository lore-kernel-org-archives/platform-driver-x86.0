Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955944;
	b=b65ju9ZeELMegFViCSBbLKBb0z0f37/MpC+6JO3ko8wIxkFcuHHCdgR887Kf1gd75/TH
	 JNsiw2wj13aqBnhGiDBqc5YUl+c3d+7SMEpDCFTx9HPwGf9CFK/g7gWJ826cK9ta+cCL9
	 +zu82itrbmeKjkY/wzaxHdkdisXh72jS7c9aWmTRXx9v+Hg/gx8k2xHdITYyEhOjs94x9
	 /acX05ken2hdKK4A/D5MAXyo0UWqZ+xYY5QtHlLH5TwYZ8W2mYH+sXjamvElcqPyAdtDC
	 0Dp373PnOTDWbLjbssmA/BVPDkcHgkdChVZi0oMoYNBs0m1Ys39yyFmF/iEn5oKQ6UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nAXqlha57/BySkBu84yaIoC40sFnXR9x2ALMrfUK9MM=;
	b=pvjTmwq/bN1U40zeNFfhfMaAU5Gs9lwyAUreXz95FsMi1/0dA8UALOC8TAv7cstdcg+Y
	 /P0m6eK2YBlQXEyO7KajvhWtih2Ya0ov8z1b23lHVx2RNHz+PwUgUzJVHAfETmzZyVBe/
	 TRmW3Qt1c2ZJ7ZBe9JX/owP7lRCU5yi7Sxx0DLk0y12l0ObBd0iQ6pjCk9GU1AbmMRtML
	 tcbHjUSs27c9Fg0k8b3y2/Jw1xhuUl8fFIoB4Jn6SumZ9ufQYWAn7GdpUv/Mxqxe2D+n3
	 ESdpAxsfGBiH3FnOK1U/LgxmtZ1KUTC8mLf/hc2m2DKCWcY/hAqIX6JEe37KSxxGtOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlzYWFN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6B606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlzYWFN0
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d07494b0so18840547b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 14:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955942; cv=none;
        d=google.com; s=arc-20260327;
        b=oGO8p1jFnN+ktoYCPwnOw5NdY6Nehc26McTPI0ovamgtBSq5044p+WTZ0XxjlUJ+o3
         MDjIwvbOs12ohNmoeI3LtkIjNONM5uL3u+I+RQHBsT18jEyC+VVofbb+RwVxwUXDoWOm
         Vb+XZ8qLQ/iJ6WY7UTZHZblwI2hvoXpDhMbZJy28ED8fVOm+K0tj7pe9byi0bPNEHc9z
         LgyIvpW8SGBOvghDaJINjeaQYdpKaD/zph3BFb9XbOzOnHmsxmyEtQnCJ59ikYYe7hdd
         cGd1Tjyy71WSxCvXpk02g5RqxBppDTdxymBbEFVJBzZvqM+oPZJLkhFliauQ4Nw2SyCr
         LDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nAXqlha57/BySkBu84yaIoC40sFnXR9x2ALMrfUK9MM=;
        fh=4zCxmfUAYXFKWlhrg3yega2iIWJe7umuyYnue3h3g2g=;
        b=JselJOknvyzoBxO6kJIUCCcV0x8O6psKROhLBaJ9uvgsQsvOW7Q4gLqp+9gz8tuc6N
         gz3OOHy8B5q8UyW4nbk2KqHMla7ziGNllM30ixQm3+RNkYAB86Z1+l1NEY4LHuVXvrZw
         XrRu0DIzBRFw8VZqVVvXk+nkFQmnJVKRUhs9zdO04zRzpmgHfBBpNXBeaSLx5IbtfgZE
         jsIVQTfiN7M+TrgcIn46tDeckT3Y088mF7x2j/pbZLkK0ajcM+lg78RB0NkbumKnP8ma
         nFEyRLfF+OafYEQ5g+XJhL7AmakBwjHCCBuCv1dK++7nR9CJufwmPrQVLlod7XXkiplh
         t7Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955942; x=1795560742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAXqlha57/BySkBu84yaIoC40sFnXR9x2ALMrfUK9MM=;
        b=HlzYWFN0UnAINJ+f8PX3s2UsJJFwkvU0Jt/TX/TzRzI8lEiTvP+Dnt3KkFgO50xyTx
         vFMAtPYkvy0fCWAPHe1TbDOVzw5fb+/POuSJ4sQxtyms8fEHM0HRrdFmnmHlEkEpCUzp
         Sp/BnZqz3p5Hk9M08yn/tjU/qc/y3vEh5gleMba76yLDSKIFxUWTbsLOm4CDVLgouEqA
         NhV3OxOLJI10KU+SfUqiOXP2NMU3jkg69Vu1jTOZPtAG8ux5cZCAUu3+zT2vL4YS9zaI
         1WKgXjMQtbjeHB7w2Qg8iUmPmRiOVHKO+oWTYu4ojJ/T4TeTMcsCyJ5+B/k0eXr14cci
         zdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955942; x=1795560742;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nAXqlha57/BySkBu84yaIoC40sFnXR9x2ALMrfUK9MM=;
        b=ezPNG3I30RrzR8qMyf87NIGuH3RMJgMKYkk71O7ErVXVW+tXzz+qxTtqUwitlH0Uwu
         MUvd+f+k4Fj9PJAWSZKcHjPFuN3JC0enZuPB7HaaH5/OQjD9kuL4ZRs5tI/82tVpCx5L
         m25DAJ7gRUy1kq1Kl0PynmiNXRjXWyjPGhjGQ1YbyZ0U9ehgBgrqcou0lBHdiS0aRmSG
         mV1JUzQB7Auzso0DwffIJzQQWiiqzKKggEFGLKtGD2RLL2vqh3g0bgOzOZgv5EEWHt6F
         iOCYksLp56kfHMQISgEs4dLsPnMoFuhd0v3ZGbx86uaqrV+DwRmBClFZGm9gygkUeunH
         0CHg==
X-Gm-Message-State: APuU4Z949Z8TVbQtIwukwnFn8RhRVCIMsw5GcSh2E7GlJ12Fcor/NM1X
	4/MMTbXhhCOiEWcWBbMTt5WcrdiZg1KiYWdPq6Jp7cM+jZFDBjWS9Rpc//WU8DkL5exvLYG2cFL
	XnakPH+epYEm/dvy7ShhV43wGassuG7KQFraJ74arUQ==
X-Gm-Gg: AZFdTZe6IQ5B3TENo7h23NbfaKphUjE2Qm6zCnu/HJJVS/Sh1+o479tupobbCqx3USS
	2DKvz6ylJxSVi5lmGHnRRchGoVayiQ7vHeq/Ska0kxDH5c6kVzJt9jIMlL61YjtR8yWqsknzCuv
	sZqwTkO26YZxSax4VLeJDdWrFvWYa1Lsck5h/Qu5/kcXo6V7mb9nZB7ZOIIXDsyrM0Zv8GHzDlR
	v7geOaxdbYmjs7MTaRVVRxOnxnwv8R/kliQ56kA1ZoRQXGaAoykjFZw3tJKRxRQQX94UKroVzVZ
	U+fEOYKkR+TxOMF29BuSnpvx0HiIKdwIi7mzp/9nbbqhY0cozNlyF05tiTulO8QQVZdbq4XVIOC
	jDy4tcKkryBPkz5Y+2L3rK9/Uj3Sai6aZoyMYU9kEyhjCgWfVuhSgDtuZblw=
X-Received: by 2002:a05:690c:607:b0:8b2:26d5:7878 with SMTP id
 00721157ae682-8b4fed748e7mr3622077b3.25.1794955942073; Tue, 17 Nov 2026
 14:52:22 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ali Aliyev <aliyov.code@gmail.com>
Date: Tue, 17 Nov 2026 23:52:11 +0100
X-Gm-Features: AclHuK9gh5u11yy94495WShlr5adp6cSc4zpxXnRJin2PUJqvRnPNk1fGNoIdhU
Message-ID: <CAMKDk=m+B2cDgMmBH4w2z-ei6=W6ZU3KRaP+qdOpMstaO246pQ@mail.gmail.com>
Subject: asus-wmi: UX535QE BIOS GPU_FAN_CTRL (0x00110014) writes the CPU fan
 EC byte
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On the ASUS Zenbook UX535QE, the BIOS implementation of the WMI device
ASUS_WMI_DEVID_GPU_FAN_CTRL (0x00110014) changes the CPU fan's EC
control byte instead of the GPU fan's. Requesting "GPU fan full speed"
therefore spins up the CPU fan, and the GPU fan stays on automatic.

Machine:
  Product: Zenbook UX535QE_UM535QE (board UX535QE)
  CPU/GPU: Ryzen 7 5800H + RTX 3050 Ti (fan is EC-driven; nvidia-smi
           reports no fans)
  BIOS:    AMI, UX535QE_UM535QE.310, 11/21/2022
  Kernel:  7.2.13-200.fc44.x86_64 (Fedora 44)

DSDT (OEM ID "_ASUS_", OEM Table ID "Notebook", rev 0x01072009), DEVS
method of the ATK WMI device:

    If ((IIA0 == 0x00110013))                     // CPU fan
    {
        Local0 = ^^PCI0.SBRG.EC0.RRAM (0xCC, 0x30)
        If ((IIA1 == Zero))
            { Local1 = (Local0 & 0xFFFFFFFFFFFFFFBF) }
        ElseIf ((IIA1 == One))
            { Local1 = (Local0 | 0x40) }
        ^^PCI0.SBRG.EC0.WRAM (0xCD, 0x30, Local1)
        Return (One)
    }

    If ((IIA0 == 0x00110014))                     // GPU fan
    {
        Local0 = ^^PCI0.SBRG.EC0.RRAM (0xCC, 0x10)
        If ((Local0 & 0x02))
        {
            Local0 = ^^PCI0.SBRG.EC0.RRAM (0xCC, 0x30)   // <-- 0x30
            If ((IIA1 == Zero))
                { Local1 = (Local0 & 0xFFFFFFFFFFFFFFBF) }
            ElseIf ((IIA1 == One))
                { Local1 = (Local0 | 0x40) }
            ^^PCI0.SBRG.EC0.WRAM (0xCD, 0x30, Local1)    // <-- 0x30
            Return (One)
        }
        Return (Zero)
    }

The GPU branch is a copy of the CPU branch with a dGPU-present check
added, but the EC address was not changed. The DSTS side is correct:
it reads CPU RPM with RTAH (Zero) and GPU RPM with RTAH (One).

The EC has a separate GPU fan block that mirrors the CPU block
(CPU 0x30.., GPU 0x37..). I tested by hand, through the BIOS's own
RRAM/WRAM methods:

  EC RAM 0x37 = 0x8b (auto)  -> GPU fan ~1900 RPM
  EC RAM 0x37 = 0xcb (|0x40) -> GPU fan ~5700 RPM
  back to 0x8b               -> returns to auto cleanly

So bit 0x40 of EC 0x37 is the GPU equivalent of bit 0x40 of EC 0x30,
and the BIOS method should be using 0x37.

Impact on asus-wmi: because DSTS reports 0x00110014 as present,
asus-wmi sets gpu_fan_type = FAN_TYPE_SPEC83 and exposes pwm2_enable
in the asus hwmon device on this model. pwm2_enable_store() calls
asus_wmi_set_devstate(ASUS_WMI_DEVID_GPU_FAN_CTRL, ...), which goes
into the branch above, so writing pwm2_enable changes the CPU fan
(EC 0x30) and leaves the GPU fan unchanged. fan2_input (GPU RPM) reads
correctly. pwm1_enable (CPU, 0x00110013) works as expected.

Tested on this kernel, with the dGPU kept awake (power/control = on,
runtime_status = active), idle and cool:

  before:               fan1_input 0     fan2_input 0
  echo 0 > pwm2_enable: fan1_input 5500  fan2_input 0   (after 6 s)
  echo 2 > pwm2_enable: back to auto

So "GPU fan full speed" through pwm2_enable runs the CPU fan at full
speed, and the GPU fan doesn't move.

Two smaller things seen along the way:

- When the dGPU is runtime-suspended, the BIOS check on EC 0x10 bit
  0x02 fails and the method returns 0, so every write to pwm2_enable
  fails with -EIO. On this machine the dGPU is suspended most of the
  time, so the attribute normally just returns I/O errors.

- After both of those writes failed, pwm2_enable still read back 0
  ("full speed"), even though nothing had been set. The value shown
  doesn't reflect the hardware state.

I have a small out-of-tree module that works around this by calling
\_SB.PCI0.SBRG.EC0.RRAM/WRAM with address 0x37. It only loads on this
DMI board and refuses to load unless EC 0x37 already reads 0x8b or 0xcb.
I'm not proposing it for mainline as-is. I'm raising this mostly so
it's on record, and to ask whether a DMI quirk in asus-wmi (skip or
redirect GPU_FAN_CTRL on UX535QE) would be acceptable. If so, I'm happy
to test patches.

I've reported this to ASUS as well. I can provide the full DSDT, acpidump
output, or EC RAM dumps if useful.

Thanks,
Ali Aliyev
