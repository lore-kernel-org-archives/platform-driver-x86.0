Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD3285CA2
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443582; cv=none; b=im3kEyA2FBg1ytZZOnf8rpv/nAa5KDKcLbdjgIY0vLoNKg4g+SXWklfxI+RrRtenHv02khL5dmzsZKpXtOy5G9/oigi2xImU7msGOkRBXkeOZ+8cJOaa8mYfLVVXdXylNrmW6h+Hz46XzMPe7LHv4Riov05fRfeagHnTiteEouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443582; c=relaxed/simple;
	bh=J5OgcCFwnIrfrY1lDLbmiededcV0yPWST+7OK4/Q97s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5ojvyfFwqIZGcaAy6wuCVcUudVCpG9d2roqIqAtCkZs6a3r8Aml0biApgO/i0kKsgcDbrkvZnOhunNggaMx+Y+AULwAnNOTrQqayhCsj0WCRdFW7wE9/dO5CusJMebGf90g75xgoZrbZu1bFjqZLbAPpFF4KrAp3h/AcffmLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRycPtJy; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRycPtJy"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c79c7ba8cso86776c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443580; x=1777048380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC+iWM3xttVqCKTbazgg1uNec6BeUwe65zeKYKQox80=;
        b=DRycPtJykx3+fBjkLXoJUeVKLb3ZfEToqWVnwHvIiZbQrHOmqn/hyeOILH/yDG7O8F
         GJfNlgZEKlrHFpgi91jaf/obNPem5KxtX9zR/iCAgIE/xAXKVshF+RYMb8Gx2GYP7yjc
         UKz/CS8m2giS8fwfu3tjwyz3dPctsfZWnJ/LCJejj3GlsZ+rfQxTKH8HuJAZeiayVc5N
         NLCe3Afo+1Lz+OuBCQSYJpguXb56W0xnPNmeOFwTMs4WW96SIvCxYuIK+3+waOpEBPbz
         /m9a2QPSz8az3b4lOMiIbGoTsi78akBghxeYkuWsry+5JOs0xEirWV3mxpBAagPKEpT+
         XDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443580; x=1777048380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kC+iWM3xttVqCKTbazgg1uNec6BeUwe65zeKYKQox80=;
        b=fGSyAqee5EdTcZMVVErXrrGlitKqt8lSqogLZ5cx9EpOklS3fpOSLM4ZANVa0fqk/j
         VaOr2q660lpvuVDO1G5UJFNFWTeSW57CmPymewgkt9CkHj287Ir2aaunDryJcOJ4Z+F3
         WaLVSCVTtMRQxuF4UK1QoFQ1t2XGOPwtsOmIb9lsB+/EiV76RKPYHYkEfiDOq+ScfsbR
         dfgakM++w21esoCZORQWvmc063C4acbDGjXxofpwMRuTqCOpSmTCzWhRQcUXoAc6scMF
         9whXjVoM72z3LvanvN0G0UywJeQGEWXyBxrSOtdmbBpuF1Jm7rSh5RTI6GJWa8X8PuJa
         EICQ==
X-Forwarded-Encrypted: i=1; AFNElJ895QAq6XWUjkO6CQkSgahOSSnomUZXkWvgYk7gIdP+6nBzh0iX2Jc1o2bmSEISo2ipFyr24T2mo3rUvyDZ8NHUAHJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzsXbPngf1gd3RHsQspKnR8nnIZXi8j9ASWu4pNRZpHOKuZ299v
	Nfp0X3Q/+vLtqbT26nsdBI4gyvklhKjg0203PJ7U++V195xD5KlHQzGp
X-Gm-Gg: AeBDieslK6KO5Lv0XI/t87I+Ob1TLFTgUCtCYuYf9lw1uWFsTgv6coq45kUWjVSFDUb
	K1qALP5iX4RU75+OZOVTM6yyOYyYAe8Yva+gASabJBdNhrGiAhQUbNtqB1e8w9Y9gI/SWsHa54S
	Z/CMjBL8OMLNmox79mB8EUCdxDyp/wQw5MNzcBWMfw+myy4EZkO8QC/qZHH0lKNBeBzlGINnksS
	KCY3Pxi5i4orZ4mam78oCPnM9dbmS6f8GN7mWJzUYJb76vS2KovQQ3kQQBsUjveO2eWW0D0exnD
	x3iOWRcKLHmWnlJivEyr8/ATDVuGnp42rtpmdNfdqNAQaChbYq4sVAznlZzbcG5SBoAL3pdce5i
	4qcil8xxXmi/EHKp2i5/hpHIiBTfJSxFCxuf+1VeSdnxgs/hpLZ9KXvP9ce8htQ9pJSCQ/rSZBp
	oeJwhPb9epHL9qG+kWJxCZ17fvMCbcCOAYa0H6gfUsfNuIEDqXSTV31Ns4BoIPhKvvt8FRJjQ0w
	dJNp3sj
X-Received: by 2002:a05:7022:4191:b0:12c:427:dacf with SMTP id a92af1059eb24-12c73b05ceamr1418713c88.10.1776443579756;
        Fri, 17 Apr 2026 09:32:59 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:32:58 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v3 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Fri, 17 Apr 2026 09:32:47 -0700
Message-ID: <20260417163252.15603-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v2:
- Patch 2: Replaced the GNVS AML scanner (rejected) with a static clock
  consumer list in int3472_tps68470_board_data.  Adds n_clk_consumers and
  clk_consumers fields to the struct; probe uses them when present instead
  of for_each_acpi_consumer_dev().  All other platforms are unaffected.
- Patch 3: Adds dell_5285_clk_consumers[] (INT3477 + INT3479) and wires it
  into the Dell 5285 board_data entry.
- Patches 1, 4, 5: Unchanged.

Background on the _DEP issue (patch 2):
The BIOS leaves GNVS field C0TP at zero, causing INT3479's _DEP to resolve
to PCI0 rather than the INT3472.  As Hans noted, the i2c-INT3479:00 client
is created correctly by the ACPI+I2C core (PCI0 is available), so the device
itself is present.  The only visible effect of the broken _DEP is that
for_each_acpi_consumer_dev() on INT3472 misses INT3479, and its clock
consumer lookup entry is never registered.  The static clk_consumers list in
board_data fixes this directly.  Tested without any GNVS modification: both
cameras are operational, confirming no ACPI table patching is needed.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working in
Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477 and vsio power supply

 drivers/clk/clk-tps68470.c                        |   2 +-
 drivers/media/i2c/ov8858.c                        |  23 ++-
 drivers/platform/x86/intel/int3472/tps68470.c     |  35 +++--
 drivers/platform/x86/intel/int3472/tps68470.h     |  13 +-
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 176 ++++++++++++++++++++++
 drivers/platform/x86/intel/lpss/intel_lpss_acpi.c |  16 ++
 media/ipu-bridge.c                                 |   1 +
 7 files changed, 254 insertions(+), 11 deletions(-)
