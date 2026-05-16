Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E514F5E0
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778909223; cv=none; b=VI/e1wTCVBXtD2jC0oSMOORlMXMplSB4rbNNrkjfewO48Yry7nt103PeC1MkR4DaTTetZwvNXaR9KF8vzTN/gtx0ncY2L1f7s9jimicPR9YluaZ92Pei73GsbMoABIU5vFI/3VCyEm6+8OFyYCH6bdbMrwwjYnif28LjfSnNt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778909223; c=relaxed/simple;
	bh=r5pwNixhZF0iPZD4fZelruSCDRVBVEqUKZZeeDOtYtU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=t8iwjKdRrfndatPXKn+pBmrcOadoyVh7GQh4djAmsDMqTuCxaN0opPZFkklDt3Ot1WpQczU6FluggVQ7EZQpNCMG1i1p4gaNUjWOnqx0x8JODpLJ6JjJj33dMtKULIacC37wX/ad4XhUK7wnehH2Nxx8dJjoWq2U9L7MUTRHVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkE19GVc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkE19GVc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba4a1a0325so4290295ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778909220; x=1779514020; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4/KgBgy4dDxKBqEfIFfWYs4uhVav1KCc5r7s4FP0pY=;
        b=bkE19GVcpj06YhbpMAciuKcC6m9nDpEsPQ8iQ2r1ecycQeSuCpw7VQX9Em5qeY3jxl
         EtZvzPuf1aj+o6gEtvnj7jFtC0lEx3+XAXMLdzg37Y/xtFr5r5FIfNN0iIUg9sQt0C6j
         NsSaWOvLsnbs/eKg6yQUVdEBtlyd+8It4gtUvHzTFuzyQsTYM4Ve6FaXrskUrRU5YEpj
         ovFMMBJ1XiuesgjXIb49NXIf30K7ZCNQLfbKXSb2LBh73R2dpy6QwmCElCBwIVqGHPkl
         PpiH3PWZy9bNXs0eMCIjhCuA4dcyjpzO1JUX8k8FTcQ20r44NsOLi5LBI4Mx38sVdGdo
         kWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778909220; x=1779514020;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4/KgBgy4dDxKBqEfIFfWYs4uhVav1KCc5r7s4FP0pY=;
        b=aCPDv1VMo9aLQ9XuJjc/wRlqXd9w+f9Rp2md+nifzg/bbyLPGyrJCnBsgceBcX9dAF
         YFVRw1p/Ast0xwgchDePugkmdQTIai/HwUiH1eCOk6TfJeucov/u4ulMHHEa3NNvgViy
         O2S798e+Tcyyd4bu9xRlJS9rCHKQu8RhskLOQrT9O9otGhQnP59txVW5kRpPO6yd1xI7
         DSZRfsD6e+vGEO1WoHLGDbyLLL7GezjTdreXcu14ZBWTT7+fg1FaJAZANL1M7LiJ2g5R
         of835j+pwsJA8IBZlTmVGDf2p/ch+4Q98P99kseEZDuntzxjktLC+cWo+8he2w1BnLve
         mLTQ==
X-Gm-Message-State: AOJu0YyP+sx1hN0h++Z4rpeVJEh9bgf9hPxvl30R7X4HdZRzzqxnvknE
	6d1MzX2rpB7052fiQNt0YoziVG/3RcT4qWSCUQ0T1nrAuMF28sRhtJSGEp4zn51n2Ro=
X-Gm-Gg: Acq92OHydAarkLsUXosWHWgrkILiDARZ8Z4jG8Kx3J41mjCUloAloZlVyc66iZptIvO
	abt/UVlQCU28TKv3rkBJmfD0FWoLLydoTqBpe/j2AlkBlcbO9OiQdF+vjZp9FE3tQwph5FABeMO
	HKZ2d7oARgWnW+K7qGgjDVIGpnJGLNRO8yBnpkXpJJ9tqYG8FFE+9/C7l9XYAWU61aZGu67jlfI
	SPKUnLC9iRtn8woX/FTotpywnOJYUdze3aD7oYneH7rSBd2rqmNr+yaW0Kg214uctIBF0ZOW2eE
	kARtuzoMncT/t9DU+BRJQ6CPol+Ea2d2O2izCLXL4qWdtnrDMjHEOPL5YPf/seHuVWsCXxTCbWQ
	vg63HcoNtwld63WP4F2DvuX8/hEtTrfxjLWsS/iOddyCnTDh0aMaCS0tc0eLp3KlG4QimVy9LZj
	3v1zy/AveSeyCw9MKezGxLdi7vN3+LhKPHvqRb7qAsorWKgjIIiOLHDkqYtEhNBMUmG0ys2BR0E
	2L6gzhSYS0H0f0AFkgXawwdRO3Bq01c
X-Received: by 2002:a17:902:cec7:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2bd7e87ed84mr77006875ad.24.1778909220408;
        Fri, 15 May 2026 22:27:00 -0700 (PDT)
Received: from [192.168.101.5] ([103.10.119.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm82951805ad.82.2026.05.15.22.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 22:26:59 -0700 (PDT)
Message-ID: <80491e5a-1ead-43ff-ba48-6596b29498ce@gmail.com>
Date: Sat, 16 May 2026 10:56:54 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: platform-driver-x86@vger.kernel.org
Content-Language: en-US
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, ikepanhc@gmail.com,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, maxtram95@gmail.com
From: Sourajyoti Basak <basak.sb2006@gmail.com>
Subject: [BUG] ideapad_acpi: fan_mode values 1/2/4 all trigger dust cleaning
 mode on IdeaPad 3 15ALC6 Ub
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

I am forwarding a bug I initially opened on Bugzilla (Bug 221353)
regarding the ideapad_acpi fan_mode behavior on the Lenovo IdeaPad 3
15ALC6 Ub.

Note: This is the exact same hardware I recently reported regarding the
EC thermal throttling limits.

## DMI

- system-manufacturer: LENOVO
- system-version: IdeaPad 3 15ALC6 Ub
- system-product-name: 82KU
- bios-version: GLCN46WW

## Kernel

Linux ideapad 7.0.8-1-cachyos #1 SMP PREEMPT_DYNAMIC Fri, 15 May 2026
18:31:42 +0000 x86_64 GNU/Linux


# Description

According to Documentation/ABI/testing/sysfs-platform-ideapad-laptop

fan_mode supports:
0 = Super Silent
1 = Standard
2 = Dust Cleaning
4 = Efficient Thermal Dissipation

However, on this device:
- Writing 1, 2, or 4 all produce identical behavior.
- Fan enters a pulsing high-speed mode where it ramps up to max speed
and then ramps down to 0 RPM about 10 times. Consistent with "dust
cleaning" mode.
- Only value 0 behaves differently. It changes it to the default/"Super
Silent" mode.

Here is the observation table:
| Input | Transition (immediately afterwards)   | Finish (after 1 min) |
|-------|---------------------------------------|----------------------|
| 0     | immediately 133, minimal fan activity | 133                  |

| 1     | 3, enters "dust cleaning" mode        | 5                    |

| 2     | 3                                     | 5                    |

| 4     | 3                                     | 5                    |


# Steps to Reproduce

1. Switch to a fan mode.
- echo 0 | sudo tee
/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_mode
- echo 1 | sudo tee
/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_mode
- echo 2 | sudo tee
/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_mode
- echo 4 | sudo tee
/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_mode

2. Observe that all of them except mode "0" (a.k.a. "Super Silent" mode)
make the fan enter the "dust cleaning" mode.


# Expected

Different fan behaviors per documented modes.


# Actual

All non-zero modes behave like dust cleaning.


Best Regards,
Sourajyoti Basak
