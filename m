Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198C3890FD
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701181; cv=none; b=JxyZ0PDGSEFNJt5QI0x/GnJUFQh77D8krzYHW83XhNtQwXqSiDsYBbScb6X7SuHWIwSrgc5sr0ldiO8W9/uLrH4DukoseSj7Kd7y4wOhrGDsSx1IH2nlvln9A3tBJqWstx6ODflDAytAOnXLdATGe7UacAoPplzJIYfQH2NY4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701181; c=relaxed/simple;
	bh=lOG0qdRrbvNUzFIv/izounAcfIelTz4WVc2Gvfwknu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwURKhvdDl641yl/fmRL5WQHaZLOAfbtPMQa9rOtVaNax8zpZWtAeVieop4XoEos+FcjI8Ql4QG3eX5//gC3ShTa4exYSfywFCs8XgcyE+zbihB+i9oyFWi6gJuyizyhTpPBOSmE358/HXKWkMDLbrrjrc5WchhHlblMvWo5/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fusgMZMu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fusgMZMu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba17c8cfacso73105885ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778701179; x=1779305979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QadpiF3xBRLrL9yrWIqMtNvEZqGHEtKVC029NeDyX/0=;
        b=fusgMZMuxuatKsyOuO5ztWd17LuBb0nvKkx6ICzVY7+bnn89H0ZDgneZ8W44vKv2AD
         ssy2XAqDpv/buh8ijtt3qsuDzsEfBIxCUwLCslx+qnrDMhpJwl4uqD2ZsctMEqDXNlkU
         KIkjVzFXCYbpEdjjEpJfd6cKEqmxzThIKLn5MATxRp1KNOM+q6lKiviV0jpSERW7C990
         V22p+cMoSrdgFHdCnm72Dw3BWidAlbdueIeYYxgyQL25bNcywcOyD2vynK2DUQTlmIBk
         ke+FHmzmbD0p4hEOIwuL9S9pU3KU2S0+AdtF+0XmabEQ2oC4Jsjq1PAry4phvecYIZq9
         XBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701179; x=1779305979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QadpiF3xBRLrL9yrWIqMtNvEZqGHEtKVC029NeDyX/0=;
        b=or/rkIg/fLihVHCfhuOkToOb71ZzrR0Xflqt2kBD81Wa5IZmZ8QwSbvmyRSqK/a5vh
         mZmZfW7FgQvOAYMBK8b+YwklFCNL3IMsMTiv8Gru+XNrQD7DKt+WsSJGPYlo9pPv2yWB
         SeF6MxEr6aT5nSsyO3ckNYARyFGc7O9k+Euzb3AF/raJXHU3LGpwvgSEbpF9Q+v+dzwE
         kGDTWmLEuG9ah7hmErtg3dnOpxk6BS1YL26zwC/WIhyy99dEbIcRUdNcOYOz6WFFLJMp
         dirEEzLO91T4f0xYE1FfGhZ1+O8urpeCcwcSroU7BrdlBZIkPSbEA5If0E+cpROkkuZx
         9d4w==
X-Gm-Message-State: AOJu0YyEn8eHX7F0wpHgL7+7hQG4GsVt/hq44wX4ZdtR/NIMPdU+c+0v
	InagmZs+XZMN+W3JIXhB+LyNB0/cX/aZxl+AFQ+dktddEJv/0J2H6Diu
X-Gm-Gg: Acq92OGmOMlkUxkrT1Co4dC8+L5gXgSCZbLwTpiUq9B2y5jAY4L8N9cO90xmOmTr1U6
	BAsVcYXvKvlef6te74c/iExMXR2qKo3n/ahud1GcL/K1WHJPbmbmOF1c0jTMmd9gAFnaqCY9s4e
	NT5yT3dC2m7NcW1YeBkyiLxioZpvqfWd5rKOe7N2GizuQLT57ix2Hcj/BsExuyrmWvxM9RXpwz7
	cND0iYLYXYpBAfVupfzmp34eM0Ow+GFgziLqtsOtz+uKYnTzgowGuOw1ACAwqyLQNmE84e52T+S
	ghsP5PdFUFD+BlYoXo03HoN8vOwH+S6HWrdQRBAcIFXySjmmEFDShGkI0q4YUx0eYaWUUUGPfJ+
	seKKNva+1Rc8JWEvALb8/BvxgTTCBquSgjSGogrdIMtGyelt3kwtSQ7wZknA+uaLCsNv0O6npuz
	X24Ihgr4Cbgflzw7efFVU2QLT3aJD/fxt9NW3i7ohr
X-Received: by 2002:a17:903:2a90:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd276e6e73mr53303515ad.30.1778701179166;
        Wed, 13 May 2026 12:39:39 -0700 (PDT)
Received: from cachyos.lan ([2607:fb90:b200:b454:58a0:7e4d:a0a:684b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d659sm230595ad.73.2026.05.13.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:39:38 -0700 (PDT)
From: foobisdweik <dweikmferris@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	foobisdweik <dweikmferris@gmail.com>
Subject: [PATCH 0/2] hp-wmi: Omen 16-b1xxx (8A13) support + per-fan pwm
Date: Wed, 13 May 2026 12:39:14 -0700
Message-ID: <20260513193916.84673-1-dweikmferris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Two patches against drivers/platform/x86/hp/hp-wmi.c. They are
independent but both required to make fan control fully work on
HP OMEN 16-b1xxx laptops.

Patch 1 adds DMI board name 8A13 (OMEN by HP Laptop 16-b1xxx) to
the existing Omen thermal-profile and Victus-S DMI tables. The
firmware exposes the standard Omen PerformanceControl WMI feature
and uses the same legacy EC layout and GM2D/GM2E methods as its
sibling 8A44 (Omen 16-n0xxx). After this patch /sys/firmware/acpi/
platform_profile and the hp hwmon device come up correctly on 8A13.

Patch 2 promotes the per-driver pwm setpoint to a two-element
array so that hp-wmi exposes pwm1 (CPU fan) and pwm2 (GPU fan)
independently on Victus-S-capable boards. The underlying WMI
method (HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY) already takes a
two-byte buffer and the EC honors per-fan setpoints; the driver
just hadn't been wired up that way. This is the standard hwmon
shape for multi-fan systems and makes fan-control tools such as
fancontrol and fan2go work out of the box.

Tested on a stock HP OMEN 16-b1xxx (BIOS F.23, 12th-gen i7-12700H,
RTX 3060) running 7.1-rc2 + these patches: platform_profile
toggles cool/balanced/performance, fan1_input/fan2_input read
independent tachs, and writing pwm1=60 + pwm2=200 simultaneously
drives CPU fan to ~1600 RPM and GPU fan to ~5700 RPM (verified
both via hwmon and direct read of EC offsets 0xB0..0xB3).

Evidence from dmesg:
[    0.000000] DMI: HP OMEN by HP Laptop 16-b1xxx/8A13, BIOS F.23 08/15/2025
[    7.643551] hp_wmi: Registered as platform profile handler

Evidence from sensors (manual control mode):
hp-isa-0000
Adapter: ISA adapter
fan1:        2700 RPM
fan2:        2800 RPM
pwm1:             62%  MANUAL CONTROL
pwm2:             64%  MANUAL CONTROL

foobisdweik (2):
  platform/x86: hp-wmi: Add support for Omen 16-b1xxx (8A13)
  platform/x86: hp-wmi: Expose independent CPU/GPU pwm channels

 drivers/platform/x86/hp/hp-wmi.c | 53 +++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 15 deletions(-)

--
2.54.0

