Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1921FF5B
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793236; cv=none; b=U6ABl7nNgtoJNnlVyUstB2gxSwE83iYoDJZDIdmYU5yAu5Qi8/psL0BovzjeJBZ5xVdx2wPA4lA0cwsFY1u28dl36nX6LJotYsQ5Uk5Zd4dQhiIrBxJIu5FeBj4kN+D/mmiKooAuTfZguFSzegMaBJAuHUzvRNOBaaZjBtTwwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793236; c=relaxed/simple;
	bh=Xn89Z7LlNJRh+TRBmYqTnWl1iqTuZgasa4aVYS0pnY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDMk2r2l5lJGitCQJCd4F1YLgT4VsqeqkbLdsf1hTtacUltjJTb0YVWiRnPHjz6tJUt+qVgl8TuuDa6j4EWEcIPyQX+5NMVJxh6s9jgqQ1d6zT3isYOsdt+HKx6uUR2U2X0uOs89HzXayBYB0bK1RlO8t6ZS/khnJyk91HShxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKXlynqT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKXlynqT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7502466b3a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 15:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793234; x=1767398034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0vyeocCV33HEg26/iuFmDPXpUFL78V+AfewKJRB7/s=;
        b=GKXlynqT5B+YeAXWwxYel6zmA7CxjIy6K2w8fxPwhLlrU8/fT9G8CsrsgiSQJmRvkQ
         N00CiWKzTMIPGt0XEDMpKK4A5zuqcCwPKiaRm0tdV5/nXdWLPMRW1dzPekVYH0ABlGao
         gh7H5EYEjWUMMjKpps3pcIylZO0l73Qs2bKVV5eDoP9dDNHp1kRwbeiC/3csOkV3Zh9Q
         Lq12RWMFR7G7Aiztd0qDa67du4psGEkCRm2qBmJDiHYPjbSEo4mjFc1+3IST4uAs53hM
         LsBUd8M6ZjM5BmLUq/DtldeVPGDqyaZInGfvQePb2YGxLc0wyegNe4mP5ZJ0vNfhBwYh
         Murw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793234; x=1767398034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0vyeocCV33HEg26/iuFmDPXpUFL78V+AfewKJRB7/s=;
        b=VlL0yvvmUnjTBHbU/Ppa2sqgRTiyauY34YjJG8pEbE5fuuDpo6DS58+xPsFoYW9A83
         +FavmUSQg1x1cMRIBTexbcGm7xx/ds5YjO2jniFNd1sPES9FM46d5fnoMeFS+Eir0cdL
         Vh9ZC28WRLjq10S5IuR4ygfl3qvTlOl+MlQDJSyCTkSJhheUxDvJfVX6mHdPZsHx821Q
         TK0cbTN1i65hbcbPOR9mAIdfiQ53CIWMJjM99sxE50kq5R0PQbLoh8eI/reLjO4CD6S5
         aMkKT4p9VAwq7O6ss68RJgn+N51QMsqlScUA7uYFp/rkBDVSFFlWtydRDGUXsm1m0Xd8
         NK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa2R/7M8Zt13Vmk2BdEafS7J9UpR8zT5mNJBL60IfhEEhFxEhvp5feI/zEGFaLdI8o9NyBrGui90IzXBQgf99fX6bm@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAHhEnvwXIDONsLEojfM9SA8VV9Ce0GCG6+/n/3XPP8wNak20
	kj15IormTvtXvVWhXyuUsJZkOQNSavgMSHlEX8JDwXUxy6S8JZ++pvWw
X-Gm-Gg: AY/fxX6r+EuFSA1jziiq9al5mNCAtewoZiI4AjUym1aMcMl9ySwWm8EVk0DvyT3L4TO
	4tBJqLirU5HV7EpX60ouWfcJQJArFP2lNaMBbzuxdJxaGoV+yktcPw+bmnqwKL/ZtEo6L3oYTJ8
	fAfnN+3EWXYrNQHPXKj+3QRpG97TpG8kFrbZ/EuVPJ6Y2uyO5J5AOICKVD0PyBMxSXYSA2FKdrv
	skI9DTjqtJbHwtk+Gw2TlxWDIQQV2G9qnISMpVsRXx57U7v5TdEbZAobWhl7Tfbsuu++fjWzXOJ
	6gxmpQTwYG8l3HAnsifVzjxYrzZmeFoHB1e7s1EqeGpFgto1WL7U907y2U/MZK+aqs92CFzbSoJ
	HiPoJ0c157MGeSPJsFVSF8rxRtAfSjxiYL6/021Oa67j0w41kVQGBb6WGvGHm9YE2MANhIefnI8
	AI3SUnMVDhIaw2JQ/9Qn5KZfAAvLkjHXjyngyU6uuUS2S1nAaVMCjYPVf35zkTCyVu3g==
X-Google-Smtp-Source: AGHT+IEtpUCwGLlNLxKyNXIMX8+tzq7l0KJnLDuBLqpsPtLogCjtkzSZeYADQRlUzu4Ad7mZhlnfvA==
X-Received: by 2002:a05:6a00:4512:b0:7e8:450c:61c8 with SMTP id d2e1a72fcca58-7ff6667c5a7mr22939512b3a.56.1766793234329;
        Fri, 26 Dec 2025 15:53:54 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:53:53 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 0/3] TrackPoint doubletap enablement and user control
Date: Sat, 27 Dec 2025 08:50:58 +0900
Message-ID: <20251226235101.106451-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for TrackPoint doubletap with a clear and
simple separation of responsibilities between drivers:

1. Firmware enablement (trackpoint.c):
   Automatically enables doubletap on capable hardware during device
   detection.

2. User control (thinkpad_acpi.c):
   Provides a sysfs interface to enable or disable delivery of doubletap
   events to userspace.

The approach follows the KISS principle:
- The TrackPoint driver enables hardware functionality by default.
- The thinkpad_acpi driver controls whether ACPI doubletap events are
  delivered, using existing hotkey filtering infrastructure.
- No cross-driver APIs or dual filtering paths are introduced.

Changes in v5:
- Rename sysfs attribute from doubletap_filter to doubletap_enable to
  reflect actual behavior.
- Fix inverted logic so events are delivered only when doubletap is
  enabled.
- Suppress ACPI hotkey delivery instead of injecting or filtering input
  events.
- Register the sysfs attribute via hotkey_attributes[] instead of
  device_create_file().
- Drop unnecessary helper wrappers and debug logging.
- Update Documentation to reflect the new naming and semantics.

Changes in v4:
- Complete redesign based on reviewer feedback.
- trackpoint.c: Simplified to only enable doubletap by default.
- trackpoint.c: Removed all sysfs attributes and global variables.
- trackpoint.c: Uses firmware ID detection with deny list.
- thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
- thinkpad_acpi.c: No cross-driver dependencies.
- Documentation: Updated to reflect simplified sysfs approach.

Changes in v3:
- No changes.

Changes in v2:
- Improved commit messages.
- Removed unnecessary comments and debug messages.
- Switched to strstarts() usage.
- Simplified firmware capability detection logic.

This version addresses the remaining review feedback by correcting the
naming and logic inversion, aligning sysfs semantics with behavior, and
fully integrating with existing thinkpad_acpi hotkey handling.

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
    double-tap
  Documentation: thinkpad-acpi - Document doubletap_enable attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 ++++++++
 drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 107 insertions(+), 7 deletions(-)

-- 
2.51.0

