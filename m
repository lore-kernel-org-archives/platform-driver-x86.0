Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0592E3B637F
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239689; cv=none; b=s82Hg0k7kK6yS9CF6Y/oADxxZnf1DZHXPwhJu2GpoR3IxaDBMhFPOnqa7BAXd9apyfxqyxWc4h7doEASCTBIgUjd7B/woGghk7KPbslkjOgQve1Vg5i4J4x0wvLwGQIeVmL1erqmcr1xcc0ZK0DNv7QRnexB9+zDXcJysPQEagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239689; c=relaxed/simple;
	bh=glYFtw0ChtLtDYmcz54w9/XuNBlw2ZfDfkh2yo0dps0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXw0BBgnvc+tXYoBdgdANxAGVMofD5amDdobTqwqiQ/ohsW8mfo0Waa/LXdUVdCEsnZK6U+RKYJNpBpkSLqUXpQ15dzVIDFMRtnKX5pXWM7ugqodhqU1ZFxLggxk61qDCxaOo8LWQDFwNgEMHQbuSTcpvRR8sYXVtVPKfC2b4bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+i1VXZW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+i1VXZW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae43042ea7so119123225ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239687; x=1773844487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=px8rXXbWKUNDQohmf88G75oyBAXUA4ooe+T2HAoytjc=;
        b=M+i1VXZWQAMhuV2da01DMt/egTMffFR5Y5H3SS6CFa5HFcDQ2CY6U07ClTNlK3JRTX
         PIXugskVfvFQnz0BpvdrxnQf8LYxDYxfO0WYcTQyRtj4f9vcW6TQbqAxVTz6UT5tss6A
         rgI+doj7xTBJnNrgenrQd5oYsf3q6BfMqYwDCzrt34fwABxg3fzeOCfgLMyabqIbM9O6
         NHqXZus7IBHsSN/QKix3VkWTeWib4MzBcL7KrqUmE6pm54f3x3O+7NDRis8oeLrxv8l/
         +cr7vNoKlYG07H7Rlh8E2PzG9la/ej02bhvJW1irCfGIewuFIygJ7Yj2UjXBwqHth2U0
         JEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239687; x=1773844487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px8rXXbWKUNDQohmf88G75oyBAXUA4ooe+T2HAoytjc=;
        b=c1nMG5iXp+6OyPVETcg6swMJPCXRTvl729i6nDA7jW5LkREr7DSqrT/7suy0LKpbGL
         orT9selJAiLKhYht6WJ134d1sQyq+D7EwwXZiK7IZYc8EwsztOFd/gyZcMviNqqQoAbq
         4AhX1sQeFnP1gOsxUpgKsvSGw8u9F29pgGsecOZJeqp15XBChmoSyMm9SQfawHuTOP+1
         B1cHuh3mNd9fFD5QJHEV6Ox0Ct5lD2DDgpenfLRpMCuwPY2ROGXERNhan/wNqrkavI+O
         E/u3+EV5yUVyW4W5uUsCYRXT8tE9HzUeR/3mlk2riQleggkQ7x8tCg6BIUHekrbj0IJh
         cjDw==
X-Forwarded-Encrypted: i=1; AJvYcCUOWvWp+uS3UNVSWPPHSXJNAM9q0VAtnasbauqDEYzBCvJBjzw79rVGJOCNhfwe2rQZOWvm6YJisgbZSVsLuaLXN2yr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvsr4ipQ3T2cZf8/H2MqRKtbWbiEHc2YbkSE7CG743SZU2fuwK
	KtI2ZssTy/8F/TcEF2C9Yparf0753fnGSI/1H0u3nEpYzvF1IHT0aAwE
X-Gm-Gg: ATEYQzyOzSVcxvtRpl1us30WdMEEMLic7SNRebHhTdcmXUPrGYXRypgcyem9lnPfjQz
	T3fmjnsFw5IIC6cFIsALGue8VQF6WLsWq0TKo5WU4juaNFRCrecqvopOePzwPwxIQXS5PLTaoD2
	bTMkMYClS0W1Q+7rf1NFRiE2JdXaygtUWc+iUponAHxX6sexfMWCYbinz+QbGnJTJxgr4FdcA6l
	pciBUWdiSFQPKQ7ISz0vkB+2P6QuMTLbD5luGX1JlaSJENinJspNYA9GRuV0M7ncEZZa8xLiX55
	y2lJlSYHSqQhEEHPExnt/RNZggeqEIEPL71mSXJGAauTQouRzyikV5MINjEs1vdJC9feKmt4/Xu
	v8ejZBnognJLF1IVHsZIs5JDiOGfJOhNUZJk15D1BchZbShUWjz2HnJ8+o8GfFDa/0JJ+9Rz5VK
	4qDYFYJseBT+rq2dMToHXpskNMPDyDifwrGGh2iPViZlYYjqFHqaCHu/XXISQ=
X-Received: by 2002:a17:902:f70a:b0:2ab:230d:2da9 with SMTP id d9443c01a7336-2aeae8dce39mr28983155ad.48.1773239687170;
        Wed, 11 Mar 2026 07:34:47 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:dd5:d7ff:1c94:3624])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e070sm26399235ad.48.2026.03.11.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:34:46 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v8 0/3] TrackPoint doubletap enablement and user control
Date: Wed, 11 Mar 2026 23:31:41 +0900
Message-ID: <20260311143144.482145-1-vishnuocv@gmail.com>
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

Changes in v8:
- Added linux/array_size.h and linux/strings.h to the include lists for 
  ARRAY_SIZE() and strstarts() respectively.
- Better formatting.
- Fix indentation in doubletap_enable sysfs documentation.

Changes in v7:
- Removed unwanted comments and logs

Changes in v6:
- Documentation: fix formatting of the doubletap_enable sysfs attribute
  description (separate "Values" list)

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

 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++
 drivers/input/mouse/trackpoint.c              | 46 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 107 insertions(+), 7 deletions(-)

-- 
2.51.0

