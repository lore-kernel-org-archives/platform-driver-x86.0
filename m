Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008313E8C65
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 11:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743563; cv=none; b=Q64gqIHFzRPrHz1JmDeoXsq4Ar+pf2qnMp9RTnjUcLj+R8u4HwEAJ6Scvw26xc/uWUuZM4U1KY0BiYg+ZbmwHTGxoAXydyG6h27IpouALWELFWqaxL4LHsdkkOwPjgyzteLMnEa0X4V23lTcxuJ4Wb9rgL+nejxwBXZnbYtoF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743563; c=relaxed/simple;
	bh=7BqKG7UiVkdBPu4leBjvfoeJEM/OjD3mE3MOq1woPE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJ7/V1Hf75Bc21BzoydfGYWuYxhFNKdp5+qwEvK/Td8920WnNQ47BylHD81jY4p8lvQ7degCEibjgV+9zPHCq8q9FfV3HM3Ah2GvAH7Fy2uTCyna2cmC/Zvbx3HbIbYc447d0RMxJ1llsFeY0j7sOUFe/r3r+auWkxckAJFICVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZGS33zd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZGS33zd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47db714766aso1146026f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743558; x=1788348358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJ6gIRxKV4tPAnIKrYL+EnKWhihLd/yRb7gXeIxetG8=;
        b=OZGS33zd+XQV0XwOAT1yWKV0LO+MOOn9RJ8LCEJmgGH+gDXFJ3T3m2KzMHxuJnIeX1
         JaNJORSq8uT0jT5BAnJnkfHUF5PNJ9QJDe/JOqhU+clQqCqJaZ9f7lcYOGUEcEztlkUz
         4avxet3Kur3/0E1qupBZSSK3BWtdNXX2dh2W1JMkhjDngFsfDvvDM7xnbMo/bFmdzDl6
         Q3EOblkBSahOYZu/404IAlO9RlH+1Meukac/h3Tht24725bKIDM7YwDuT2inQ+l6vl2X
         62+hlxgrwZBrmcTrL8xE96/k9GG5SObkZfQKudWS1WxYxS6fiTZXqVtW2LZTCSz6L8Z0
         CvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743558; x=1788348358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJ6gIRxKV4tPAnIKrYL+EnKWhihLd/yRb7gXeIxetG8=;
        b=f/TMG1d0hXk9pC6/v4JXcOoqJ3EoVYRd7tDHpyi/qya6JqNa0Ly8ue97rrE0ARgi+6
         9+jqofkvw+Uk4Antu+sVyz9mrDOGXZN7pGbFZwl5zl6rdHIQiUXYGr2gXQwohUPQf+HV
         r1WRHEP24iDFKzDGM2ziSTWwHFb90HNF2AXOESQtgAXerT7eeYvTdvl65PXjYVUkG2E7
         PT8JyA7Ouc/Xh6gquCPdtCbhVzz0HKUF36eUw48m+yaT0SCtlmrHd6Zx8onKyatrOXtJ
         RcDVix9g+hyYzH1PvQ+mv5TvlX265UzfBR3AbyW1u3k/lsD3CrIe2Q9tYx6RcMaMz8fa
         PqAA==
X-Forwarded-Encrypted: i=1; AHgh+RrjLWZBtydOgTIhvDrzR4G4ERZ775MWrLbQm1hbdZfI+tR4SsiQgDEvOQlXJF7qavU/BPC5h9+tEZjnTgclC9dP7h98@vger.kernel.org
X-Gm-Message-State: AFuF++kAzf3mBoQJYx+MrywAda8lcCI2IsfDSA0MqUGVDXPqj3rAznV8
	QEUPQYm3z7ELu0J5d+cXBHEYSV75N2YhaLWQV+cNcW7EcXRwDjDBSfAO
X-Gm-Gg: AR+sD13IzS6WzNSM/PxZg7pnYaqYIBEUefbxVr225ogZXH8At02EVjmxyCgOlkp1aDP
	jaAGA1KzR3SLpt2EvIB/VFi9LXnmO1MgtbWQNKtbf7mzNDFLBtZy3y3CFqb6zk9vJRq38XAy0nI
	UuIllbhFjqXrVxaH+5IUgWZIEnRBaiBSvNApzi+nASLuD8CrVUb74f3OO0w1oEO5aSi1O0LAEyt
	jQ/2OpiQ7/3AxU3Bo1F/AlCG5RL9R5M1RZoXrqFRGLuj0HinFdwFIOd+b6XcsSkM5e46wVbcVZo
	zmRpQ6Ea8NU2f1AInNbbH5cpgXx87Klsk8RtrWSMXKTa0gW+81JyNn5+PHQ3sr9jaM8juLmeROa
	1ojcUk9Zd01QzHWT61uUcrCoVYIyw4OeIh1ecrg3nxPcfZQM82HrP9MlXGjTR6rIfue/wwhsity
	+EGOsQm+6mavMT5bKUTwGpjboptQn4DxJmB/ChUefaR1sYs34sj0BGoT+qo+e1rkAEwAs=
X-Received: by 2002:a05:6000:991:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482e6587fc4mr2813711f8f.11.1787743557842;
        Wed, 26 Aug 2026 04:25:57 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:57 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v8 0/6] Enable cameras on Dell Latitude 5285 2-in-1
Date: Wed, 26 Aug 2026 13:24:45 +0200
Message-ID: <20260826112452.13539-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Per Documentation/process/coding-assistants.rst: this work was developed
with significant help from an AI coding assistant (Claude Code, by
Anthropic). I used it to help reverse-engineer the ACPI/TPS68470 bring-up,
iterate on the board data, and draft these patches. I have reviewed and
tested all of it on the actual hardware and take full responsibility for
the result.

The series spans two trees: patches 1-4 target platform-drivers-x86 and
patches 5-6 target linux-media. All six are needed for a working system.

Changes since v7 (addressing Andy Shevchenko's review):
- Patch 1 (intel_lpss): rework the quirk to be data-driven. Match the
  machine by DMI and the device (INT3446) by ACPI ID, carry
  QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data, and apply it to
  the per-device info in probe, mirroring the PCI counterpart. Drop the
  duplicate spt_i2c_info_ignore_conflicts struct and the machine-specific
  dev_info(). Fix the include ordering.
- New patch 2 (int3472: tps68470): split the int -> unsigned int loop
  counter change out of the clock-consumer patch into its own cleanup.
- Patch 3 (int3472: tps68470, was patch 2): trim the commit message; no
  code change beyond the counter split above.
- Patch 6 (ov8858, was patch 5): use a C99 initialiser for the ACPI match
  entry and drop the comma after the sentinel.

On the open question from the review: I kept the per-table
gpiod_add_lookup_table() loop rather than switching to
gpiod_add_lookup_tables(). There is no gpiod_remove_lookup_tables()
counterpart for the error-unwind path, the board data uses a counted (not
NULL-terminated) array, and the singular form is what the rest of the tree
uses, including int3472/discrete.c.

Earlier changelogs (v2-v7) are in the v7 posting:
  https://lore.kernel.org/all/20260819140107.1329091-1-tchatard@gmail.com/

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04
(kernel 7.0.0-30-generic). Both cameras working in Zoom, Chrome, and GNOME
Camera via PipeWire. Also independently tested on the closely-related Dell
Latitude 5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by
Vitalii Tytskyi:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

Thierry Chatard (6):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477
